from django.shortcuts import render
from common.models import *
from django.db.models import Q

# Create your views here.


def president_index(request, ringi_id):
    login_user = request.session['user_data']
    approval = Approval.objects.filter(approval_id=ringi_id).reverse()
    user_data = User.objects.filter(user_id=login_user).values('position__position_id')
    remarks = Remarks.objects.filter(approval_id=ringi_id)
    context = {
        'approval': approval,  # 引数の稟議書IDと一致する稟議書データ
        'ringi_id': ringi_id,  # 稟議書ID
        'user_data': user_data,  # 役職ID
        'remarks': remarks,
    }
    return render(request, 'ringiList/mati_one.html', context)


def mdirector_index(request, ringi_id):
    login_user = request.session['user_data']
    user_data = User.objects.filter(user_id=login_user).values('position__position_id')
    approval = Approval.objects.filter(approval_id=ringi_id).reverse()
    remarks = Remarks.objects.filter(approval_id=ringi_id)
    context = {
        'approval': approval,
        'ringi_id': ringi_id,
        'user_data': user_data,
        'remarks': remarks,
    }
    return render(request, 'ringiList/mati_one.html', context)


def director_index(request, ringi_id):
    login_user = request.session['user_data']
    user_data = User.objects.filter(user_id=login_user).values('position__position_id')
    approval = Approval.objects.filter(approval_id=ringi_id).reverse()
    remarks = Remarks.objects.filter(approval_id=ringi_id)
    context = {
        'approval': approval,  # 引数の稟議書IDと一致する稟議書データ
        'ringi_id': ringi_id,  # 稟議書ID
        'user_data': user_data,  # 役職ID
        'remarks': remarks,
    }
    return render(request, 'ringiList/mati_one.html', context)


def chief_index(request, ringi_id):
    login_user = request.session['user_data']
    user_data = User.objects.filter(user_id=login_user).values('position__position_id')
    approval = Approval.objects.filter(approval_id=ringi_id).reverse()
    remarks = Remarks.objects.filter(approval_id=ringi_id)
    context = {
        'approval': approval,
        'ringi_id': ringi_id,
        'user_data': user_data,
        'remarks': remarks,
    }
    return render(request, 'ringiList/mati_one.html', context)


def enployee_index(request, ringi_id):
    login_user = request.session['user_data']
    user_data = User.objects.filter(user_id=login_user).values('position__position_id')
    approval = Approval.objects.filter(approval_id=ringi_id).reverse()
    context = {
        'approval': approval,
        'ringi_id': ringi_id,
        'user_data': user_data,
    }
    return render(request, 'ringiList/sakuseizumi_kobetu.html', context)

def shouninzumi_list(request):
    login_user = request.session['user_data']
    user_data = User.objects.filter(user_id=login_user).values('position__position_id')
    president = Approval.objects.all().filter(Q(p_president=1)).reverse()
    mdirector = Approval.objects.all().filter(Q(p_mdirectop=1)).reverse()
    director = Approval.objects.all().filter(Q(p_director=1)).reverse()
    chief = Approval.objects.filter(Q(p_chief=1)).reverse()
    context = {
        'president': president,  # 社長が承認した稟議書の全データ
        'mdirector': mdirector,  # 常務が承認した稟議書の全データ
        'director': director,  # 部長が承認した稟議書の全データ
        'chief': chief,  # 主任が承認した稟議書の全データ
        'user_data': user_data,  # ログインしたユーザの役職ID
    }
    return render(request, 'ringiList/shouninzumi_list.html', context)

def sakuseizumi_list(request):
    # この関数を使えるのは、一般社員と主任だけ、一般社員と主任のヘッダーの作成済みからだけにする。
    login_user = request.session['user_data']
    approval = Approval.objects.all().filter(user_id=login_user).reverse()
    context = {
        'approval': approval,  # 作成者がログインユーザと一致する稟議書データ
    }
    return render(request, 'ringiList/sakuseizumi_list.html', context)

# 承認待ちはトップページにあるやつで代用できると思うから書かない。


def shouninmati_list(request):
    login_user = request.session['user_data']
    user_data = User.objects.get(user_id=login_user)
    request.session['position_id'] = user_data.position_id
    president = Approval.objects.filter(Q(p_chief=1), Q(p_director=1), Q(p_mdirectop=1), Q(p_president=0),
                                        ~Q(user__user_id=login_user)).reverse()
    mdirector = Approval.objects.filter(Q(p_chief=1), Q(p_director=1), Q(p_mdirectop=0),
                                        ~Q(user__user_id=login_user)).reverse()
    director = Approval.objects.filter(Q(p_chief=1), Q(p_director=0), ~Q(user__user_id=login_user)).reverse()
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
    return render(request, 'ringiList/shouninmati_list.html', context)


