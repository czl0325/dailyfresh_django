from django.urls import path, re_path
from apps.user.views import RegisterView, LoginView
from django.conf.urls import include, url

urlpatterns = [
    url(r'^login$', LoginView.as_view(), name="login"),
    url(r'^register$', RegisterView.as_view(), name="register"),
]
