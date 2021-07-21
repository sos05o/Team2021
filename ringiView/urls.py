from django.urls import path
from ringiView import views

app_name = 'view'

urlpatterns = [
    path('', views.index, name='view_index'),
]