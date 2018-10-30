from cms.models import Page
from menus.base import Modifier
from menus.menu_pool import menu_pool


@menu_pool.register_modifier
class CSSModifier(Modifier):
    def modify(self, request, nodes, namespace, root_id, post_cut,
               breadcrumb):
        if post_cut:
            return nodes
        for node in nodes:
            try:
                page = Page.objects.get(pk=node.id)
            except:
                continue
            try:
                page.cssextension
            except:
                pass
            else:
                node.cssextension = page.cssextension
        return nodes
