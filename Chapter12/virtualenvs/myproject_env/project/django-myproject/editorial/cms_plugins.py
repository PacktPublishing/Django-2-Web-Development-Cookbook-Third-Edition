from django.utils.translation import ugettext as _
from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool

from .models import EditorialContent


class EditorialContentPlugin(CMSPluginBase):
    model = EditorialContent
    module = _("Editorial")
    name = _("Editorial Content")
    render_template = "cms/plugins/editorial_content.html"

    fieldsets = (
        (_("Main Content"), {
            "fields": (
                "title", "subtitle", "description",
                "website"),
            "classes": ["collapse open"]
        }),
        (_("Image"), {
            "fields": ("image", "image_caption"),
            "classes": ["collapse open"]
        }),
        (_("Presentation"), {
            "fields": ("css_class",),
            "classes": ["collapse closed"]
        }),
    )

    def render(self, context, instance, placeholder):
        context.update({
            "object": instance,
            "placeholder": placeholder,
        })
        return context

plugin_pool.register_plugin(EditorialContentPlugin)
