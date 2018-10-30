from django.urls import path, reverse_lazy

from .feeds import BulletinFeed
from .views import (BulletinList, BulletinEdit, BulletinDetail)

edit_view = BulletinEdit.as_view(
    success_url=reverse_lazy('bulletin-list'))

urlpatterns = [
    path('', BulletinList.as_view(),
         name='bulletin-list'),
    path('rss/', BulletinFeed(),
         name='bulletin-rss'),
    path('new/', edit_view,
         name='bulletin-create'),
    path('<int:pk>/', BulletinDetail.as_view(),
         name='bulletin-detail'),
    path('<int:pk>/edit/', edit_view,
         name='bulletin-edit'),
]
