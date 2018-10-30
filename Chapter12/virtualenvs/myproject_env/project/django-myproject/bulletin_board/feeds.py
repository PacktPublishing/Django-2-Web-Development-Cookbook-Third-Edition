from django.contrib.syndication.views import Feed
from django.urls import reverse

from .models import Bulletin, TYPE_CHOICES
from .forms import BulletinFilterForm


class BulletinFeed(Feed):
    description_template = \
        "bulletin_board/feeds/bulletin_description.html"

    def get_object(self, request, *args, **kwargs):
        form = BulletinFilterForm(data=request.GET)
        obj = {}
        if form.is_valid():
            obj = {"query_string": request.META["QUERY_STRING"]}
            for field in ["bulletin_type", "category"]:
                value = form.cleaned_data.get(field, None)
                obj[field] = value
        return obj

    def title(self, obj):
        title_parts = ["Bulletin Board"]

        # add type "Searching" or "Offering"
        type_key = obj.get("bulletin_type", False)
        type = dict(TYPE_CHOICES).get(type_key, False) \
            if type_key else ""
        if type:
            title_parts.append(type)

        # add category
        category = obj.get("category", False)
        if category:
            title_parts.append(category.title)

        return " - ".join(title_parts)

    def link(self, obj):
        return self.get_named_url("bulletin-list", obj)

    def feed_url(self, obj):
        return self.get_named_url("bulletin-rss", obj)

    @staticmethod
    def get_named_url(name, obj):
        url = reverse(name)
        qs = obj.get("query_string", False)
        if qs:
            url = f"{url}?{qs}"
        return url

    def item_pubdate(self, item):
        return item.created

    def items(self, obj):
        type = obj.get("bulletin_type", False)
        category = obj.get("category", False)

        qs = Bulletin.objects.order_by("-created")
        if type:
            qs = qs.filter(bulletin_type=type).distinct()
        if category:
            qs = qs.filter(category=category).distinct()
        return qs[:30]
