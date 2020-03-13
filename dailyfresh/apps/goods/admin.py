from django.contrib import admin
from apps.goods.models import GoodsType, GoodsSKU, Goods, GoodsImage, IndexGoodsBanner, IndexPromotionBanner, IndexTypeGoodsBanner


class GoodsTypeAdmin(admin.ModelAdmin):
    list_display = ['name', 'logo', 'image']


class GoodsAdmin(admin.ModelAdmin):
    list_display = ['name', 'detail']


class GoodsSKUAdmin(admin.ModelAdmin):
    list_display = ['type', 'goods', 'name', 'desc', 'price', 'unite', 'image', 'stock', 'sales', 'status']


class IndexGoodsBannerAdmin(admin.ModelAdmin):
    list_display = ['sku', 'image', 'index']


class IndexPromotionBannerAdmin(admin.ModelAdmin):
    list_display = ['name', 'url', 'image', 'index']


class IndexTypeGoodsBannerAdmin(admin.ModelAdmin):
    list_display = ['type', 'sku', 'display_type', 'index']


# Register your models here.
admin.site.register(GoodsType, GoodsTypeAdmin)
admin.site.register(GoodsSKU, GoodsSKUAdmin)
admin.site.register(Goods, GoodsAdmin)
# admin.site.register(GoodsImage)
admin.site.register(IndexGoodsBanner, IndexGoodsBannerAdmin)
admin.site.register(IndexPromotionBanner, IndexPromotionBannerAdmin)
admin.site.register(IndexTypeGoodsBanner, IndexTypeGoodsBannerAdmin)
