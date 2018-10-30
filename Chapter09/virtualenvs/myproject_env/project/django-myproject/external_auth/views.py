from django.views.generic import TemplateView


class DashboardView(TemplateView):
    template_name = "external_auth/dashboard.html"

    def dispatch(self, request, *args, **kwargs):
        self.request = request
        return super().dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        user = self.request.user
        auth0_user = user.social_auth.get(provider="auth0")
        context = super().get_context_data(**kwargs)
        context["user_id"] = auth0_user.uid
        context["name"] = user.first_name
        context["picture"] = auth0_user.extra_data["picture"]
        return context
