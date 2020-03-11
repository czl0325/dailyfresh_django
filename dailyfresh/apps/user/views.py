from django.shortcuts import render, redirect
from django.urls import reverse
from django.utils.decorators import method_decorator
from django.views.generic import View
from apps.user.models import User
from utils.utils import LoginRequire


# Create your views here.


class RegisterView(View):
    @staticmethod
    def get(request):
        return render(request, 'register.html')

    @staticmethod
    def post(request):
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
    @staticmethod
    def get(request):
        if 'username' in request.COOKIES:
            username = request.COOKIES.get('username')
            checked = 'checked'
        else:
            username = ''
            checked = ''
        return render(request, 'login.html', {'username': username, 'checked': checked})

    @staticmethod
    def post(request):
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
        request.session["username"] = username
        response = redirect(reverse("goods:index"))
        if remember == 'on':
            response.set_cookie('username', username, max_age=30*24*3600)
        else:
            response.delete_cookie('username')
        return response


@method_decorator(LoginRequire, name='get')
class UserInfoView(View):
    @staticmethod
    def get(request):
        username = request.session.get("username")
        try:
            user = User.objects.get(username=username)
        except:
            return redirect(reverse("user:login"))
        return render(request, 'user_center_info.html', {'user': user})


@method_decorator(LoginRequire, name='dispatch')
class UserOrderView(View):
    @staticmethod
    def get(request):
        return render(request, 'user_center_order.html')


class UserSiteView(View):
    @staticmethod
    @LoginRequire
    def get(request):
        return render(request, 'user_center_site.html')
