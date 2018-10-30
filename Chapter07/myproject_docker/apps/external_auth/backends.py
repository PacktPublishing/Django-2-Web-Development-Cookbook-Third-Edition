import requests

from social_core.backends.oauth import BaseOAuth2


class Auth0(BaseOAuth2):
    name = "auth0"
    SCOPE_SEPARATOR = " "
    ACCESS_TOKEN_METHOD = "POST"
    EXTRA_DATA = [
        ("picture", "picture")
    ]

    def authorization_url(self):
        return f"https://{self.setting('DOMAIN')}/authorize"

    def access_token_url(self):
        return f"https://{self.setting('DOMAIN')}/oauth/token"

    def get_user_id(self, details, response):
        return details['user_id']

    def get_user_details(self, response):
        url = f"https://{self.setting('DOMAIN')}/userinfo"
        headers = {
            "authorization": f"Bearer {response['access_token']}"
        }
        resp = requests.get(url, headers=headers)
        userinfo = resp.json()

        return {
            "username": userinfo["nickname"],
            "first_name": userinfo["name"],
            "picture": userinfo["picture"],
            "user_id": userinfo["sub"]
        }
