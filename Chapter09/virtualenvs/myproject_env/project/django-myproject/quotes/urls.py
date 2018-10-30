from django.urls import path

from .views import (add_quote,
                    QuoteList,
                    QuoteDetail,
                    upload_quote_picture,
                    delete_quote_picture,
                    download_quote_picture)

urlpatterns = [
    path('', QuoteList.as_view(),
         name='quotes-list'),
    path('add/', add_quote,
         name='quote-add'),
    path('upload/', upload_quote_picture,
         name='quote-picture-upload'),
    path('upload/<str:filename>', delete_quote_picture,
         name='quote-picture-delete'),
    path('<int:pk>/', QuoteDetail.as_view(),
         name='quote-detail'),
    path('<int:pk>/download/', download_quote_picture,
         name='quote-picture-download'),
]
