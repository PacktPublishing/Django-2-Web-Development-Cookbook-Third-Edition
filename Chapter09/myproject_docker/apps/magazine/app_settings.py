from django.conf import settings
from django.utils.translation import ugettext_lazy as _


SETTING1 = getattr(settings, "MAGAZINE_SETTING1", "default value")
MEANING_OF_LIFE = getattr(settings, "MAGAZINE_MEANING_OF_LIFE", 42)
STATUS_CHOICES = getattr(settings, "MAGAZINE_STATUS_CHOICES", (
    ("draft", _("Draft")),
    ("published", _("Published")),
    ("not_listed", _("Not Listed")),
))
