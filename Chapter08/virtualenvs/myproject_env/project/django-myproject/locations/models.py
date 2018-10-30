import os

from django.db import models
from django.utils.translation import ugettext_lazy as _


COUNTRY_CHOICES = (
    ("US", _("United States")),
    ("UK", _("United Kingdom")),
    ("CA", _("Canada")),
    ("DE", _("Germany")),
    ("FR", _("France")),
    ("LT", _("Lithuania")),
)


def upload_to(instance, filename):
    base, ext = os.path.splitext(filename)
    return f"locations/{instance.slug}{ext.lower()}"


class Location(models.Model):
    class Meta:
        verbose_name = _("Location")
        verbose_name_plural = _("Locations")

    title = models.CharField(_("title"),
                             max_length=255,
                             unique=True)
    description = models.TextField(_("description"),
                                   blank=True)
    street = models.CharField(_("street address"),
                              max_length=255,
                              blank=True)
    street2 = models.CharField(_("street address (line 2)"),
                               max_length=255,
                               blank=True)
    postal_code = models.CharField(_("postal code"),
                                   max_length=10,
                                   blank=True)
    city = models.CharField(_("city"),
                            max_length=255,
                            blank=True)
    country = models.CharField(_("country"),
                               max_length=2,
                               blank=True,
                               choices=COUNTRY_CHOICES)
    _latitude_definition = _(
        "Latitude (Lat.) is the angle between any point and the "
        "equator (north pole is at 90°; south pole is at -90°).")
    latitude = models.FloatField(_("latitude"),
                                 blank=True,
                                 null=True,
                                 help_text=_latitude_definition)
    _longitude_definition = _(
        "Longitude (Long.) is the angle east or west of a point "
        "on Earth at Greenwich (UK), which is the international "
        "zero-longitude point (longitude = 0°). The anti-meridian "
        "of Greenwich (the opposite side of the planet) is both "
        "180° (to the east) and -180° (to the west).")
    longitude = models.FloatField(_("longitude"),
                                  blank=True,
                                  null=True,
                                  help_text=_longitude_definition)

    # added slug field in the Using HTML5 data attributes
    # recipe in Chapter 4, Templates and JavaScript
    _slug_definition = _(
        "The term slug comes from newspaper editing and it means "
        "a short string without any special characters; just "
        "letters, numbers, underscores, and hyphens. Slugs are "
        "generally used to create unique URLs.")
    slug = models.SlugField(_("slug"),
                            help_text=_slug_definition)

    # added image field in the Providing responsive images
    # recipe in Chapter 4, Templates and JavaScript
    image = models.ImageField(null=True,
                              upload_to=upload_to)

    # added slug field in the Using HTML5 data attributes
    # recipe in Chapter 4, Templates and JavaScript
    @property
    def address(self):
        address = [self.street]
        if self.street2:
            address.append(self.street2)
        address += [self.city, self.country, self.postal_code]
        return ", ".join(address)

    def __str__(self):
        return self.title
