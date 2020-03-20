from django.urls import path, re_path
from apps.user.views import RegisterView, LoginView, UserInfoView, UserOrderView, UserSiteView, LogOutView
from django.conf.urls import include, url

urlpatterns = [
    url(r'^login$', LoginView.as_view(), name="login"),
    url(r'^register$', RegisterView.as_view(), name="register"),
    url(r'^info$', UserInfoView.as_view(), name="info"),
    url(r'^order/(?P<page>\d+)$', UserOrderView.as_view(), name="order"),
    url(r'^site$', UserSiteView.as_view(), name="site"),
    url(r'^logout$', LogOutView.as_view(), name="logout"),
]
