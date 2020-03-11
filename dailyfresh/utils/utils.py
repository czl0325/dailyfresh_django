from django.shortcuts import render, redirect
from django.urls import reverse


def LoginRequire(func):
    def checkLogin(request, *args, **kwargs):
        name = request.session.get("username")
        if name is not None:
            return func(request, *args, **kwargs)
        else:
            return redirect(reverse("user:login"))

    return checkLogin
