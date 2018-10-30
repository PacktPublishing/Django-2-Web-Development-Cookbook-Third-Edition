import csv
from django.core.management.base import BaseCommand

from movies.models import Movie


SILENT, NORMAL, VERBOSE, VERY_VERBOSE = 0, 1, 2, 3


class Command(BaseCommand):
    help = ("Imports movies from a local CSV file. Expects each"
            " row in the CSV to contain a single movie's"
            " title, release year, rating and rank.")

    def add_arguments(self, parser):
        # Positional arguments
        parser.add_argument("file_path",
                            nargs=1,
                            type=str)

    def handle(self, *args, **options):
        verbosity = options.get("verbosity", NORMAL)
        file_path = options["file_path"][0]

        if verbosity >= NORMAL:
            self.stdout.write("=== Importing movies ===")

        with open(file_path) as f:
            reader = csv.reader(f)
            for row in enumerate(reader):
                index, (title, release_year, rating, rank) = row
                if index == 0:
                    # let's skip the column headers
                    continue
                movie, created = Movie.objects.get_or_create(
                    title=title,
                    release_year=release_year,
                    rank=rank,
                    rating=rating)
                if verbosity >= NORMAL:
                    self.stdout.write(
                        f"{movie.rank}. {movie.title}")
