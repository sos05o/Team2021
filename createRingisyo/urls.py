from django.urls import path
from createRingisyo import views

app_name = 'create'

urlpatterns = [
    path('', views.create, name='create'),
    path('check/', views.check, name='check'),
]
