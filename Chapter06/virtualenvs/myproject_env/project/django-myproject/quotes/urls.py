from django.urls import path

from .views import add_quote, QuotesList

urlpatterns = [
    path('', QuotesList.as_view(), name='quotes-list'),
    path('add/', add_quote, name='quote-add'),
]
