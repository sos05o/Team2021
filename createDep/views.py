from django.db.models import Q
from django.shortcuts import render, redirect
from common.models import *


# Create your views here.
# 表示される一覧は登録済みのデータのみ
# 社員選択画面の一覧に、
# 部長 : 部長と一般社員
# 主任 : 主任と一般社員
# 一般社員 : 一般社員のみ
# を表示する
# 社員選択画面から戻る時、データを登録する
# 解除ボタンを押したとき、処理を実行する


def create(request):
    context = {}
    if request.method == 'POST':
        if 'select' in request.POST:  # 「所属社員」ボタンを押したとき
            if 'dep_name' in request.POST:
                request.session['dep_name'] = request.POST['dep_name']
            user_array = User.objects.select_related().filter(position_id=6)
            context['user_array'] = user_array
            return render(request, 'createDep/selectUser.html', context)
        elif 'back' in request.POST:  # 「戻る」ボタンを押したとき
            if 'dep_name' in request.session:
                del request.session['dep_name']
            return render(request, 'createDep/sample.html', context)
        elif 'create' in request.POST:  # 「作成」ボタンを押したとき
            if 'dep_name' not in request.POST or request.POST['dep_name'] == '':
                context['alert'] = 'no_name'
                return render(request, 'createDep/newDep.html', context)
            else:
                if 'dep_name' in request.session and 'dep_name' in request.POST:
                    del request.session['dep_name']
                    #         use request.POST['dep_name']
                    #         db登録処理を実行
                    return render(request, 'createDep/sample.html', context)
                elif 'dep_name' not in request.POST:
                    del request.session['del_name']
                    context['dep_name'] = 'no_name'
                    return render(request, 'createDep/newDep.html', context)
                elif 'dep_name' in request.POST:
                    #         db登録処理を実行
                    return render(request, 'createDep/sample.html', context)
    elif request.method == 'GET':
        if 'cb' in request.GET:
            lists = request.GET.getlist('cb')
            print(lists[0], len(lists))
            if lists[0] == '00000000' and len(lists) == 1:
                if 'new_user_list' in request.session:
                    del request.session['new_user_list']
                print('checked')
                context['alert'] = 'no_checked'
            else:
                request.session['new_user_list'] = lists
            # checkboxを選択せずに決定ボタンを押すと、このifで弾かれる模様
        if 'dep_name' in request.session:
            context['dep_name'] = request.session['dep_name']
            return render(request, 'createDep/newDep.html', context)
        return render(request, 'createDep/newDep.html', context)


def dep_list(request):
    if 'dep_name' in request.session:
        del request.session['dep_name']
    dep_and_user = User.objects.filter(position_id=4, department_id__gt=2)
    context = {'department': dep_and_user}
    deps = []
    for array in dep_and_user:
        deps.append(array.department_id)
    if len(deps) != len(set(deps)):
        print("部長の重複を確認")
        context['alert'] = 'duplicate'
    return render(request, 'createDep/depList.html', context)


def position_list(request, num):
    if request.method == 'POST':
        if 'director' in request.POST:
            return redirect('dep:director', request.session['dep_id'])
        if 'chief' in request.POST:
            return redirect('dep:chief', request.session['dep_id'])
        if 'employee' in request.POST:
            return redirect('dep:employee-1', request.session['dep_id'])
        if 'back' in request.POST:
            return redirect('dep:dep-list')
    elif request.method == 'GET':
        dr = User.objects.filter(position_id=4, department_id=num).values('last_name', 'first_name')
        chf = User.objects.filter(position_id=5, department_id=num).count()
        emp = User.objects.filter(position_id=6, department_id=num).count()
        context = {
            'num': num,
            'dr': dr[0],
            'chf': chf,
            'emp': emp
        }
        request.session['dep_id'] = num
        return render(request, 'createDep/positionList.html', context)


def director(request, num):
    context = {}
    if request.method == 'POST':
        if 'edit' in request.POST:
            user_array = User.objects.select_related().filter(
                Q(position_id=6) | Q(position_id=4), Q(department_id=num) | Q(department_id=1))
            user_checked = User.objects.filter(position_id=4, department_id=num).values_list('user_id', flat=True)
            context = {'user_array': user_array, 'flg': 'dr', 'num': num, 'checked': user_checked}
            return render(request, 'createDep/selectUser.html', context)
        elif 'back' in request.POST:
            return redirect('dep:position-list', num)
        elif 'decision' in request.POST:
            return redirect('dep:position-list', num)
    elif request.method == 'GET':
        if 'cb' in request.GET:
            # 社員選択画面からの遷移
            lists = request.GET.getlist('cb')
            user_data = User.objects.filter(user_id__in=lists)
            print(lists, user_data)
            if lists[0] == '00000000' and len(lists) == 1:
                print("a")
                context = {'dr': user_data, 'dep_id': num, 'alert': 'no_checked'}
            elif len(lists) >= 3:
                print("b")
                context = {'dr': user_data, 'dep_id': num, 'alert': 'duplicate_director'}
            else:
                print("c")
                context = {'dr': user_data[0], 'dep_id': num}
            return render(request, 'createDep/change1.html', context)
        dr = User.objects.filter(position_id=4, department_id=num)
        context = {'dr': dr[0], 'dep_id': num}
        return render(request, 'createDep/change1.html', context)


