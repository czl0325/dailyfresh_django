from django.shortcuts import render, redirect
from django.urls import reverse
from django.utils.decorators import method_decorator
from django.views.generic import View
from apps.user.models import User, Address
from utils.utils import LoginRequire
from django.http.response import HttpResponseRedirect
from django.forms.models import model_to_dict


# Create your views here.


class RegisterView(View):
    def get(self, request):
        return render(request, 'register.html')

    def post(self, request):
        username = request.POST.get("user_name")
        password = request.POST.get("pwd")
        email = request.POST.get('email')
        allow = request.POST.get('allow')
        if not all([username, password, email]):
            return render(request, 'register.html', {'errmsg': '信息填写不完整'})
        if allow != 'on':
            return render(request, 'register.html', {'errmsg': '请同意协议'})
        try:
            user = User.objects.get(username=username)
        except Exception as e:
            print(e)
            user = None
        if user is not None:
            return render(request, 'register.html', {'errmsg': '用户已存在'})
        user = User()
        user.username = username
        user.password = password
        user.email = email
        user.save()
        return redirect(reverse('user:login'))


class LoginView(View):
    def get(self, request):
        if 'username' in request.COOKIES:
            username = request.COOKIES.get('username')
            checked = 'checked'
        else:
            username = ''
            checked = ''
        return render(request, 'login.html', {'username': username, 'checked': checked})

    def post(self, request):
        username = request.POST.get("username")
        password = request.POST.get("pwd")
        remember = request.POST.get("remember")
        if not all([username, password]):
            return render(request, 'login.html', {'errmsg': '信息填写不完整'})
        try:
            user = User.objects.get(username=username)
        except:
            return render(request, 'login.html', {'errmsg': '查无此用户'})
        if password != user.password:
            return render(request, 'login.html', {'errmsg': '密码错误'})
        request.session["user_id"] = user.id
        next_url = request.GET.get("next_url")
        if next_url is None:
            response = redirect(reverse("goods:index"))
        else:
            response = HttpResponseRedirect(next_url)
        if remember == 'on':
            response.set_cookie('username', username, max_age=30 * 24 * 3600)
        else:
            response.delete_cookie('username')

        return response


class LogOutView(View):
    def get(self, request):
        del request.session['user_id']
        return redirect(reverse("goods:index"))


@method_decorator(LoginRequire, name='get')
class UserInfoView(View):
    def get(self, request):
        user_id = request.session.get("user_id")
        try:
            user = User.objects.get(id=user_id)
        except:
            return redirect(reverse("user:login"))
        address = Address.objects.get_default_address(user)
        context = {'page': 'info', 'user': user, 'address': address}
        return render(request, 'user_center_info.html', context)


@method_decorator(LoginRequire, name='dispatch')
class UserOrderView(View):
    def get(self, request):
        context = {'page': 'order'}
        return render(request, 'user_center_order.html', context)


@method_decorator(LoginRequire, name='get')
class UserSiteView(View):
    def get(self, request):
        address = Address.objects.filter(is_default=True).first()
        context = {'page': 'site', "address": address}
        return render(request, 'user_center_site.html', context)

    def post(self, request):
        receiver = request.POST.get("receiver")
        addr = request.POST.get("addr")
        zip_code = request.POST.get("zip_code")
        phone = request.POST.get("phone")
        if not all([receiver, addr, zip_code, phone]):
            return render(request, 'user_center_site.html', {'errmsg': "信息填写不完整"})
        user = User.objects.get(id=request.session.get("user_id"))
        if user is None:
            return HttpResponseRedirect("/user/login?next_url=" + request.path)
        addrObj = Address()
        addrObj.user = user
        addrObj.receiver = receiver
        addrObj.addr = addr
        addrObj.zip_code = zip_code
        addrObj.phone = phone
        address_default = Address.objects.get_default_address(user)
        if address_default is None:
            addrObj.is_default = True
        else:
            addrObj.is_default = False
        addrObj.save()
        if addrObj.is_default:
            address = addrObj
        else:
            address = address_default
        return render(request, 'user_center_site.html', {'page': 'site', "address": address})
