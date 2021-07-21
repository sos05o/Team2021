from django.urls import path
from createDep import views

app_name = 'dep'

urlpatterns = [
    path('', views.index, name='dep_index'),
]
