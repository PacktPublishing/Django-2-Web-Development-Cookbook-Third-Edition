from django.db import models
from django.utils.translation import ugettext_lazy as _


STATUS_CHOICES = (
    ("draft", _("Draft")),
    ("published", _("Published")),
)


class ArtistManager(models.Manager):
    def random_published(self):
        return self.filter(status="published").order_by("?")


class Artist(models.Model):
    # ...
    status = models.CharField(_("Status"),
                              max_length=20,
                              choices=STATUS_CHOICES)
    custom_manager = ArtistManager()
