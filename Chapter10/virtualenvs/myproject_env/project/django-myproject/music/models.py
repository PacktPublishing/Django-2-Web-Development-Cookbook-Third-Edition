import os

from django.utils.translation import ugettext_lazy as _
from django.db import models
from django.utils.text import slugify


def upload_to(instance, filename):
    filename_base, filename_ext = os.path.splitext(filename)
    artist = slugify(instance.artist)
    track = slugify(instance.name)
    return f"tracks/{artist}--{track}{filename_ext.lower()}"


class Track(models.Model):
    class Meta:
        verbose_name = _("Track")
        verbose_name_plural = _("Tracks")

    name = models.CharField(_("Name"),
                            max_length=250)
    artist = models.CharField(_("Artist"),
                              max_length=250)
    url = models.URLField(_("URL"))
    image = models.ImageField(_("Image"),
                              upload_to=upload_to,
                              blank=True,
                              null=True)

    def __str__(self):
        return f"{self.artist} - {self.name}"
