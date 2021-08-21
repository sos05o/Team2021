from django.urls import path
from topPage import views

app_name = 'topPage'

urlpatterns = [
    # .../account/にアクセスがあった時、views.pyのindex関数を呼び出す
    path('', views.top_page, name='topPage_index'),
]



# path('', views.Ringikobetu, name='ringi_kobetu')
# ringiview:ringi_kobetu  <int:your-args>
# 変数を渡すときは、pathの第一引数の''に書く<型: 変数名>