from cms.api import get_page_draft
from cms.toolbar_pool import toolbar_pool
from cms.toolbar_base import CMSToolbar
from cms.utils.page_permissions import user_can_change_page
from django.urls import reverse, NoReverseMatch
from django.utils.translation import ugettext_lazy as _

from .models import CSSExtension


@toolbar_pool.register
class CSSExtensionToolbar(CMSToolbar):
    page = None

    def populate(self):
        # always use draft if we have a page
        self.page = get_page_draft(self.request.current_page)

        if not self.page:
            # Nothing to do
            return

        # check if user has page edit permission
        if user_can_change_page(user=self.request.user,
                                page=self.page):
            try:
                extension = CSSExtension.objects.get(
                    extended_object_id=self.page.id)
            except CSSExtension.DoesNotExist:
                extension = None

            try:
                if extension:
                    url = reverse(
                        "admin:cms_extensions_cssextension_change",
                        args=(extension.pk,))
                else:
                    url = reverse(
                        "admin:cms_extensions_cssextension_add")
                    url = f"{url}?extended_object={self.page.pk}"
            except NoReverseMatch:
                # not in urls
                pass
            else:
                not_edit_mode = not self.toolbar.edit_mode_active
                current_page_menu = self.toolbar.\
                    get_or_create_menu("page")
                current_page_menu.add_modal_item(
                    _("CSS"),
                    url=url,
                    disabled=not_edit_mode)
