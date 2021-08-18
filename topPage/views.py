from django.shortcuts import render


# Create your views here.


def login(request):
    return render(request, 'login/login.html')


def first(request):
    return render(request, 'login/firstLogin.html')