def chief(request, num):
    context = {}
    if request.method == 'POST':
        if 'edit' in request.POST:
            user_array = User.objects.select_related().filter(
                Q(position_id=5) | Q(position_id=6), Q(department_id=num) | Q(department_id=1))
            user_checked = User.objects.filter(position_id=5, department_id=num).values_list('user_id', flat=True)
            """user_checked:現在登録されている主任の社員IDリスト"""
            user_checked = list(user_checked)
            print(type(user_checked), user_checked)
            context = {'user_array': user_array, 'flg': 'chf', 'num': num, 'checked': user_checked}
            return render(request, 'createDep/selectUser.html', context)
        elif 'back' in request.POST:
            return redirect('dep:position-list', num)
        elif 'decision' in request.POST:
            return redirect('dep:position-list', num)
    elif request.method == 'GET':
        if 'cb' in request.GET:
            # 社員選択画面からの遷移
            lists = request.GET.getlist('cb')
            user_data = User.objects.filter(user_id__in=lists)
            if lists[0] == '00000000' and len(lists) == 1:
                context = {'chf': user_data, 'dep_id': num, 'alert': 'no_checked'}
            else:
                context = {'chf': user_data, 'dep_id': num}
            return render(request, 'createDep/change2.html', context)
        user_data = User.objects.filter(position_id=5, department_id=num)
        context = {'chf': user_data, 'dep_id': num}
        return render(request, 'createDep/change2.html', context)


def employee_1(request, num):
    if request.method == 'POST':
        if 'back' in request.POST:
            return redirect('dep:position-list', num)
        elif 'decision' in request.POST:
            return redirect('dep:position-list', num)
    elif request.method == 'GET':
        user_data = User.objects.filter(position_id=5, department_id=num)
        context = {'emp': user_data, 'dep_id': num}
        return render(request, 'createDep/change3.html', context)


def employee_2(request, num):
    # ここのnumは選択している主任の社員ID
    if request.method == 'POST':
        if 'edit' in request.POST:
            dep_id = User.objects.filter(user_id=num).values('department_id')
            user_data = User.objects.filter(Q(department_id=dep_id[0]['department_id']) | Q(department_id=1),
                                            Q(position_id=6))
            user_checked = User.objects.filter(boss_id=num).values_list('user_id', flat=True)
            user_checked = list(user_checked)
            context = {'user_array': user_data, 'flg': 'emp', 'num': num, 'checked': user_checked}
            return render(request, 'createDep/selectUser.html', context)
        elif 'decision' in request.POST:
            num = User.objects.filter(user_id=num).values('department_id')
            num = num[0]['department_id']
            return redirect('dep:employee-1', num)
    elif request.method == 'GET':
        context = {}
        if 'cb' in request.GET:
            lists = request.GET.getlist('cb')
            print(lists)
            user_data = User.objects.filter(user_id__in=lists)
            if lists[0] == '00000000' and len(lists) == 1:
                context = {'user_data': user_data, 'boss_id': num, 'alert': 'no_checked'}
            else:
                context = {'user_data': user_data, 'boss_id': num}
            print(context)
            return render(request, 'createDep/change4.html', context)
        user_data = User.objects.filter(boss_id=num, position_id=6)
        context = {'user_data': user_data, 'boss_id': num}
        return render(request, 'createDep/change4.html', context)


def top(request):
    if 'dep_name' in request.session:
        del request.session['dep_name']
    return render(request, 'createDep/sample.html')


def user_list(request, num):
    # num = dep_id
    if request.method == 'POST':
        return render(request, 'createDep/selectUser.html')
    elif request.method == 'GET':
        if 'cb' in request.GET:
            print(request.GET['cb'])
            return redirect('dep:position-list', num)
        user_list_all = User.objects.filter(department_id=num, position_id=6)
        user_checked = User.objects.filter(department_id=num, position_id=6).values_list('user_id', flat=True)
        context = {'user_array': user_list_all, 'flg': 'delete', 'num': num, 'checked': user_checked}
        return render(request, 'createDep/selectUser.html', context)
