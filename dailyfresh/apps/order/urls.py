from django.urls import path, re_path
from apps.order.views import OrderPlaceView

urlpatterns = [
    re_path('^place$', OrderPlaceView.as_view(), name="place"),
]
