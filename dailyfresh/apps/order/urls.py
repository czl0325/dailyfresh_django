from django.urls import path, re_path
from apps.order.views import OrderPlaceView, OrderCommitView1, OrderCommitView2, OrderPayView, OrderCheckView

urlpatterns = [
    re_path('^place$', OrderPlaceView.as_view(), name="place"),
    re_path('^commit$', OrderCommitView2.as_view(), name="commit"),
    re_path('^pay', OrderPayView.as_view(), name="pay"),
    re_path('^check$', OrderCheckView.as_view(), name="check"),
]
