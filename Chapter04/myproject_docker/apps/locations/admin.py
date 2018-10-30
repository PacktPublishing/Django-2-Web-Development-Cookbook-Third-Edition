from django.contrib import admin
from django.template.loader import render_to_string
from django.utils.translation import ugettext_lazy as _

from .models import Location


class LocationAdmin(admin.ModelAdmin):
    save_on_top = True
    list_display = ("title", "street", "description")
    search_fields = ("title", "street", "description")

    def get_fieldsets(self, request, obj=None):
        map_html = ""  # render_to_string("admin/includes/map.html")
        fieldsets = [
            (_("Main Data"), {"fields": ("title",
                                         "description")}),
            (_("Address"), {"fields": ("street",
                                       "street2",
                                       "postal_code",
                                       "city",
                                       "country",
                                       "latitude",
                                       "longitude")}),
            (_("Image"), {"fields": ("image",)}),
            (_("Slug"), {"fields": ("slug",)}),
            (_("Map"), {"description": map_html, "fields": []}),
        ]
        return fieldsets


admin.site.register(Location, LocationAdmin)
