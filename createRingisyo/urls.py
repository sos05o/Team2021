from django.urls import path
from createRingisyo import views

app_name = 'create'

urlpatterns = [
    path('', views.index, name='create_index'),
]