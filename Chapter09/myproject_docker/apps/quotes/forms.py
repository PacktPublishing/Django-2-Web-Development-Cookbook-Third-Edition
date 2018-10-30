from django import forms

from .models import InspirationalQuote


class InspirationalQuoteForm(forms.ModelForm):
    class Meta:
        model = InspirationalQuote
        fields = ["author", "quote", "picture"]

    picture_path = forms.CharField(max_length=255,
                                   widget=forms.HiddenInput(),
                                   required=False)

    def save(self, commit=True):
        instance = super().save(commit=commit)
        picture = self.cleaned_data["picture"]
        path = self.cleaned_data["picture_path"]
        if not picture and path:
            try:
                picture = upload_storage.open(path)
                instance.picture.save(path, picture, False)
                os.remove(path)
            except FileNotFoundError:
                pass
        instance.save()
        return instance
