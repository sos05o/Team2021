from django.urls import path
from createDep import views

app_name = 'dep'

urlpatterns = [
    path('create/', views.create, name='create'),
    path('user-list/', views.user_list, name='user-list'),
    path('dep-list', views.dep_list, name='dep-list'),
    path('position_list/', views.position_list, name='position-list'),
    path('director/', views.director, name='director'),
    path('chief/', views.chief, name='chief'),
    path('employee-1/', views.employee_1, name='employee-1'),
    path('employee-2/', views.employee_2, name='employee-2'),

    path('', views.top, name='top')
    #     position-list,
]
