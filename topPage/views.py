from django.shortcuts import render
from common.models import *
from django.db.models import Q

# Create your views here.
# トップページのhtmlに飛ぶ前に、セッションから取得したIDをもとに、その人の役職を取得し、その役職IDによってbase.htmlのヘッダーに表示させる内容を変える
# base.htmlにログインしている人の役職IDを飛ばし、そこからbase.htmlでIF文でヘッダーに表示する内容を決めて表示


def top_page(request):
    login_user = request.session['user_data']
    user_data = User.objects.filter(user_id=login_user).values('position__position_id')
    president = Approval.objects.all().filter(Q(p_chief=1), Q(p_director=1), Q(p_mdirector=1),Q(p_president=0), ~Q(user__user_id=login_user)).reverse()
    mdirector = Approval.objects.all().filter(Q(p_chief=1), Q(p_director=1), Q(p_mdirector=0), ~Q(user__user_id=login_user)).reverse()
    director = Approval.objects.all().filter(Q(p_chief=1), Q(p_director=0), ~Q(user__user_id=login_user)).reverse()
    chief = Approval.objects.filter(Q(p_chief=0), ~Q(user__user_id=login_user)).reverse()
    employee = Approval.objects.all().filter(Q(p_chief=0), Q(user__user_id=login_user)).reverse()

    context = {
        'president': president,
        'mdirector': mdirector,
        'director': director,
        'chief': chief,
        'employee': employee,
        'user_data': user_data,
    }
    print(user_data)
    return render(request, 'topPage/topPage.html', context)