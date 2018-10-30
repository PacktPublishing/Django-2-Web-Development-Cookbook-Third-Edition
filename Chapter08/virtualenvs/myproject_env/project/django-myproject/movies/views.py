from django.conf import settings
from django.core.paginator import (EmptyPage, PageNotAnInteger,
                                   Paginator)
from django.shortcuts import render
from django.views.generic import View, DetailView

from .models import Genre, Director, Actor, Movie, RATING_CHOICES
from .forms import MovieFilterForm


PAGE_SIZE = getattr(settings, "PAGE_SIZE", 15)


def movie_list(request):
    qs = Movie.objects.all()
    form = MovieFilterForm(data=request.GET)

    facets = {
        "selected": {},
        "categories": {
            "genres": Genre.objects.all(),
            "directors": Director.objects.all(),
            "actors": Actor.objects.all(),
            "ratings": RATING_CHOICES,
        },
    }

    if form.is_valid():
        filters = (
            ("genre", "genres",),
            ("director", "directors",),
            ("actor", "actors",),
            ("rating", "rating",),
        )
        qs = filter_facets(facets, qs, form, filters)

    if settings.DEBUG:
        # Let's log the facets for review when debugging
        import logging
        logger = logging.getLogger(__name__)
        logger.info(facets)

    paginator = Paginator(qs, PAGE_SIZE)
    page_number = request.GET.get("page")
    try:
        page = paginator.page(page_number)
    except PageNotAnInteger:
        # If page is not an integer, show first page.
        page = paginator.page(1)
    except EmptyPage:
        # If page is out of range, show last existing page.
        page = paginator.page(paginator.num_pages)

    context = {
        "form": form,
        "facets": facets,
        "object_list": page,
    }
    return render(request, "movies/movie_list.html", context)


def filter_facets(facets, qs, form, filters):
    for facet, key in filters:
        value = form.cleaned_data[facet]
        if value:
            selected_value = value
            if facet == "rating":
                rating = int(value)
                selected_value = (rating,
                                  dict(RATING_CHOICES)[rating])
            facets["selected"][facet] = selected_value
            filter_args = {key: value}
            qs = qs.filter(**filter_args).distinct()
    return qs


class MovieListView(View):
    form_class = MovieFilterForm
    template_name = "movies/movie_list.html"
    ordering = None

    def get(self, request,
            featured=None, commercial=None, independent=None,
            *args, **kwargs):
        form = self.form_class(data=request.GET)
        qs, facets = self.get_queryset_and_facets(form)
        page = self.get_page(request, qs)
        context = {
            "form": form,
            "facets": facets,
            "object_list": page,
        }
        return render(request, self.template_name, context)

    def get_queryset_and_facets(self, form):
        qs = Movie.objects.order_by("title")
        facets = {
            "selected": {},
            "categories": {
                "genres": Genre.objects.all(),
                "directors": Director.objects.all(),
                "actors": Actor.objects.all(),
                "ratings": RATING_CHOICES,
            },
        }
        if form.is_valid():
            filters = (
                ("genre", "genres",),
                ("director", "directors",),
                ("actor", "actors",),
                ("rating", "rating",),
            )
            qs = self.filter_facets(facets, qs, form, filters)
        return qs, facets

    @staticmethod
    def filter_facets(facets, qs, form, filters):
        for facet, key in filters:
            value = form.cleaned_data[facet]
            if value:
                selected_value = value
                if facet == "rating":
                    rating = int(value)
                    selected_value = (rating,
                                      dict(RATING_CHOICES)[rating])
                    filter_args = {
                        f"{key}__gte": rating,
                        f"{key}__lt": rating + 1,
                    }
                else:
                    filter_args = {key: value}
                facets["selected"][facet] = selected_value
                qs = qs.filter(**filter_args).distinct()
        return qs

    def get_page(self, request, qs):
        paginator = Paginator(qs, PAGE_SIZE)
        page_number = request.GET.get("page")
        try:
            page = paginator.page(page_number)
        except PageNotAnInteger:
            page = paginator.page(1)
        except EmptyPage:
            page = paginator.page(paginator.num_pages)
        return page


class FeaturedMoviesView(MovieListView):
    def get_queryset_and_facets(self, form):
        qs, facets = super().get_queryset_and_facets(form)
        qs.filter(featured=True)
        return qs, facets


class CommercialMoviesView(MovieListView):
    def get_queryset_and_facets(self, form):
        qs, facets = super().get_queryset_and_facets(form)
        qs.filter(commercial=True)
        return qs, facets


class IndependentMoviesView(MovieListView):
    def get_queryset_and_facets(self, form):
        qs, facets = super().get_queryset_and_facets(form)
        qs.filter(independent=True)
        return qs, facets


class TopMoviesView(MovieListView):
    template_name = "movies/top_movies.html"

    def get_queryset_and_facets(self, form):
        qs, facets = super().get_queryset_and_facets(form)
        qs = qs.order_by("rank")
        qs = qs.filter(rank__gt=0, rank__lte=250)
        return qs, facets


class MovieDetailView(DetailView):
    model = Movie
    template_name = "movies/movie_detail.html"
