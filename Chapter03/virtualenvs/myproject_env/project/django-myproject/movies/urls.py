from django.urls import path

from .views import movie_list, MovieListView

urlpatterns = [
    # path('', movie_list, name='movie-list'),
    path('', MovieListView.as_view(), name='movie-list'),
]
