from django.apps import AppConfig
from django.utils.translation import ugettext_lazy as _


class MagazineAppConfig(AppConfig):
    name = "magazine"
    verbose_name = _("Magazine")

    def ready(self):
        from . import signals
