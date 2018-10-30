from django.contrib import admin
from django.contrib.auth.admin import (User, UserAdmin,
                                       Group, GroupAdmin)
from django.contrib.contenttypes.models import ContentType
from django.urls import reverse
from django.utils.text import mark_safe
from django.utils.translation import ugettext_lazy as _


class UserAdminExtended(UserAdmin):
    list_display = ("username", "email",
                    "first_name", "last_name",
                    "is_active", "is_staff",
                    "date_joined", "last_login")
    list_filter = ("is_active", "is_staff", "is_superuser",
                   "date_joined", "last_login")
    ordering = ("last_name", "first_name", "username")
    save_on_top = True


admin.site.unregister(User)
admin.site.register(User, UserAdminExtended)


class GroupAdminExtended(GroupAdmin):
    list_display = ("__str__", "display_users")
    save_on_top = True

    def display_users(self, obj):
        links = []
        for user in obj.user_set.all():
            ct = ContentType.objects.get_for_model(user)
            rule_name = f"admin:{ct.app_label}_{ct.model}_change"
            url = reverse(rule_name, args=(user.id,))
            user_name = (
                    f"{user.first_name} {user.last_name}".strip()
                    or user.username)
            links.append(f"""
            <a href="{url}" target="_blank">{user_name}</a>
            """)
        return mark_safe("<br />".join(links))
    display_users.allow_tags = True
    display_users.short_description = _("Users")


admin.site.unregister(Group)
admin.site.register(Group, GroupAdminExtended)
