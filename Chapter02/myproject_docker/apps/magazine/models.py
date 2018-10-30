from django.db import models
from django.utils.translation import ugettext_lazy as _

from .app_settings import STATUS_CHOICES


class NewsArticle(models.Model):
    class Meta:
        verbose_name = _("Article")
        verbose_name_plural = _("Articles")

    title = models.CharField(max_length=100)
    content = models.TextField()
    status = models.CharField(_("Status"),
                              max_length=20,
                              choices=STATUS_CHOICES,
                              default=STATUS_CHOICES[0])
