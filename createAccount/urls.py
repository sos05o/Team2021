from django.urls import path
from createAccount import views

app_name = 'account'

urlpatterns = [
    # .../account/にアクセスがあった時、views.pyのindex関数を呼び出す
    path('', views.index, name='account_index'),
]
