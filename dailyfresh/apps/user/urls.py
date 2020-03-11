from django.urls import path, re_path
from apps.user.views import RegisterView, LoginView, UserInfoView, UserOrderView, UserSiteView
from django.conf.urls import include, url

urlpatterns = [
    url(r'^login$', LoginView.as_view(), name="login"),
    url(r'^register$', RegisterView.as_view(), name="register"),
    url(r'^', UserInfoView.as_view(), name="user"),
    url(r'^order$', UserOrderView.as_view(), name="order"),
    url(r'^site$', UserSiteView.as_view(), name="site"),
]
