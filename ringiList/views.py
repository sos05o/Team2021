from django.shortcuts import render
from common.models import *
from django.db.models import Q


# Create your views here.


def president_index(request, approval_id):
    login_user = request.session['user_data']
    approval = Approval.objects.get(approval_id=approval_id)
    user_data = User.objects.get(user_id=login_user)
    remarks = Remarks.objects.filter(approval_id=approval_id)
    context = {
        'approval': approval,  # 引数の稟議書IDと一致する稟議書データ
        'ringi_id': approval_id,  # 稟議書ID
        'user_data': user_data.position_id,  # 役職ID
        'remarks': remarks,
    }
    return render(request, 'ringiList/mati_one.html', context)


def mdirector_index(request, approval_id):
    login_user = request.session['user_data']
    user_data = User.objects.get(user_id=login_user)
    approval = Approval.objects.get(approval_id=approval_id)
    remarks = Remarks.objects.filter(approval_id=approval_id)
    context = {
        'approval': approval,
        'ringi_id': approval_id,
        'user_data': user_data.position_id,
        'remarks': remarks,
    }
    return render(request, 'ringiList/mati_one.html', context)


def director_index(request, approval_id):
    login_user = request.session['user_data']
    user_data = User.objects.get(user_id=login_user)
    approval = Approval.objects.get(approval_id=approval_id)
    remarks = Remarks.objects.filter(approval_id=approval_id)
    context = {
        'approval': approval,  # 引数の稟議書IDと一致する稟議書データ
        'ringi_id': approval_id,  # 稟議書ID
        'user_data': user_data.position_id,  # 役職ID
        'remarks': remarks,
    }
    return render(request, 'ringiList/mati_one.html', context)


def chief_index(request, approval_id):
    login_user = request.session['user_data']
    user_data = User.objects.get(user_id=login_user)
    approval = Approval.objects.get(approval_id=approval_id)
    remarks = Remarks.objects.filter(approval_id=approval_id)
    context = {
        'approval': approval,
        'ringi_id': approval.approval_id,
        'user_data': user_data.position_id,
        'remarks': remarks,
    }
    return render(request, 'ringiList/mati_one.html', context)


def employee_index(request, approval_id):
    login_user = request.session['user_data']
    user_data = User.objects.get(user_id=login_user)
    approval = Approval.objects.filter(approval_id=approval_id).reverse()
    context = {
        'approval': approval,
        'ringi_id': approval_id,
        'user_data': user_data.position_id,
    }
    return render(request, 'ringiList/sakuseizumi_kobetu.html', context)


def sakuseizumi_kobetu(request, approval_id):
    login_user = request.session['user_data']
    user_data = User.objects.get(user_id=login_user)
    print(user_data)
    approval = Approval.objects.get(approval_id=approval_id)
    remarks = Remarks.objects.filter(approval_id=approval_id)
    print(approval)
    print(user_data.last_name)
    print(user_data.first_name)
    context = {
        'approval': approval,  # 受け取った稟議書idと一致する稟議書データ
        'ringi_id': approval_id,
        'user_data': user_data.position_id,
        'last_name': user_data.last_name,  # 記入者の苗字
        'first_name': user_data.first_name,  # 記入者の名前
        'remarks': remarks,
    }
    return render(request, 'ringiList/sakuseizumi_kobetu.html', context)


def shouninzumi_kobetu(request, approval_id):
    login_user = request.session['user_data']
    position = User.objects.get(user_id=login_user)
    approval = Approval.objects.get(approval_id=approval_id)
    remarks = Remarks.objects.filter(approval_id=approval_id)
    context = {
        'approval': approval,
        'ringi_id': approval_id,
        'position_id': position.position_id,
        'remarks': remarks,
    }
    return render(request, 'ringiList/shouninzumi_kobetu.html', context)
    # 自分より上の役職の人が承認したら撤回できないようにする。html上にif文で書く


def hiketu(request, approval_id):
    print("否決されました")
    position = User.objects.get(pk=request.session['user_data']).position_id
    approval = Approval.objects.get(approval_id=approval_id)
    remarks = Remarks.objects.filter(approval_id=approval_id)
    context = {
        'approval': approval,
        'remarks': remarks,
        'position_id': position,
    }
    if position == 5:
        print("主任が否決")
        approval.p_chief = 2
        approval.save()
        #  ↑　主任の承認フラグを１に変える処理？書き方が合っているかは不明。
        # 主任の承認フラグを変える
    if position == 4:
        approval.p_director = 2
        approval.save()
    # 部長の承認フラグを変える
    if position == 3:
        approval.p_mdirectop = 2
        approval.save()
    # 常務の承認フラグを変える
    if position == 2:
        approval.p_president = 2
        approval.save()
    # 社長の承認フラグを変える
    # 稟議書を否決する処理、引数として、稟議書IDと役職IDを受け取って、役職IDに一致する役職者の承認フラグを変える
    # ただ、承認待ち個別の画面で、否決ボタンを押したときに変数を二つ渡す方法がわからない。
    return render(request, 'ringiList/shouninzumi_kobetu.html', context)


