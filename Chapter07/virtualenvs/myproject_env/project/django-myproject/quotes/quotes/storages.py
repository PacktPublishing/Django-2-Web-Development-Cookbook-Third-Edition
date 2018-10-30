from django.conf import settings
from django.core.files.storage import FileSystemStorage


upload_storage = FileSystemStorage(location=settings.UPLOAD_ROOT)
