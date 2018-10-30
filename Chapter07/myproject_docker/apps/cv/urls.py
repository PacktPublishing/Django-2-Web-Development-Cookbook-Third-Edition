from django.urls import path

from .views import download_cv_pdf


urlpatterns = [
    path('<int:pk>/pdf', download_cv_pdf,  name='cv-pdf'),
]
