from django.urls import path, re_path
from apps.goods.views import GoodsIndexView
from django.conf.urls import include, url

urlpatterns = [
    url(r'^', GoodsIndexView.as_view(), name="index"),
]
