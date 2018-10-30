from django.contrib.auth.models import User
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase

from .models import Category, Bulletin


class BulletinTests(APITestCase):
    @classmethod
    def setUpClass(cls):
        super(BulletinTests, cls).setUpClass()

        cls.superuser = User.objects.create_superuser(
            username="test-admin",
            password="test-admin",
            email="")

        cls.category = Category.objects.create(title="Movies")

        cls.bulletin = Bulletin.objects.create(
            bulletin_type="searching",
            category=cls.category,
            title="The Matrix",
            description="There is no spoon.",
            contact_person="Thomas A. Anderson")

        cls.bulletin_to_delete = Bulletin.objects.create(
            bulletin_type="searching",
            category=cls.category,
            title="Neo",
            description="You take the blue pill — the story ends, "
                        "you wake up in your bed and believe "
                        "whatever you want to believe. You take "
                        "the red pill – you stay in Wonderland, "
                        "and I show you how deep the rabbit hole "
                        "goes.",
            contact_person="Morpheus")

    @classmethod
    def tearDownClass(cls):
        super(BulletinTests, cls).tearDownClass()

        cls.category.delete()
        cls.bulletin.delete()
        cls.superuser.delete()

    def test_list_bulletins(self):
        url = reverse("rest_bulletin_list")
        data = {}
        response = self.client.get(url, data, format="json")

        self.assertEqual(response.status_code,
                         status.HTTP_200_OK)
        self.assertEqual(response.data["count"],
                         Bulletin.objects.count())

    def test_get_bulletin(self):
        url = reverse("rest_bulletin_detail",
                      kwargs={
                          "pk": self.bulletin.pk
                      })
        data = {}
        response = self.client.get(url, data, format="json")

        self.assertEqual(response.status_code,
                         status.HTTP_200_OK)
        self.assertEqual(response.data["id"],
                         self.bulletin.pk)
        self.assertEqual(response.data["bulletin_type"],
                         self.bulletin.bulletin_type)
        self.assertEqual(response.data["category"]["id"],
                         self.category.pk)
        self.assertEqual(response.data["title"],
                         self.bulletin.title)
        self.assertEqual(response.data["description"],
                         self.bulletin.description)
        self.assertEqual(response.data["contact_person"],
                         self.bulletin.contact_person)

    def test_create_bulletin_allowed(self):
        # login
        self.client.force_authenticate(user=self.superuser)

        url = reverse("rest_bulletin_list")
        data = {
            "bulletin_type": "offering",
            "category": {"title": self.category.title},
            "title": "Back to the Future",
            "description": "Roads? Where we're going, "
                           "we don't need roads.",
            "contact_person": "Doc Brown",
        }
        response = self.client.post(url, data, format="json")

        self.assertEqual(response.status_code,
                         status.HTTP_201_CREATED)

        bulletin = Bulletin.objects.filter(pk=response.data["id"])
        self.assertEqual(bulletin.count(), 1)

        # logout
        self.client.force_authenticate(user=None)

    def test_create_bulletin_restricted(self):
        # make sure the user is logged out
        self.client.force_authenticate(user=None)

        url = reverse("rest_bulletin_list")
        data = {
            "bulletin_type": "offering",
            "category": {"title": self.category.title},
            "title": "Godfather",
            "description": "I'm gonna make him an offer he can't "
                           "refuse",
            "contact_person": "Don Corleone",
        }
        response = self.client.post(url, data, format="json")

        self.assertEqual(response.status_code,
                         status.HTTP_403_FORBIDDEN)

    def test_change_bulletin_allowed(self):
        # login
        self.client.force_authenticate(user=self.superuser)

        url = reverse("rest_bulletin_detail",
                      kwargs={
                          "pk": self.bulletin.pk
                      })

        # change only title
        data = {
            "bulletin_type": self.bulletin.bulletin_type,
            "category": {
                "title": self.bulletin.category.title
            },
            "title": "Matrix Resurrection",
            "description": self.bulletin.description,
            "contact_person": self.bulletin.contact_person,
        }
        response = self.client.put(url, data, format="json")

        self.assertEqual(response.status_code,
                         status.HTTP_200_OK)
        self.assertEqual(response.data["id"],
                         self.bulletin.pk)
        self.assertEqual(response.data["title"],
                         data["title"])
        self.assertEqual(response.data["bulletin_type"],
                         "searching")

        # logout
        self.client.force_authenticate(user=None)

    def test_change_bulletin_restricted(self):
        # make sure the user is logged out
        self.client.force_authenticate(user=None)

        url = reverse("rest_bulletin_detail",
                      kwargs={
                          "pk": self.bulletin.pk
                      })

        # change only title
        data = {
            "bulletin_type": self.bulletin.bulletin_type,
            "category": {
                "title": self.bulletin.category.title
            },
            "title": "Matrix Resurrection",
            "description": self.bulletin.description,
            "contact_person": self.bulletin.contact_person,
        }
        response = self.client.put(url, data, format="json")

        self.assertEqual(response.status_code,
                         status.HTTP_403_FORBIDDEN)

    def test_delete_bulletin_restricted(self):
        # make sure the user is logged out
        self.client.force_authenticate(user=None)

        url = reverse("rest_bulletin_detail",
                      kwargs={
                          "pk": self.bulletin_to_delete.pk
                      })

        data = {}
        response = self.client.delete(url, data, format="json")

        self.assertEqual(response.status_code,
                         status.HTTP_403_FORBIDDEN)

    def test_delete_bulletin_allowed(self):
        # login
        self.client.force_authenticate(user=self.superuser)

        url = reverse("rest_bulletin_detail",
                      kwargs={
                          "pk": self.bulletin_to_delete.pk
                      })

        data = {}
        response = self.client.delete(url, data, format="json")

        self.assertEqual(response.status_code,
                         status.HTTP_204_NO_CONTENT)

        # logout
        self.client.force_authenticate(user=None)
