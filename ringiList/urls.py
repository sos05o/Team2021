from django.urls import path
from ringiList import views

app_name = 'ringiList'

urlpatterns = [
    # .../account/にアクセスがあった時、views.pyのindex関数を呼び出す
    path('director/<int:approval_id>/', views.director_index, name='director'),
    path('chief/<int:approval_id>/', views.chief_index, name='chief'),
    path('employee/<int:approval_id>/', views.employee_index, name='employee'),
    path('mdirector/<int:approval_id>/', views.mdirector_index, name='mdirector'),
    path('president/<int:approval_id>/', views.president_index, name='president'),
    path('yesapproval/<int:approval_id>/', views.shounin, name='shounin'),
    path('noapproval/<int:approval_id>/', views.hiketu, name='hiketu'),
    path('created/<int:approval_id>/', views.sakuseizumi_kobetu, name='sakuseizumikobetu'),
    path('approved/<int:approval_id>/', views.shouninzumi_kobetu, name='shouninzumikobetu'),
    path('cancel/<int:approval_id>/', views.tekkai, name='tekkai'),
    # path('', views.remarks, name='remarks'),
    path('viewList/<str:check_text>/', views.get_list, name='list'),
    path('', views.back, name='back'),
]
