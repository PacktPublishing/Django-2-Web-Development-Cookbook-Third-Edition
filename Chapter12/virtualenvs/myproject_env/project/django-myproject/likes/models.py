from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.conf import settings

from utils.models import (CreationModificationDateMixin,
                          object_relation_mixin_factory)


class Like(CreationModificationDateMixin,
           object_relation_mixin_factory(is_required=True)):
    class Meta:
        verbose_name = _("like")
        verbose_name_plural = _("likes")
        ordering = ("-created",)

    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             on_delete=models.CASCADE)

    def __str__(self):
        return _(u"%(user)s likes %(obj)s") % {
            "user": self.user,
            "obj": self.content_object,
        }
