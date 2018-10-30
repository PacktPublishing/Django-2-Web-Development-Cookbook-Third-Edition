import os, requests
from io import BytesIO
import json

from django.conf import settings
from django.core.files import File
from django.core.management.base import BaseCommand
from django.utils.encoding import force_text

from music.models import Track


SILENT, NORMAL, VERBOSE, VERY_VERBOSE = 0, 1, 2, 3
API_URL = "http://ws.audioscrobbler.com/2.0/"


class Command(BaseCommand):
    help = "Imports top tracks from last.fm as JSON."
    verbosity = NORMAL

    def add_arguments(self, parser):
        # Named (optional) arguments
        parser.add_argument("--max_pages",
                            type=int,
                            default=0)

    def handle(self, *args, **options):
        self.verbosity = options.get("verbosity", self.verbosity)
        max_pages = options["max_pages"]

        params = {
            "method": "tag.gettoptracks",
            "tag": "disco",
            "api_key": settings.LAST_FM_API_KEY,
            "format": "json",
            "page": 1
        }

        r = requests.get(API_URL, params=params)
        response_dict = r.json()
        pages = int(response_dict.get("tracks", {})
                    .get("@attr", {})
                    .get("totalPages", 1))
        if max_pages > 0:
            pages = min(pages, max_pages)

        if self.verbosity >= NORMAL:
            self.stdout.write(
                f"=== Importing {pages} page(s) of tracks ===")

        self.save_page(response_dict)
        for page_number in range(2, pages + 1):
            params["page"] = page_number
            r = requests.get(API_URL, params=params)
            response_dict = r.json()
            self.save_page(response_dict)

    def save_page(self, data):
        for track_dict in data.get("tracks", {}).get("track"):
            if not track_dict:
                continue

            name = track_dict.get("name", "")
            artist = track_dict.get("artist", {}).get("name", "")
            url = track_dict.get("url", "")
            track, created = Track.objects.get_or_create(
                name=force_text(name),
                artist=force_text(artist),
                url=force_text(url))

            image_dict = track_dict.get("image", None)
            if created and image_dict:
                image_url = image_dict[1]["#text"]
                image_response = requests.get(image_url)
                track.image.save(
                    os.path.basename(image_url),
                    File(BytesIO(image_response.content)))

            if self.verbosity >= NORMAL:
                self.stdout.write(f" - {str(track)}")
