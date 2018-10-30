from datetime import datetime
import os

from django.contrib.auth.decorators import login_required
from django.core.files.base import ContentFile
from django.http import (FileResponse,
                         HttpResponse,
                         HttpResponseNotFound)
from django.shortcuts import get_object_or_404, render, redirect
from django.template.loader import render_to_string
from django.utils.text import slugify
from django.utils.translation import ugettext_lazy as _
from django.views.decorators.csrf import csrf_protect
from django.views.generic import ListView, DetailView

from .forms import InspirationalQuoteForm
from .models import InspirationalQuote
from .storages import upload_storage


class QuoteList(ListView):
    model = InspirationalQuote


class QuoteDetail(DetailView):
    model = InspirationalQuote


def add_quote(request):
    form = InspirationalQuoteForm()
    if request.method == "POST":
        form = InspirationalQuoteForm(
            data=request.POST,
            files=request.FILES)
    if form.is_valid():
        form.save()
        return redirect("quotes-list")
    else:
        return render(request, "quotes/add_quote.html", {
            "form": form
        })


def _upload_to(request, filename):
    user = (f"user-{request.user.pk}"
            if request.user.is_authenticated
            else "anonymous")

    return os.path.join("quotes",
                        user,
                        f"{datetime.now():%Y/%m/%d}",
                        filename)


@csrf_protect
def upload_quote_picture(request):
    status_code = 400
    data = {
        "files": [],
        "error": _("Bad request"),
    }
    if request.method == "POST" \
            and request.is_ajax() \
            and "picture" in request.FILES:
        image_types = [f"image/{x}" for x in [
            "gif", "jpg", "jpeg", "pjpeg", "png"
        ]]
        picture = request.FILES["picture"]
        if picture.content_type not in image_types:
            status_code = 405
            data["error"] = _("Invalid image format")
        else:
            upload_to = _upload_to(request, picture.name)
            name = upload_storage.save(upload_to,
                                       ContentFile(picture.read()))
            picture = upload_storage.open(name)
            status_code = 200
            del data["error"]
            picture.filename = os.path.basename(picture.name)
            data["files"].append(picture)

    json_data = render_to_string("quotes/upload.json", data)
    return HttpResponse(json_data,
                        content_type="application/json",
                        status=status_code)


@csrf_protect
def delete_quote_picture(request, filename):
    if request.method == "DELETE" \
            and request.is_ajax() \
            and filename:
        try:
            upload_to = _upload_to(request, filename)
            upload_storage.delete(upload_to)
        except FileNotFoundError:
            pass
    json = render_to_string("quotes/upload.json", {"files": []})
    return HttpResponse(json,
                        content_type="application/json",
                        status=200)


@login_required(login_url="user-login")
def download_quote_picture(request, pk):
    quote = get_object_or_404(InspirationalQuote, pk=pk)
    try:
        filename, extension = os.path.splitext(
            quote.picture.file.name)
        extension = extension[1:]  # remove the dot
        response = FileResponse(
            quote.picture.file,
            content_type=f"image/{extension}")
        author = slugify(quote.author)[:100]
        excerpt = slugify(quote.quote)[:100]
        response["Content-Disposition"] = \
            "attachment; filename=" \
            f"{author}---{excerpt}.{extension}"
    except ValueError:
        response = HttpResponseNotFound(
            content='Picture unavailable')
    return response
