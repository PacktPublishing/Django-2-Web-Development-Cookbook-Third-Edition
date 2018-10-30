from django import forms
from django.conf import settings
from django.forms.renderers import TemplatesSetting
from django.utils.translation import ugettext_lazy as _

from crispy_forms import bootstrap, helper, layout

from .models import Bulletin


# NOTE FROM THE AUTHOR
# Because the book covers approaches to custom form layouts both
# using custom templates alone, and through django-crispy-forms,
# this and the views.py have been differentiated through the use
# of a setting USE_DJANGO_CRISPY_FORMS, set in settings.py as
# needed to provide code files supporting both approaches


class BulletinTemplateForm(forms.ModelForm):
    class Meta:
        model = Bulletin
        fields = ["bulletin_type", "title", "description",
                  "contact_person", "phone", "email", "image"]
        widgets = {
            "bulletin_type": forms.RadioSelect,
        }

    default_renderer = TemplatesSetting()

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # delete empty choice for this field
        self.fields["bulletin_type"].choices = \
            self.fields["bulletin_type"].choices[1:]
        self.fields["bulletin_type"].widget.attrs.update({
            "class": "list-unstyled form-group",
        })

        self.fields["title"].widget.attrs.update({
            "class": "form-control",
        })

        self.fields["description"].widget.attrs.update({
            "class": "form-control",
            "rows": "3",
        })

        self.fields["image"].widget.template_name = \
            "bulletin_board/widgets/image.html"
        self.fields["image"].widget.attrs.update({
            "class": "input-block-level clearablefileinput",
        })

        self.fields["contact_person"].widget.attrs.update({
            "class": "form-control",
        })

        self.fields["phone"].widget.template_name = \
            "bulletin_board/widgets/phone.html"
        self.fields["phone"].widget.attrs.update({
            "class": "form-control",
        })

        self.fields["email"].widget.template_name = \
            "bulletin_board/widgets/email.html"
        self.fields["email"].widget.attrs.update({
            "class": "form-control",
            "placeholder": "contact@example.com",
        })


class BulletinCrispyForm(forms.ModelForm):
    class Meta:
        model = Bulletin
        fields = ["bulletin_type", "title", "description",
                  "contact_person", "phone", "email", "image"]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.fields["bulletin_type"].widget = forms.RadioSelect()
        # delete empty choice for the type
        del self.fields["bulletin_type"].choices[0]

        title = layout.Field(
            "title",
            css_class="input-block-level")
        desciption = layout.Field(
            "description",
            css_class="input-block-level",
            rows="3")
        main_fieldset = layout.Fieldset(
            _("Main data"),
            "bulletin_type",
            title,
            desciption)

        image = layout.Field(
            "image",
            css_class="input-block-level")
        format_html_template = """
            {% load i18n %}
            <p class="help-block">
            {% trans "Available formats are JPG, GIF, and PNG." %}
            {% trans "Minimal size is 800 × 800 px." %}
            </p>
            """
        format_html = layout.HTML(format_html_template)
        image_fieldset = layout.Fieldset(
            _("Image"),
            image,
            format_html,
            title=_("Image upload"),
            css_id="image_fieldset")

        contact_person = layout.Field(
            "contact_person",
            css_class="input-block-level")
        phone_field = bootstrap.PrependedText(
            "phone",
            '<i class="ion-ios-telephone"></i>',
            css_class="input-block-level")
        email_field = bootstrap.PrependedText(
            "email",
            "@",
            css_class="input-block-level",
            placeholder="contact@example.com")
        contact_info = layout.Div(
            phone_field,
            email_field,
            css_id="contact_info")
        contact_fieldset = layout.Fieldset(
            _("Contact"),
            contact_person,
            contact_info)

        submit_button = layout.Submit(
            "submit",
            _("Save"))
        actions = bootstrap.FormActions(submit_button)

        self.helper = helper.FormHelper()
        self.helper.form_action = "bulletin-change"
        self.helper.form_method = "POST"
        self.helper.layout = layout.Layout(
            main_fieldset,
            image_fieldset,
            contact_fieldset,
            actions)


if settings.USE_DJANGO_CRISPY_FORMS:
    # for Creating a form layout with django-crispy-forms
    class BulletinForm(BulletinCrispyForm):
        pass
else:
    # for Creating a form layout with custom templates
    class BulletinForm(BulletinTemplateForm):
        pass
