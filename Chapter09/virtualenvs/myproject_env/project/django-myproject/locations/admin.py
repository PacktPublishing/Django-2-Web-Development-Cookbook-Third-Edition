from django.contrib import admin
from django.conf import settings
from django.template.loader import render_to_string
from django.utils.translation import ugettext_lazy as _

from .models import Location


class LocationAdmin(admin.ModelAdmin):
    save_on_top = True
    list_display = ("title", "street", "description")
    search_fields = ("title", "street", "description")

    def get_fieldsets(self, request, obj=None):
        map_html = render_to_string(
            "admin/locations/includes/map.html", {
                "MAPS_API_KEY": settings.MAPS_API_KEY,
            })
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
            # added image field in the Providing responsive images
            # recipe in Chapter 4, Templates and JavaScript
            (_("Image"), {"fields": ("image",)}),
            # added slug field in the Using HTML5 data attributes
            # recipe in Chapter 4, Templates and JavaScript
            (_("Slug"), {"fields": ("slug",)}),
            (_("Map"), {"description": map_html, "fields": []}),
        ]
        return fieldsets


admin.site.register(Location, LocationAdmin)
