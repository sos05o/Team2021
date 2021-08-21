from django.urls import path
from ringiList import views

app_name = 'ringiList'

urlpatterns = [
    # .../account/にアクセスがあった時、views.pyのindex関数を呼び出す
    path('<int:ringi_id>', views.director_index, name='director'),
    path('<int:ringi_id>', views.chief_index, name='chief'),
    path('<int:ringi_id>', views.enployee_index, name='employee'),
    path('<int:ringi_id>', views.mdirector_index, name='mdirector'),
    path('<int:ringi_id>', views.president_index, name='president'),
    path('', views.shouninzumi_list, name='shouninzumi'),
    path('<int:approval_id>', views.shounin, name='shounin'),
    path('<int:approval_id>', views.hiketu, name='hiketu'),
    path('', views.sakuseizumi_list, name='sakuseizumi'),
    path('<int:ringi_id>', views.sakuseizumi_kobetu, name='sakuseizumikobetu'),
    path('<int:ringi_id>', views.shouninzumi_kobetu, name='shouninzumikobetu'),
    path('<int:ringi_id>', views.tekkai , name='tekkai'),
    path('', views.remarks, name='remarks'),
]
