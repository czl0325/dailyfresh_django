from django.urls import path, re_path
from apps.cart.views import AddCartView, CartListView, CartUpdateView
from django.conf.urls import include, url

urlpatterns = [
    re_path('^add$', AddCartView.as_view(), name="add"),
    re_path('^update$', CartUpdateView.as_view(), name="update"),
    re_path('^', CartListView.as_view(), name="list")
]
