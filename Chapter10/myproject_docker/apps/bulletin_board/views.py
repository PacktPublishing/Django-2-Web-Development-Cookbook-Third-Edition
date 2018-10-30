from django.conf import settings
from django.utils.translation import ugettext_lazy as _
from django.views.generic import ListView, DetailView, FormView
from rest_framework import generics

from .models import Bulletin
from .forms import BulletinForm
from .serializers import BulletinSerializer


# NOTE FROM THE AUTHOR
# Because the book covers approaches to custom form layouts both
# using custom templates alone, and through django-crispy-forms,
# this and the views.py have been differentiated through the use
# of a setting USE_DJANGO_CRISPY_FORMS, set in settings.py as
# needed to provide code files supporting both approaches


class BulletinList(ListView):
    model = Bulletin


class BulletinDetail(DetailView):
    model = Bulletin


class RESTBulletinList(generics.ListCreateAPIView):
    queryset = Bulletin.objects.all()
    serializer_class = BulletinSerializer


class RESTBulletinDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Bulletin.objects.all()
    serializer_class = BulletinSerializer


if settings.USE_DJANGO_CRISPY_FORMS:
    class BulletinEdit(FormView):
        template_name = "bulletin_board/change_form.html"
        form_class = BulletinForm
else:
    class BulletinEdit(FormView):
        template_name = "bulletin_board/bulletin_form.html"
        form_class = BulletinForm

        def get_form(self, *args, **kwargs):
            form = super().get_form(*args, **kwargs)
            form.fieldsets = [
                {
                    "id": "main-data",
                    "legend": _("Main data"),
                    "fields": [
                        form["bulletin_type"],
                        form["title"],
                        form["description"],
                    ]
                },
                {
                    "id": "image-fieldset",
                    "legend": _("Image upload"),
                    "fields": [
                        form["image"]
                    ],
                },
                {
                    "id": "contact-info",
                    "legend": _("Contact"),
                    "fields": [
                        form["contact_person"],
                        form["phone"],
                        form["email"],
                    ]
                }
            ]
            return form
