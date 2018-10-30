import os, requests
from io import BytesIO
from xml.etree import ElementTree

from django.core.management.base import BaseCommand
from django.utils.encoding import force_text
from django.conf import settings
from django.core.files import File

from music.models import Track


SILENT, NORMAL, VERBOSE, VERY_VERBOSE = 0, 1, 2, 3
API_URL = "http://ws.audioscrobbler.com/2.0/"


class Command(BaseCommand):
    help = "Imports top tracks from last.fm as XML."
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
            "tag": "folk",
            "api_key": settings.LAST_FM_API_KEY,
            "format": "xml",
        }

        r = requests.get(API_URL, params=params)
        root = ElementTree.fromstring(r.content)

        pages = int(root.find("tracks").attrib
                    .get("totalPages", 1))
        if max_pages > 0:
            pages = min(pages, max_pages)

        if self.verbosity >= NORMAL:
            self.stdout.write(
                f"=== Importing {pages} page(s) of tracks ===")

        self.save_page(root)

        for page_number in range(2, pages + 1):
            params["page"] = page_number
            r = requests.get(API_URL, params=params)
            root = ElementTree.fromstring(r.content)
            self.save_page(root)

    def save_page(self, root):
        for track_node in root.findall("tracks/track"):
            if not track_node:
                continue

            name = track_node.find("name").text
            artist = track_node.find("artist/name").text
            url = track_node.find("url").text
            track, created = Track.objects.get_or_create(
                name=force_text(name),
                artist=force_text(artist),
                url=force_text(url))

            image_node = track_node.find("image[@size='medium']")
            if created and image_node is not None:
                image_url = image_node.text
                image_response = requests.get(image_url)
                track.image.save(
                    os.path.basename(image_url),
                    File(BytesIO(image_response.content)))

            if self.verbosity >= NORMAL:
                self.stdout.write(f" - {track}")
