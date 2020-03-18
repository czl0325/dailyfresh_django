from django.shortcuts import render, redirect, reverse
from django.utils.decorators import method_decorator
from django.views.generic import View
from apps.goods.models import GoodsType, IndexGoodsBanner, IndexPromotionBanner, IndexTypeGoodsBanner, GoodsSKU
from django_redis import get_redis_connection
from django.core.cache import cache
from apps.user.models import User

# Create your views here.


class GoodsIndexView(View):
    def get(self, request):
        context = cache.get("index_page_data")
        if context is None:
            # 设置缓存
            types = GoodsType.objects.all()
            banners = IndexGoodsBanner.objects.all()
            advertisements = IndexPromotionBanner.objects.all()

            for type in types:
                # 获取type种类首页分类商品的图片展示信息
                image_banners = IndexTypeGoodsBanner.objects.filter(type=type, display_type=1).order_by('index')
                title_banners = IndexTypeGoodsBanner.objects.filter(type=type, display_type=0).order_by('index')
                type.image_banners = image_banners
                type.title_banners = title_banners

            context = {"types": types, "banners": banners, "advertisements": advertisements}
            cache.set("index_page_data", context, 3600)
        user_id = request.session.get("user_id")
        if user_id is not None:
            try:
                user = User.objects.get(id=user_id)
            except User.DoesNotExist:
                pass
            if user is not None:
                conn = get_redis_connection("default")
                cart_key = "cart_%d" % user.id
                cart_count = conn.hlen(cart_key)
                context.update(user=user)
                context.update(cart_count=cart_count)
        return render(request, 'index.html', context)


class GoodsDetailView(View):
    def get(self, request, goods_id):
        try:
            sku = GoodsSKU.objects.get(id=goods_id)
        except GoodsSKU.DoesNotExist:
            return redirect(reverse('goods:index'))
        new_skus = GoodsSKU.objects.filter(type=sku.type).order_by("-create_time")[:2]
        same_spu_skus = GoodsSKU.objects.filter(goods=sku.goods).exclude(id=sku.id)
        total = 0
        try:
            if request.session["user_id"] is not None:
                conn = get_redis_connection('default')
                history_key = "history_%d" % request.session["user_id"]
                conn.lrem(history_key, 0, goods_id)
                conn.lpush(history_key, goods_id)
                conn.ltrim(history_key, 0, 4)
                cart_key = "cart_%d" % request.session["user_id"]
                cart_total = conn.hvals(cart_key)
                if cart_total is not None:
                    for num in cart_total:
                        total += int(num)
        except Exception as e:
            print(e)
        context = {'sku': sku, "new_skus": new_skus, "same_spu_skus": same_spu_skus, "cart_total": total}
        return render(request, 'detail.html', context)


