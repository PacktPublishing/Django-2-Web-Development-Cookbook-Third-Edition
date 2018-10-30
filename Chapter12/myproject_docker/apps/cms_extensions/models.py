from django.db import models
from django.utils.translation import ugettext_lazy as _
from cms.extensions import PageExtension
from cms.extensions.extension_pool import extension_pool

MENU_ITEM_CSS_CLASS_CHOICES = (
    ("featured", ".featured"),
)

BODY_CSS_CLASS_CHOICES = (
    ("serious", ".serious"),
    ("playful", ".playful"),
)


@extension_pool.register
class CSSExtension(PageExtension):
    menu_item_css_class = models.CharField(
        _("Menu Item CSS Class"),
        max_length=200,
        blank=True,
        choices=MENU_ITEM_CSS_CLASS_CHOICES)
    body_css_class = models.CharField(
        _("Body CSS Class"),
        max_length=200,
        blank=True,
        choices=BODY_CSS_CLASS_CHOICES)
