from django.shortcuts import redirect
from django.urls import path
from django.conf.urls.i18n import i18n_patterns

# from .views import movie_list
from .views import (FeaturedMoviesView, CommercialMoviesView,
                    IndependentMoviesView, TopMoviesView,
                    MovieDetailView)


urlpatterns = i18n_patterns(
    # path('', movie_list, name='movie-list'),
    path('', lambda request: redirect('featured-movies')),
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
)
