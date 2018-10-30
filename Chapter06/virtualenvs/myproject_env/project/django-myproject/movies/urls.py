from django.urls import path

# from .views import movie_list
from .views import MovieListView, TopMoviesView

urlpatterns = [
    # path('', movie_list, name='movie-list'),
    path('', MovieListView.as_view(), name='movie-list'),
    path('top/', TopMoviesView.as_view(), name='top-movies'),
]
