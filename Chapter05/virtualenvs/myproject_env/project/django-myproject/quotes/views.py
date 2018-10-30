from django.shortcuts import render, redirect
from django.views.generic import ListView

from .forms import InspirationalQuoteForm
from .models import InspirationalQuote


class QuotesList(ListView):
    model = InspirationalQuote


def add_quote(request):
    form = InspirationalQuoteForm()
    if request.method == "POST":
        form = InspirationalQuoteForm(
            data=request.POST,
            files=request.FILES)
    if form.is_valid():
        form.save()
        return redirect("quotes-list")
    else:
        return render(request, "quotes/add_quote.html", {
            "form": form
        })