def sakuseizumi_kobetu(request, ringi_id):
    login_user = request.session['user_data']
    user_data = User.objects.filter(user_id=login_user).values('position__position_id')
    approval = Approval.objects.filter(approval_id=ringi_id).reverse()
    context = {
        'approval': approval,
        'ringi_id': ringi_id,
        'user_data': user_data,
    }
    return render(request, 'ringiList/sakuseizumi_kobetu.html', context)


def shouninzumi_kobetu(request, ringi_id):
    login_user = request.session['user_data']
    user_data = User.objects.filter(user_id=login_user).values('position__position_id')
    approval = Approval.objects.filter(approval_id=ringi_id).reverse()
    remarks = Remarks.objects.filter(approval_id=ringi_id)
    context = {
        'approval': approval,
        'ringi_id': ringi_id,
        'user_data': user_data,
        'remarks': remarks,
    }
    return render(request, 'ringiList/shouninzumi_kobetu.html', context)
    # 自分より上の役職の人が承認したら撤回できないようにする。html上にif文で書く


def hiketu(request, approval_id):
    position = request.session['position_id']
    approval = Approval.objects.filter(approval_id=approval_id)
    remarks = Remarks.objects.filter(approval_id=approval_id)
    context = {
        'approval': approval_id,
        'remarks': remarks,
    }
    if position == 5:
        p = Approval.objects.filter(approval_id=approval_id)
        p.p_chief = 2
        p.save()
        #  ↑　主任の承認フラグを１に変える処理？書き方が合っているかは不明。
        # 主任の承認フラグを変える
    if position == 4:
        p = Approval.objects.filter(approval_id=approval_id)
        p.p_director = 2
        p.save()
    # 部長の承認フラグを変える
    if position == 3:
        p = Approval.objects.filter(approval_id=approval_id)
        p.p_mdirector = 2
        p.save()
    # 常務の承認フラグを変える
    if position == 2:
        p = Approval.objects.filter(approval_id=approval_id)
        p.p_president = 2
        p.save()
    # 社長の承認フラグを変える
    # 稟議書を否決する処理、引数として、稟議書IDと役職IDを受け取って、役職IDに一致する役職者の承認フラグを変える
    # ただ、承認待ち個別の画面で、否決ボタンを押したときに変数を二つ渡す方法がわからない。
    return render(request, 'ringiList/shouninzumi_kobetu.html', context)

def shounin(request, approval_id):
    position = request.session['position_id']
    approval = Approval.objects.filter(approval_id=approval_id)
    remarks = Remarks.objects.filter(approval_id=approval_id)
    context = {
        'approval': approval_id,
        'remarks': remarks,
    }
    if position == 5:
        p = Approval.objects.filter(approval_id=approval_id)
        p.p_chief = 1
        p.save()
    # 主任の承認フラグを変える
    if position == 4:
        p = Approval.objects.filter(approval_id=approval_id)
        p.p_director = 1
        p.save()
    # 部長の承認フラグを変える
    if position == 3:
        p = Approval.objects.filter(approval_id=approval_id)
        p.p_mdirector = 1
        p.save()
    # 常務の承認フラグを変える
    if position == 2:
        p = Approval.objects.filter(approval_id=approval_id)
        p.p_president = 1
        p.save()
    # 社長の承認フラグを変える
    return render(request, 'ringiList/shouninzumi_kobetu.html', context)


def tekkai(request, ringi_id):
    position = request.session['position_id']
    approval = Approval.objects.filter(approval_id=ringi_id)
    context = {
        'approval': ringi_id,
    }
    if position == 5:
        p = Approval.objects.filter(approval_id=ringi_id)
        p.p_chief = 0
        p.save()
    if position == 4:
        p = Approval.objects.filter(approval_id=ringi_id)
        p.p_director = 0
        p.save()
    if position == 3:
        p = Approval.objects.filter(approval_id=ringi_id)
        p.p_mdirector = 0
        p.save()
    if position == 2:
        p = Approval.objects.filter(approval_id=ringi_id)
        p.p_president = 0
        p.save()
    return render(request, 'ringiList/mati_one.html', context)


def remarks(request):
    request.get['remarks']



    #  稟議書を承認する処理、引数として、稟議書IDと役職IDを受け取って、役職IDに一致する役職者の承認フラグを変える


    """   稟議書の支払い総額によって、どの役職までの人が承認するのか決める方法がわからない   """