from django.shortcuts import render
from common.models import *
from django.db.models import Q

# Create your views here.
# トップページのhtmlに飛ぶ前に、セッションから取得したIDをもとに、その人の役職を取得し、その役職IDによってbase.htmlのヘッダーに表示させる内容を変える
# base.htmlにログインしている人の役職IDを飛ばし、そこからbase.htmlでIF文でヘッダーに表示する内容を決めて表示


def top_page(request):
    user_data = User.objects.get(user_id=request.session['user_data'])
    data = Approval.objects.all()
    approval = Approval.objects.filter(user_id=user_data)
    print(user_data)
    context = {
        'approval': approval,  # ユーザidと作成者idが一致する稟議書
        'user_data': user_data,  # ログインユーザのユーザデータ
        'data': data,  # 稟議書の全データ
        'model': get_Approval_query(request.session['user_data'])
    }

    return render(request, 'topPage/topPage.html', context)
