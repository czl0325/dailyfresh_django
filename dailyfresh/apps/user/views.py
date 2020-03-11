from django.shortcuts import render, redirect
from django.urls import reverse
from django.views.generic import View
from apps.user.models import User

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
            return render(request, 'register.html')
        try:
            user = User.objects.get(username=username)
        except Exception as e:
            print(e)
            user = None
        if user is not None:
            return render(request, 'register.html')
        user = User()
        user.username = username
        user.password = password
        user.email = email
        user.save()
        return redirect(reverse('user:login'))


class LoginView(View):
    @staticmethod
    def get(request):
        return render(request, 'login.html')
