from django.contrib import admin
from treebeard.admin import TreeAdmin

from .models import Category


class CategoryAdmin(TreeAdmin):
    list_display = ["title", "created", "updated"]
    list_filter = ["created"]


admin.site.register(Category, CategoryAdmin)
