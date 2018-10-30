from django.contrib.auth.decorators import login_required
from django.urls import include, path

from .views import DashboardView

urlpatterns = [
    path('', login_required(DashboardView.as_view()),
         name='auth-dashboard'),
]
