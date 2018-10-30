from django.db import models
from django.utils.translation import ugettext_lazy as _


RATING_CHOICES = (
    (1, "★☆☆☆☆☆☆☆☆☆"),
    (2, "★★☆☆☆☆☆☆☆☆"),
    (3, "★★★☆☆☆☆☆☆☆"),
    (4, "★★★★☆☆☆☆☆☆"),
    (5, "★★★★★☆☆☆☆☆"),
    (6, "★★★★★★☆☆☆☆"),
    (7, "★★★★★★★☆☆☆"),
    (8, "★★★★★★★★☆☆"),
    (9, "★★★★★★★★★☆"),
    (10, "★★★★★★★★★★"),
)


class Genre(models.Model):
    title = models.CharField(_("Title"),
                             max_length=100)

    def __str__(self):
        return self.title


class Director(models.Model):
    first_name = models.CharField(_("First name"),
                                  max_length=40)
    last_name = models.CharField(_("Last name"),
                                 max_length=40)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class Actor(models.Model):
    first_name = models.CharField(_("First name"),
                                  max_length=40)
    last_name = models.CharField(_("Last name"),
                                 max_length=40)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class Movie(models.Model):
    class Meta:
        ordering = ["title"]
        verbose_name = _("Movie")
        verbose_name_plural = _("Movies")

    title = models.CharField(_("Title"),
                             max_length=255)
    genres = models.ManyToManyField(Genre,
                                    blank=True)
    directors = models.ManyToManyField(Director,
                                       blank=True)
    actors = models.ManyToManyField(Actor,
                                    blank=True)
    rating = models.PositiveIntegerField(_("Rating"),
                                         choices=RATING_CHOICES)

    def __str__(self):
        return self.title
