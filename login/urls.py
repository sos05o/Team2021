from django.urls import path
from login import views

app_name = 'login'

urlpatterns = [
    # .../account/にアクセスがあった時、views.pyのindex関数を呼び出す
    path('', views.login, name='login'),
    path('first/', views.first, name='first'),
    path('logout/', views.logout, name='logout')
]
