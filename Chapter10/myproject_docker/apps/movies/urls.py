from django.shortcuts import redirect
from django.urls import path
from django.conf.urls.i18n import i18n_patterns

# from .views import movie_list
from .views import (MovieListView, FeaturedMoviesView,
                    CommercialMoviesView, IndependentMoviesView,
                    TopMoviesView, MovieDetailView,
                    MovieCategoryListView, MovieAdd)


urlpatterns = [  # i18n_patterns(
    # path('', movie_list, name='movie-list'),
    path('', MovieListView.as_view(),
         name='movie-list'),
    path('editors-picks/', FeaturedMoviesView.as_view(),
         name='featured-movies'),
    path('commercial/', CommercialMoviesView.as_view(),
         name='commercial-movies'),
    path('independent/', IndependentMoviesView.as_view(),
         name='independent-movies'),
    path('top/', TopMoviesView.as_view(),
         name='top-movies'),
    path('movie/', lambda request: redirect('featured-movies')),
    path('movie/<slug:slug>/', MovieDetailView.as_view(),
         name='movie-detail'),
    path('category/', MovieCategoryListView.as_view(),
         name='category-list'),
    path('add/', MovieAdd.as_view(),
         name="add_movie"),
]  # )
