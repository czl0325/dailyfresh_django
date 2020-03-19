from django.shortcuts import render, redirect
from django.utils.decorators import method_decorator
from django.views import View
from utils.utils import LoginRequire
from apps.user.models import User, Address
from apps.goods.models import GoodsSKU
from django.urls import reverse
from django_redis import get_redis_connection
from django.http import JsonResponse
from apps.order.models import OrderInfo, OrderGoods
from datetime import datetime
from django.db import transaction

# Create your views here.


@method_decorator(LoginRequire, name='dispatch')
class OrderPlaceView(View):
    def post(self, request):
        try:
            user_id = request.session.get("user_id")
            user = User.objects.get(id=user_id)
        except User.DoesNotExist:
            return redirect(reverse('user:login'))

        addrs = Address.objects.filter(user=user)

        sku_ids = request.POST.getlist("sku_ids")
        if not sku_ids:
            return redirect(reverse("cart:list"))

        skus = []
        total_count = 0
        total_price = 0
        conn = get_redis_connection('default')
        cart_key = "cart_%d" % user_id
        for sku_id in sku_ids:
            try:
                sku = GoodsSKU.objects.get(id=sku_id)
            except GoodsSKU.DoesNotExist:
                return render(request, 'cart.html', {"err": "非法请求"})
            count = conn.hget(cart_key, sku_id)
            amount = sku.price * int(count)
            sku.count = int(count)
            sku.amount = amount
            skus.append(sku)
            total_count += int(count)
            total_price += amount

        # 运费写死
        transit_price = 10

        # 实付款
        total_pay = total_price + transit_price

        sku_ids = ','.join(sku_ids)

        context = {"addrs": addrs, "total_count": total_count, "total_price": total_price, "transit_price": transit_price, "total_pay": total_pay, "skus": skus, "sku_ids": sku_ids}
        return render(request, 'order.html', context)


@method_decorator(LoginRequire, name='dispatch')
class OrderCommitView(View):
    def post(self, request):
        try:
            user = User.objects.get(id=request.session.get("user_id"))
        except User.DoesNotExist:
            return JsonResponse({"result": 100, "message": "非法用户"})
        addr_id = request.POST.get("addr_id")
        pay_method = request.POST.get("pay_method")
        sku_ids = request.POST.get("sku_ids")
        if not all([addr_id, pay_method, sku_ids]):
            return JsonResponse({"result": 100, "message": "缺少必要参数"})

        try:
            addr = Address.objects.get(id=addr_id)
        except Address.DoesNotExist:
            return JsonResponse({"result": 100, "message": "无此地址"})

        if pay_method not in OrderInfo.PAY_METHOD_CHOICES.keys():
            return JsonResponse({"result": 100, "message": "支付方式非法"})

        save_id = transaction.savepoint()
        try:
            # 创建订单核心业务
            order_id = datetime.now().strftime('%Y%m%d_%H%M%S.%f') + "_" + user.id
            # 运费
            transit_price = 10
            # 总数目和总金额
            total_count = 0
            total_price = 0

            order = OrderInfo.objects.create(order_id=order_id, user=user, addr=addr, pay_method=pay_method, total_count=total_count, total_price=total_price, transit_price=transit_price)

            conn = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id
            sku_ids = sku_ids.split(',')
            for sku_id in sku_ids:
                try:
                    sku = GoodsSKU.objects.get(id=sku_id)
                except GoodsSKU.DoesNotExist:
                    transaction.savepoint_rollback(save_id)
                    return JsonResponse({"result": 100, "message": "商品不存在"})

                count = conn.hget(cart_key, sku_id)
                if int(count) > sku.stock:
                    transaction.savepoint_rollback(save_id)
                    return JsonResponse({"result": 100, "message": sku.name+"库存不足"})

                OrderGoods.objects.create(order=order, sku=sku, count=count, price=sku.price)

                sku.stock -= int(count)
                sku.sales += int(count)

                total_count += int(count)
                total_price += sku.price * int(count)

                sku.save()

            order.total_price = total_price
            order.total_count = total_count
            order.save()

            # 清除用户购物车中对应的记录
            conn.hdel(cart_key, *sku_ids)
        except Exception as e:
            transaction.savepoint_rollback(save_id)
            return JsonResponse({"result": 101, "message": "下单失败"})

        return JsonResponse({"result": 0, "message": "订单创建成功"})