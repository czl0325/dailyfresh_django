from django.shortcuts import render, redirect
from django.urls import reverse, reverse_lazy
from django.http.response import HttpResponseRedirect

# 验证是否登录
def LoginRequire(func):
    def checkLogin(request, *args, **kwargs):
        name = request.session.get("user_id")
        if name is not None:
            return func(request, *args, **kwargs)
        else:
            return HttpResponseRedirect('/user/login?next_url=' + request.path)
            # return redirect(reverse("user:login", next_url=request.path))

    return checkLogin
