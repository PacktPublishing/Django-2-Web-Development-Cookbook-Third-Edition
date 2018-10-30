{% load static %}
{% get_media_prefix as MEDIA_URL %}
{% get_static_prefix as STATIC_URL %}
window.project_settings = {
    MEDIA_URL: '{{ MEDIA_URL|escapejs }}',
    STATIC_URL: '{{ STATIC_URL|escapejs }}',
    lang: '{{ LANGUAGE_CODE|escapejs }}',
    languages: { {% for lang_code, lang_name in LANGUAGES %}
        '{{ lang_code|escapejs }}': '{{ lang_name|escapejs }}'{% if not forloop.last %},{% endif %}
   {% endfor %} }
};
