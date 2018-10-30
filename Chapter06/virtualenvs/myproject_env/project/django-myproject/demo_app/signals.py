from django.db.models import CharField
from django.db.models.signals import class_prepared
from django.dispatch import receiver
from django.template import loader
from django.utils.safestring import mark_safe

from utils import models


@receiver(class_prepared)
def augment_with_itemprops_microdata(sender, **kwargs):
    if issubclass(sender, models.SchemaMicrodata):
        for field_name in sender.itemprop_fields():
            field = None
            for fld in sender._meta.fields:
                if fld.get_attname() == field_name:
                    field = fld
            type = field.__class__.__name__ if field else "None"
            enum = getattr(models, f"{type}ItemProp", None)
            if enum:
                display_name = field.verbose_name or field.name
                itemprop_field_name = f"{field.name}_itemprop"
                itemprop_field = CharField(
                    f"{display_name} microdata item property",
                    name=itemprop_field_name,
                    max_length=200,
                    unique=False,
                    blank=True,
                    null=False,
                    default="",
                    editable=True,
                    choices=enum.choices(),
                    db_tablespace=field.db_tablespace)
                itemprop_field.auto_created = True
                itemprop_field.contribute_to_class(
                    sender,
                    itemprop_field_name)

                def itemprop_attr(sender_instance):
                    attr = ""
                    prop_get = getattr(
                        sender_instance,
                        f"get_{itemprop_field_name}_display",
                        None)
                    if prop_get:
                        prop_val = prop_get()
                        attr = loader.render_to_string(
                            "utils/itemprop.attr.html",
                            {"itemprop": prop_val})
                    return mark_safe(attr)

                setattr(sender,
                        f"{itemprop_field_name}_attribute",
                        property(itemprop_attr))
