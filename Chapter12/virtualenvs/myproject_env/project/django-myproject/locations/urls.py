from django.urls import path

from .views import LocationList, LocationDetail


urlpatterns = [
    path('',
         LocationList.as_view(),
         name='location-list'),
    path('<slug:slug>/',
         LocationDetail.as_view(),
         name='location-detail'),
    path('<slug:slug>/popup/',
         LocationDetail.as_view(
             template_name="locations/location_popup.html"),
         name='location-popup'),
]
