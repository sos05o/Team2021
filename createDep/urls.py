from django.urls import path
from createDep import views

app_name = 'dep'

urlpatterns = [
    path('create/', views.create, name='create'),
    path('dep-list/', views.dep_list, name='dep-list'),
    path('position-list/<int:num>/', views.position_list, name='position-list'),
    path('director/<int:num>/', views.director, name='director'),
    path('chief/<int:num>/', views.chief, name='chief'),
    path('employee-1/<int:num>/', views.employee_1, name='employee-1'),
    path('employee-2/<int:num>/', views.employee_2, name='employee-2'),
    path('user-list/<int:num>/', views.user_list, name='user-list'),
    path('', views.top, name='top')
    #     position-list,
]
