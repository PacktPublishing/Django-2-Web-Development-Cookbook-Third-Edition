from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect

from .forms import MessageForm


@login_required
def message_to_user(request):
    if request.method == "POST":
        form = MessageForm(request, data=request.POST)
        if form.is_valid():
            form.save()
            return redirect("message_sent")
    else:
        form = MessageForm(request)

    return render(request,
                  "email_messages/message_to_user.html",
                  {"form": form})


@login_required
def message_sent(request):
    return render(request,
                  "email_messages/message_sent.html")
