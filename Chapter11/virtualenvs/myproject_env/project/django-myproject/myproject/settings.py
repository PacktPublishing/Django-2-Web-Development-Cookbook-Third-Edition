from django.utils.translation import (gettext_lazy as gettext,
                                      ugettext_lazy as _)

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

CMS_LANGUAGES = {
    "default": {
        "public": True,
        "hide_untranslated": False,
        "redirect_on_fallback": True,
    },
    1: [
        {
            "public": True,
            "code": "en",
            "hide_untranslated": False,
            "name": gettext("en"),
            "redirect_on_fallback": True,
        },
        {
            "public": True,
            "code": "de",
            "hide_untranslated": False,
            "name": gettext("de"),
            "redirect_on_fallback": True,
        },
        {
            "public": True,
            "code": "fr",
            "hide_untranslated": False,
            "name": gettext("fr"),
            "redirect_on_fallback": True,
        },
        {
            "public": True,
            "code": "lt",
            "hide_untranslated": False,
            "name": gettext("lt"),
            "redirect_on_fallback": True,
        },
    ],
}

MAGAZINE_STATUS_CHOICES = (
    ("draft", _("Draft")),
    ("imported", _("Imported")),
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

SOCIAL_AUTH_AUTH0_DOMAIN = os.environ.get('AUTH0_DOMAIN')
SOCIAL_AUTH_AUTH0_KEY = os.environ.get('AUTH0_KEY')
SOCIAL_AUTH_AUTH0_SECRET = os.environ.get('AUTH0_SECRET')
SOCIAL_AUTH_AUTH0_SCOPE = ['openid']
SOCIAL_AUTH_TRAILING_SLASH = False

LOGIN_URL = '/login/auth0'
LOGIN_REDIRECT_URL = '/dashboard/'
LOGOUT_REDIRECT_URL = '/'

CACHES = {
    'memcached': {
        'BACKEND': 'django.core.cache.backends.'
                   'memcached.MemcachedCache',
        'LOCATION': os.environ.get('CACHE_LOCATION',
                                   '127.0.0.1:11211'),
        "TIMEOUT": 60, # 1 minute
        "KEY_PREFIX": os.environ.get('CACHE_KEY',
                                     'myproject_production'),
    },
    'redis': {
        'BACKEND': 'django_redis.cache.RedisCache',
        'LOCATION': os.environ.get('CACHE_LOCATION',
                                   'redis://127.0.0.1:6379/1'),
        "TIMEOUT": 60, # 1 minute
        "KEY_PREFIX": os.environ.get('CACHE_KEY',
                                     'myproject_production'),
        'OPTIONS': {
            'CLIENT_CLASS': 'django_redis.client.DefaultClient',
            'IGNORE_EXCEPTIONS': True,
        },
    },
}
# CACHES['default'] = CACHES['memcached']
# or
# CACHES['default'] = CACHES['redis']

CMS_APPHOOKS = (
    "movies.cms_apps.MoviesApphook",
)

CMS_PLACEHOLDER_CONF = {
    "main_content": {
        "name": gettext("Main Content"),
        "plugins": (
            "EditorialContentPlugin",
            "TextPlugin",
        ),
    },
    "cms/magazine.html main_content": {
        "name": gettext("Magazine Main Content"),
        "plugins": (
            "EditorialContentPlugin",
            "TextPlugin"
        ),
        "extra_context": {
            "editorial_content_template":
                "cms/plugins/editorial_content/magazine.html",
        }
    },
}

LAST_FM_API_KEY = os.environ.get('LAST_FM_API_KEY')

REST_FRAMEWORK = {
    "DEFAULT_PERMISSION_CLASSES": [
        "rest_framework.permissions."
        "DjangoModelPermissionsOrAnonReadOnly"
    ],
    "DEFAULT_PAGINATION_CLASS":
        "rest_framework.pagination.LimitOffsetPagination",
    "PAGE_SIZE": 100,
}
