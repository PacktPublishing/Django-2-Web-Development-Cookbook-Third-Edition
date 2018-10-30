from datetime import datetime, timedelta, timezone
from email.utils import format_datetime

from django.shortcuts import render
from django.views.decorators.cache import cache_control


@cache_control(public=True)
def render_js(request, template_name, cache=True, *args, **kwargs):
    response = render(request, template_name, *args, **kwargs)
    response["Content-Type"] = \
        "application/javascript; charset=UTF-8"
    if cache:
        now = datetime.now(timezone.utc)
        response["Last-Modified"] = format_datetime(now,
                                                    usegmt=True)

        # cache in the browser for 1 month
        expires = now + timedelta(days=31)
        response["Expires"] = format_datetime(expires,
                                              usegmt=True)
    else:
        response["Pragma"] = "No-Cache"
    return response
