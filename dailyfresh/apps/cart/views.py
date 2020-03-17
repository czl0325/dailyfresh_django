from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views import View
from apps.goods.models import GoodsSKU
from django_redis import get_redis_connection
from utils.utils import LoginRequire
from django.http import JsonResponse

# Create your views here.


@method_decorator(LoginRequire, name='post')
class AddCartView(View):
    def post(self, request):
        sku_id = request.POST.get("sku_id")
        user_id = request.session["user_id"]
        count = request.POST.get("count")
        if not all([sku_id, count]):
            return JsonResponse({"result": 100, "message": "数据不完整"})
        count = int(count)
        try:
            goods = GoodsSKU.objects.get(id=sku_id)
        except GoodsSKU.DoesNotExist:
            return JsonResponse({"result": 100, "message": "没有该商品"})
        conn = get_redis_connection('default')
        cart_key = "cart_%d" % user_id
        if count > goods.stock:
            return JsonResponse({"result": 100, "message": "商品库存不足"})
        conn.hincrby(cart_key, sku_id, count)
        cart_total = conn.hvals(cart_key)
        total = 0
        if cart_total is not None:
            for num in cart_total:
                total += int(num)
        return JsonResponse({"result": 0, "message": "加入购物车成功", "cart_total": total})


class CartListView(View):
    def get(self, request):
        user_id = request.session["user_id"]
        conn = get_redis_connection('default')
        cart_key = "cart_%d" % user_id
        cart_dic = conn.hgetall(cart_key)

        skus = []
        total_count = 0
        total_price = 0
        for sku_id, count in cart_dic.items():
            sku = GoodsSKU.objects.get(id=sku_id)
            sku.amount = sku.price * int(count)
            sku.count = int(count)
            skus.append(sku)
            total_price += sku.amount
            total_count += sku.count
        context = {"total_count": total_count, "total_price": total_price, "skus": skus}
        return render(request, 'cart.html', context)


class CartUpdateView(View):
    def post(self, request):
        sku_id = request.POST.get("sku_id")
        count = request.POST.get("count")
        if not all([sku_id, count]):
            return JsonResponse({"result": 100, "message": "缺少必要参数"})
        try:
            sku = GoodsSKU.objects.get(id=sku_id)
        except GoodsSKU.DoesNotExist:
            return JsonResponse({"result": 100, "message": "商品不存在"})
        if int(count) > sku.stock:
            return JsonResponse({"result": 100, "message": "商品库存不足", "data": {
                "stock": sku.stock
            }})
        user_id = request.session["user_id"]
        cart_key = "cart_%d" % user_id
        conn = get_redis_connection('default')
        conn.hset(cart_key, sku_id, count)
        return JsonResponse({"result": 0, "message": "更新成功"})