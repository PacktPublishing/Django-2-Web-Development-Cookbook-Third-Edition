import os
from PIL import Image

from django.conf import settings
from django.core.files.storage import default_storage as storage
from django.db import models
from django.urls import reverse, NoReverseMatch
from django.utils.timezone import now as timezone_now
from django.utils.translation import ugettext_lazy as _


THUMBNAIL_SIZE = getattr(settings, "QUOTES_THUMBNAIL_SIZE", 50)
THUMBNAIL_EXT = getattr(settings, "QUOTES_THUMBNAIL_EXT", None)


def get_square_crop_points(image):
    width, height = image.size
    target = width if width > height else height
    upper, lower = get_centering_points(height, target)
    left, right = get_centering_points(width, target)
    return left, upper, right, lower


def get_centering_points(size, target):
    delta = size - target
    start = int(delta) / 2
    end = start + target
    return start, end


def upload_to(instance, filename):
    now = timezone_now()
    base, ext = os.path.splitext(filename)
    ext = ext.lower()
    return f"quotes/{now:%Y/%m/%Y%m%d%H%M%S}{ext}"


class InspirationalQuote(models.Model):
    class Meta:
        verbose_name = _("Inspirational Quote")
        verbose_name_plural = _("Inspirational Quotes")

    author = models.CharField(_("Author"), max_length=200)
    quote = models.TextField(_("Quote"))
    picture = models.ImageField(_("Picture"),
                                upload_to=upload_to,
                                blank=True,
                                null=True)
    language = models.CharField(_("Language"),
                                max_length=5,
                                blank=True,
                                choices=settings.LANGUAGES)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        self.create_thumbnail()

    def create_thumbnail(self):
        if not self.picture:
            return False
        picture_path, thumbnail_path = self.get_picture_paths()
        if thumbnail_path and not storage.exists(thumbnail_path):
            try:
                picture_file = storage.open(picture_path, "r")
                image = Image.open(picture_file)
                image = image.crop(get_square_crop_points(image))
                image = image.resize((THUMBNAIL_SIZE,
                                      THUMBNAIL_SIZE),
                                     Image.ANTIALIAS)
                image.save(thumbnail_path)
            except (IOError, KeyError, UnicodeDecodeError):
                return False
        return True

    def get_thumbnail_picture_url(self):
        url = ""
        picture_path, thumbnail_path = self.get_picture_paths()

        if thumbnail_path:
            url = (storage.url(thumbnail_path)
                   if storage.exists(thumbnail_path)
                   else self.picture.url)

        return url

    def get_picture_paths(self):
        picture_path = None
        thumb_path = None

        if self.picture:
            picture_path = self.picture.name
            filename_base, filename_ext = os.path.splitext(
                    picture_path)
            if THUMBNAIL_EXT:
                filename_ext = THUMBNAIL_EXT
            thumb_path = f"{filename_base}_thumbnail{filename_ext}"

        return picture_path, thumb_path

    def get_url_path(self):
        try:
            return reverse("quote_detail", kwargs={"pk": self.pk})
        except NoReverseMatch:
            return ""

    def title(self):
        return self.quote

    def __str__(self):
        return self.quote
