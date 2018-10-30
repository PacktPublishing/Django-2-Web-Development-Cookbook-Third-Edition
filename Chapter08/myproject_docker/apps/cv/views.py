import os

from django.conf import settings
from django.http import HttpResponse, HttpResponseServerError
from django.shortcuts import get_object_or_404, render_to_response
from django.template.loader import render_to_string
from django.utils.text import slugify
from xhtml2pdf import pisa

from .models import CurriculumVitae


def link_callback(uri, rel):
    # convert URIs to absolute system paths
    if uri.startswith(settings.MEDIA_URL):
        path = os.path.join(settings.MEDIA_ROOT,
                            uri.replace(settings.MEDIA_URL, ""))
    elif uri.startswith(settings.STATIC_URL):
        path = os.path.join(settings.STATIC_ROOT,
                            uri.replace(settings.STATIC_URL, ""))
    else:
        # handle absolute uri (i.e., "http://my.tld/a.png")
        return uri

    # make sure that the local file exists
    if not os.path.isfile(path):
        raise Exception(
            "Media URI must start with "
            f"'{settings.MEDIA_URL}' or '{settings.STATIC_URL}'")

    return path


def download_cv_pdf(request, pk):
    cv = get_object_or_404(CurriculumVitae, pk=pk)

    response = HttpResponse(content_type="application/pdf")
    response["Content-Disposition"] = \
        f"attachment; filename='{slugify(cv, True)}.pdf'"

    html = render_to_string("cv/cv_pdf.html", {"cv": cv})
    status = pisa.CreatePDF(html,
                            dest=response,
                            link_callback=link_callback)

    if status.err:
        return HttpResponse("The PDF could not be generated")

    return response
