from django.urls import path

from .views import message_to_user, message_sent

urlpatterns = [
    path('', message_to_user, name='message_to_user'),
    path('sent/', message_sent, name='message_sent'),
]
