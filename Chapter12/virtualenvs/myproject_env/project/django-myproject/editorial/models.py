import os

from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.utils.timezone import now as tz_now
from cms.models import CMSPlugin


def upload_to(instance, filename):
    now = tz_now()
    filename_base, filename_ext = os.path.splitext(filename)
    return "editorial/%s%s" % (
        now.strftime("%Y/%m/%Y%m%d%H%M%S"),
        filename_ext.lower())


class EditorialContent(CMSPlugin):
    title = models.CharField(_("Title"),
                             max_length=255)
    subtitle = models.CharField(_("Subtitle"),
                                max_length=255,
                                blank=True)
    description = models.TextField(_("Description"),
                                   blank=True)
    website = models.CharField(_("Website"),
                               max_length=255,
                               blank=True)

    image = models.ImageField(_("Image"),
                              max_length=255,
                              upload_to=upload_to,
                              blank=True)
    image_caption = models.TextField(_("Image Caption"),
                                     blank=True)

    css_class = models.CharField(_("CSS Class"),
                                 max_length=255,
                                 blank=True)

    def __str__(self):
        return self.title

    class Meta:
        ordering = ["title"]
        verbose_name = _("Editorial content")
        verbose_name_plural = _("Editorial contents")
