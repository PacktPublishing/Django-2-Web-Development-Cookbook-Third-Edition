from django.contrib import admin
from django_mptt_admin.admin import DjangoMpttAdmin

from .models import Category


class CategoryAdmin(DjangoMpttAdmin):
    list_display = ["title", "created", "updated"]
    list_filter = ["created"]


admin.site.register(Category, CategoryAdmin)
