from django.contrib import admin
from cms.extensions import PageExtensionAdmin
from .models import CSSExtension


class CSSExtensionAdmin(PageExtensionAdmin):
    pass


admin.site.register(CSSExtension, CSSExtensionAdmin)
