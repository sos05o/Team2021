import hashlib

from django.shortcuts import render, redirect
from common.models import *
from Team2021 import slack_message as s_m_send


# Create your views here.


def login(request):
    if request.method == 'POST':
        if request.POST['user_id'] and request.POST['user_password']:
            user_id = request.POST['user_id']
            password = request.POST['user_password']
            user_data = User.objects.get(pk=user_id)
            hashed_pw = create_hashed_pw(pw=password, salt=user_data.salt)
            if hashed_pw == user_data.pw:  # トップページに遷移
                request.session['user_data'] = user_data.user_id
                if user_data.login_flag:
                    return redirect('login:first')
                else:
                    return render(request, 'login/sample.html')
            else:
                return render(request, 'login/login.html')
        return redirect('login:login')
    elif request.method == 'GET':
        return render(request, 'login/login.html')


def first(request):
    if request.method == 'POST':
        if request.POST['pw'] and request.POST['pw_re']:
            if request.session['user_data']:
                user_data = User.objects.get(pk=request.session['user_data'])
                salt = user_data.salt
                hashed_pw = create_hashed_pw(salt=salt, pw=request.POST['pw'])
                user_data.pw = hashed_pw
                user_data.login_flag = False
                user_data.save()
                return render(request, 'login/sample.html')
        return redirect('login:login')
    elif request.method == 'GET':
        if request.session['user_data']:
            return render(request, 'login/firstLogin.html')
        else:
            return redirect('login:login')


def create_hashed_pw(pw, salt):
    b_pw = bytes(pw, 'utf-8')
    b_salt = bytes(salt, 'utf-8')
    hashed_pw = hashlib.pbkdf2_hmac('sha256', b_pw, b_salt, 100).hex()
    return hashed_pw
