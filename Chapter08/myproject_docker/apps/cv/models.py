from django.db import models
from django.utils.translation import ugettext_lazy as _


class CurriculumVitae(models.Model):
    class Meta:
        verbose_name = _("Curriculum Vitae")
        verbose_name_plural = _("Curricula Vitarum")

    first_name = models.CharField(_("First name"), max_length=40)
    last_name = models.CharField(_("Last name"), max_length=40)
    email = models.EmailField(_("Email"))

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class Experience(models.Model):
    class Meta:
        ordering = ("-from_date",)
        verbose_name = _("Experience")
        verbose_name_plural = _("Experiences")

    cv = models.ForeignKey(CurriculumVitae,
                           on_delete=models.CASCADE)
    from_date = models.DateField(_("From"))
    till_date = models.DateField(_("Till"), null=True, blank=True)
    company = models.CharField(_("Company"), max_length=100)
    position = models.CharField(_("Position"), max_length=100)
    skills = models.TextField(_("Skills gained"), blank=True)

    def __str__(self):
        date_format = "%m/%Y"
        till = (f"{self.till_date:{date_format}}"
                if self.till_date
                else _("present"))
        start = f"{self.from_date:{date_format}}"
        return f"{start}-{till} {self.position} at {self.company}"
