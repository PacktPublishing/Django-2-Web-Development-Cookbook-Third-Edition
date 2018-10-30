from django.utils.translation import ugettext_lazy as _

from .config.dev import *

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'myproject',
        'USER': 'root',
        'PASSWORD': 'root',
    }
}

LANGUAGE_CODE = 'en'

LANGUAGES = (
    ("en", "English"),
    ("de", "Deutsch"),
    ("fr", "Français"),
    ("lt", "Lietuvių kalba"),
)

MAGAZINE_STATUS_CHOICES = (
    ("imported", _("Imported")),
    ("draft", _("Draft")),
    ("published", _("Published")),
    ("not_listed", _("Not Listed")),
    ("expired", _("Expired")),
)

HAYSTACK_CONNECTIONS = {
    'default_en': {
        'ENGINE': 'search.multilingual_whoosh_backend.'
                  'MultilingualWhooshEngine',
        'PATH': os.path.join(BASE_DIR, 'tmp/whoosh_index_en'),
    },
    'default_de': {
        'ENGINE': 'search.multilingual_whoosh_backend.'
                  'MultilingualWhooshEngine',
        'PATH': os.path.join(BASE_DIR, 'tmp/whoosh_index_de'),
    },
    'default_fr': {
        'ENGINE': 'search.multilingual_whoosh_backend.'
                  'MultilingualWhooshEngine',
        'PATH': os.path.join(BASE_DIR, 'tmp/whoosh_index_fr'),
    },
    'default_lt': {
        'ENGINE': 'search.multilingual_whoosh_backend.'
                  'MultilingualWhooshEngine',
        'PATH': os.path.join(BASE_DIR, 'tmp/whoosh_index_lt'),
    },
}
HAYSTACK_CONNECTIONS['default'] = \
    HAYSTACK_CONNECTIONS[f'default_{LANGUAGE_CODE}']

MAPS_API_KEY = os.environ.get("MAPS_API_KEY")
