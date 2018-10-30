from django.conf import settings
from django.db import models
from django.utils.translation import ugettext_lazy as _

from utils.fields import (MultilingualCharField,
                          MultilingualTextField)
from utils.models import (CreationModificationDateMixin,
                          MetaTagsMixin,
                          SchemaMicrodata,
                          UrlMixin)
from utils.models import (
    object_relation_mixin_factory as generic_relation)


FavoriteObjectMixin = generic_relation(is_required=True)


OwnerMixin = generic_relation(prefix="owner",
                              prefix_verbose=_("Owner"),
                              is_required=True,
                              add_related_name=True,
                              limit_content_type_choices_to={
                                  "model__in": ("user",
                                                "institution")})


class Like(FavoriteObjectMixin, OwnerMixin):
    class Meta:
        verbose_name = _("Like")
        verbose_name_plural = _("Likes")

    def __str__(self):
        return _(f"{self.owner_content_object} "
                 f"likes {self.content_object}")


class Category(models.Model):
    title = models.CharField(_("Title"), max_length=200)

    def __str__(self):
        return self.title


class Idea(CreationModificationDateMixin, MetaTagsMixin,
           SchemaMicrodata, UrlMixin):
    class Meta:
        verbose_name = _("Idea")
        verbose_name_plural = _("Ideas")

    title = MultilingualCharField(_("Title"),
                                  max_length=200)
    description = MultilingualTextField(_("Description"),
                                        blank=True)
    content = MultilingualTextField(_("Content"))
    categories = models.ManyToManyField(Category,
                                        verbose_name=_("Category"),
                                        blank=True,
                                        related_name="ideas")

    def get_url_path(self):
        return reverse("idea_details", kwargs={
            "idea_id": str(self.pk),
        })

    @classmethod
    def itemprop_fields(cls):
        fields = ["title", "content"]
        lang_fields = []
        for lang in settings.LANGUAGES:
            safe_suffix = lang[0].replace("-", "_")
            lang_fields = lang_fields + [f"{field}_{safe_suffix}"
                                         for field in fields]
        return lang_fields + super().itemprop_fields()

    def __str__(self):
        return self.title

