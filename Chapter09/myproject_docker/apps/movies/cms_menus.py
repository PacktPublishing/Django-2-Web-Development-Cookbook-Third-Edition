from django.urls import reverse
from django.utils.translation import ugettext_lazy as _
from cms.menu_bases import CMSAttachMenu
from menus.base import NavigationNode
from menus.menu_pool import menu_pool


@menu_pool.register_menu
class MoviesMenu(CMSAttachMenu):
    name = _("Movies Menu")

    def get_nodes(self, request):
        nodes = [
            NavigationNode(title=_("Editor Picks"),
                           url=reverse("movies:featured-movies"),
                           id=1),
            NavigationNode(title=_("Commercial Movies"),
                           url=reverse("movies:commercial-movies"),
                           id=2),
            NavigationNode(title=_("Independent Movies"),
                           url=reverse("movies:independent-movies"),
                           id=3),
            NavigationNode(title=_("Top 250 Movies"),
                           url=reverse("movies:top-movies"),
                           id=4),
        ]
        return nodes
