from django.urls import path

from .views import (add_quote,
                    QuotesList,
                    upload_quote_picture,
                    delete_quote_picture)

urlpatterns = [
    path('', QuotesList.as_view(),
         name='quotes-list'),
    path('add/', add_quote,
         name='quote-add'),
    path('upload/', upload_quote_picture,
         name='quote-picture-upload'),
    path('upload/<str:filename>', delete_quote_picture,
         name='quote-picture-delete'),
]
