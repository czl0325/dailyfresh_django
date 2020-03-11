from django.shortcuts import render
from django.views.generic import View


# Create your views here.

class RegisterView(View):
    pass


class LoginView(View):
    def get(self, request):
        return render(request, 'login.html')
