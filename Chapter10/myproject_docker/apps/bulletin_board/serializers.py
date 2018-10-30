from rest_framework import serializers

from .models import Category, Bulletin


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ["id", "title"]


class BulletinSerializer(serializers.ModelSerializer):
    class Meta:
        model = Bulletin
        fields = ["id", "bulletin_type", "title",
                  "description", "contact_person", "phone",
                  "email", "image", "category"]

    category = CategorySerializer()

    def create(self, validated_data):
        category_data = validated_data.pop('category')
        category, created = Category.objects.get_or_create(
            title=category_data['title'])
        bulletin = Bulletin.objects.create(category=category,
                                           **validated_data)
        return bulletin

    def update(self, instance, validated_data):
        category_data = validated_data.pop('category')
        category, created = Category.objects.get_or_create(
            title=category_data['title'])
        for fname, fvalue in validated_data.items():
            setattr(instance, fname, fvalue)
        instance.category = category
        instance.save()
        return instance
