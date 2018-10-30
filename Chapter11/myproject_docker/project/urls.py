"""myproject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
import os

from django.conf import settings
from django.conf.urls.i18n import i18n_patterns
from django.contrib import admin
from django.contrib.auth.urls import urlpatterns as auth_patterns
from django.contrib.auth.views import LoginView
from django.urls import include, path
from tastypie.api import Api

from bulletin_board.api import BulletinResource, CategoryResource
from bulletin_board.views import (RESTBulletinList,
                                  RESTBulletinDetail)
from utils.views import render_js

v1_api = Api(api_name="v1")
v1_api.register(CategoryResource())
v1_api.register(BulletinResource())

urlpatterns = []

try:
    import debug_toolbar
    urlpatterns += [
        path('__debug__/', include(debug_toolbar.urls)),
    ]
except ImportError:
    pass

urlpatterns += [
    path('api/', include(v1_api.urls)),
    path("api-auth/",
         include("rest_framework.urls",
                 namespace="rest_framework")),
    path("rest-api/bulletin-board/",
         RESTBulletinList.as_view(),
         name="rest_bulletin_list"),
    path("rest-api/bulletin-board/<int:pk>",
         RESTBulletinDetail.as_view(),
         name="rest_bulletin_detail"),
    path('admin/', admin.site.urls),
    path('bulletins/', include('bulletin_board.urls')),
    path('cv/', include('cv.urls')),
    path('dashboard/', include('external_auth.urls')),
    path('email/', include('email_messages.urls')),
    path('like/', include('likes.urls')),
    path('locations/', include('locations.urls')),
    path('login/', LoginView.as_view(), name='user-login'),
    path('movies/', include('movies.urls')),
    path('products/', include('products.urls')),
    path('videos/', include('viral_videos.urls')),
    path('', include((auth_patterns, 'auth'))),
    path('', include('social_django.urls', namespace='social')),
    path('', include('cms.urls')),
]

urlpatterns += i18n_patterns(
    path('quotes/', include('quotes.urls')),
    path('search/', include('haystack.urls')),
    path("js-settings/", render_js,
         {"template_name": "settings.js"},
         name="js_settings"),
)
