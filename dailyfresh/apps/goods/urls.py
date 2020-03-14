from django.urls import path, re_path
from apps.goods.views import GoodsIndexView, GoodsDetailView
from django.conf.urls import include, url

urlpatterns = [
    re_path('goods/detail/(?P<goods_id>\d+)', GoodsDetailView.as_view(), name="detail"),
    url(r'^', GoodsIndexView.as_view(), name="index"),
]
