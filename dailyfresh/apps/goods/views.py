from django.shortcuts import render
from django.views.generic import View
from apps.goods.models import GoodsType, IndexGoodsBanner, IndexPromotionBanner, IndexTypeGoodsBanner


# Create your views here.


class GoodsIndexView(View):
    @staticmethod
    def get(request):
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
        return render(request, 'index.html', context)
