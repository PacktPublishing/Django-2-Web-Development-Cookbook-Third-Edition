from django.views.decorators.cache import cache_page
from django.views.decorators.vary import vary_on_cookie


@vary_on_cookie
@cache_page(60)
def viral_video_detail(request, pk):
    # ...
    pass
