from django.conf import settings
from django.utils import translation
from haystack.backends.whoosh_backend import (WhooshSearchBackend,
                                              WhooshSearchQuery,
                                              WhooshEngine)
from haystack import connections
from haystack.constants import DEFAULT_ALIAS


class MultilingualWhooshSearchBackend(WhooshSearchBackend):
    def update(self, index, iterable,
               commit=True,
               language_specific=False):
        if not language_specific \
                and self.connection_alias == "default":
            current_language = (translation.get_language()
                                or settings.LANGUAGE_CODE)[:2]
            for lang_code, lang_name in settings.LANGUAGES:
                using = "default_%s" % lang_code
                translation.activate(lang_code)
                backend = connections[using].get_backend()
                backend.update(index, iterable, commit,
                               language_specific=True)
            translation.activate(current_language)
        elif language_specific:
            super().update(index, iterable, commit)


class MultilingualWhooshSearchQuery(WhooshSearchQuery):
    def __init__(self, using=DEFAULT_ALIAS):
        lang_code = translation.get_language()[:2]
        using = "default_%s" % lang_code
        super().__init__(using=using)


class MultilingualWhooshEngine(WhooshEngine):
    backend = MultilingualWhooshSearchBackend
    query = MultilingualWhooshSearchQuery