def shounin(request, approval_id):
    print("承認されました")
    position = User.objects.get(pk=request.session['user_data']).position_id
    approval = Approval.objects.get(approval_id=approval_id)
    remarks = Remarks.objects.filter(approval_id=approval_id)
    context = {
        'approval': approval,
        'remarks': remarks,
        'position_id': position,
    }
    if position == 5:
        approval.p_chief = 1
        approval.save()
    # 主任の承認フラグを変える
    if position == 4:
        approval.p_director = 1
        approval.save()
    # 部長の承認フラグを変える
    if position == 3:
        print('ok')
        approval.p_mdirectop = 1
        approval.save()
    # 常務の承認フラグを変える
    if position == 2:
        approval.p_president = 1
        approval.save()
    # 社長の承認フラグを変える
    return render(request, 'ringiList/shouninzumi_kobetu.html', context)


def tekkai(request, approval_id):
    position = User.objects.get(pk=request.session['user_data']).position_id
    approval = Approval.objects.get(approval_id=approval_id)
    context = {
        'approval': approval,
    }
    if position == 5:
        approval.p_chief = 0
        approval.save()
    if position == 4:
        approval.p_director = 0
        approval.save()
    if position == 3:
        approval.p_mdirectop = 0
        approval.save()
    if position == 2:
        approval.p_president = 0
        approval.save()
    return render(request, 'ringiList/mati_one.html', context)


"""
def remarks(request):
    request.get['remarks']
"""


def get_list(request, check_text):
    if check_text == "create":  # 作成済み一覧へ遷移
        login_user = request.session['user_data']
        approval = Approval.objects.filter(user_id=login_user).reverse()
        context = {
            'approval': approval,  # 作成者がログインユーザと一致する稟議書データ
        }
        return render(request, 'ringiList/sakuseizumi_list.html', context)

    elif check_text == "pend":  # 承認待ち一覧へ遷移
        login_user = request.session['user_data']
        user_data = User.objects.get(user_id=login_user)
        request.session['position_id'] = user_data.position_id
        president = Approval.objects.filter(Q(p_chief=1), Q(p_director=1), Q(p_mdirectop=1), Q(p_president=0),
                                            ~Q(user__user_id=login_user)).reverse()

        mdirector = Approval.objects.filter(Q(p_chief=1), Q(p_director=1), Q(p_mdirectop=0),
                                            ~Q(user__user_id=login_user)).reverse()

        director = Approval.objects.filter(Q(p_chief=1), Q(p_director=0), ~Q(user__user_id=login_user),
                                           Q(user__department_id=user_data.department_id))

        chief = Approval.objects.filter(Q(p_chief=0), ~Q(user__user_id=login_user),
                                        Q(user__department_id=user_data.department_id))

        employee = Approval.objects.all().filter(Q(p_chief=0), Q(user__user_id=login_user),
                                                 Q(user__department_id=user_data.department_id))

        for i in chief:
            print(i.user.user_id, i.user.position_id)

        context = {
            'president': president,
            'mdirector': mdirector,
            'director': director,
            'chief': chief,
            'employee': employee,
            'user_data': user_data.position_id,
        }
        return render(request, 'ringiList/shouninmati_list.html', context)

    elif check_text == "pended":  # 承認済み一覧へ遷移
        login_user = request.session['user_data']
        user_data = User.objects.get(user_id=login_user)
        president = Approval.objects.all().filter(Q(p_president=1) | Q(p_president=2)).reverse()
        mdirector = Approval.objects.all().filter(Q(p_mdirectop=1) | Q(p_mdirectop=2)).reverse()
        director = Approval.objects.all().filter(Q(p_director=1) | Q(p_mdirectop=2),
                                                 Q(user__department_id=user_data.department_id))
        chief = Approval.objects.filter(Q(p_chief=1) | Q(p_chief=2),
                                        Q(user__department_id=user_data.department_id))
        context = {
            'president': president,  # 社長が承認した稟議書の全データ
            'mdirector': mdirector,  # 常務が承認した稟議書の全データ
            'director': director,  # 部長が承認した稟議書の全データ
            'chief': chief,  # 主任が承認した稟議書の全データ
            'user_data': user_data.position_id,  # ログインしたユーザの役職ID
        }
        return render(request, 'ringiList/shouninzumi_list.html', context)

    #  稟議書を承認する処理、引数として、稟議書IDと役職IDを受け取って、役職IDに一致する役職者の承認フラグを変える


def back(request):
    user_data = User.objects.get(user_id=request.session['user_data'])
    data = Approval.objects.all()

    context = {
        'user_data': user_data,
        'data': data,
        'model': get_Approval_query(request.session['user_data'])
    }

    return render(request, 'topPage/topPage.html', context)


"""   稟議書の支払い総額によって、どの役職までの人が承認するのか決める方法がわからない   """
