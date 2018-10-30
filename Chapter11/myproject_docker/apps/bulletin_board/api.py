from tastypie import fields
from tastypie.authentication import ApiKeyAuthentication
from tastypie.authorization import ReadOnlyAuthorization
from tastypie.resources import (ModelResource,
                                ALL,
                                ALL_WITH_RELATIONS)

from .models import Category, Bulletin


class CategoryResource(ModelResource):
    class Meta:
        queryset = Category.objects.all()
        resource_name = "categories"
        fields = ["title"]
        allowed_methods = ["get"]
        authentication = ApiKeyAuthentication()
        authorization = ReadOnlyAuthorization()
        filtering = {
            "title": ALL,
        }


class BulletinResource(ModelResource):
    class Meta:
        queryset = Bulletin.objects.all()
        resource_name = "bulletins"
        fields = [
            "bulletin_type", "category", "title",
            "description", "contact_person", "phone",
            "email", "image"
        ]
        allowed_methods = ["get"]
        authentication = ApiKeyAuthentication()
        authorization = ReadOnlyAuthorization()
        filtering = {
            "bulletin_type": ALL,
            "title": ALL,
            "category": ALL_WITH_RELATIONS,
            "created": ["gt", "gte", "exact", "lte", "lt"],
        }

    category = fields.ForeignKey(CategoryResource, "category",
                                 null=True,
                                 blank=True,
                                 full=True)
