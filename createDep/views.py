from django.db.models import Q
from django.shortcuts import render, redirect
from common.models import *
from Team2021 import slack_message as s_m_send


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
    context = {'alert': 'no_checked'}
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
                    # TODO: createのDB登録、更新
                    #   要)部署名、社員ID  ( request.POST['dep_name'], session['new_user_list'] )
                    #   Department_name -> request.POST['dep_name'],
                    #   session['new_user_list'].dep_id -> num,
                    #   session['new_user_list'].boss_id -> null,
                    new_dep = Department(department_name=request.POST['dep_name'])
                    new_dep.save()
                    if 'new_user_list' in request.session:
                        data = Department.objects.order_by("department_id").last()
                        up_former = User.objects.filter(user_id__in=request.session['new_user_list']).update(
                            department=data)

                    mail_message = [{'email': User.objects.get(pk='00000001').mail + '@morijyobi.ac.jp',
                                     'message': new_dep.department_name + '部を作成しました。'}]

                    s_m_send.send_message_for_email(mail_message)

                    return render(request, 'createDep/sample.html', context)
                elif 'dep_name' not in request.POST:
                    del request.session['del_name']
                    context['alert'] = 'no_name'
                    return render(request, 'createDep/newDep.html', context)
                elif 'dep_name' in request.POST:
                    #   同上
                    new_dep = Department(department_name=request.POST['dep_name'])
                    new_dep.save()
                    if 'new_user_list' in request.session:
                        data = Department.objects.order_by("department_id").last()
                        up_former = User.objects.filter(user_id__in=request.session['new_user_list']).update(
                            department=data)
                    mail_message = [{'email': User.objects.get(pk='00000001').mail + '@morijyobi.ac.jp',
                                     'message': new_dep.department_name + '部を作成しました。'}]

                    s_m_send.send_message_for_email(mail_message)

                    return render(request, 'createDep/sample.html', context)
    elif request.method == 'GET':
        if 'cb' in request.GET:
            lists = request.GET.getlist('cb')
            if lists[0] == '00000000' and len(lists) == 1:
                if 'new_user_list' in request.session:
                    del request.session['new_user_list']
                context['alert'] = 'no_checked'
            else:
                context.pop('alert', None)
                request.session['new_user_list'] = lists  # 部署登録時に一般社員で登録する社員id一覧
                print(User.objects.filter(user_id__in=request.session['new_user_list']))
            # checkboxを選択せずに決定ボタンを押すと、このifで弾かれる模様
        if 'dep_name' in request.session:
            context['dep_name'] = request.session['dep_name']
            return render(request, 'createDep/newDep.html', context)
        return render(request, 'createDep/newDep.html', context)


def dep_list(request):
    if 'dep_name' in request.session:
        del request.session['dep_name']
    dep_and_user = User.objects.filter(position_id=4, department_id__gt=2)
    dep_info = Department.objects.filter(department_id__gt=2)
    # for array in dep_info:
    #     print(array.dep_foreign_id.filter(position_id=4))
    context = {'department': dep_info}
    # deps = []
    # for array in dep_and_user:
    #     deps.append(array.department_id)
    # if len(deps) != len(set(deps)):
    #     print("部長の重複を確認")
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
        if dr.first() is None:
            context = {
                'num': num,
                'dr': dr,
                'chf': chf,
                'emp': emp
            }
        else:
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
                Q(position_id=6) | Q(position_id=4), Q(department_id=num) | Q(department_id=2))
            user_checked = User.objects.filter(position_id=4, department_id=num).values_list('user_id', flat=True)
            context = {'user_array': user_array, 'flg': 'dr', 'num': num, 'checked': user_checked}
            return render(request, 'createDep/selectUser.html', context)
        elif 'back' in request.POST:
            return redirect('dep:position-list', num)
        elif 'decision' in request.POST:
            # TODO: directorのDB登録、更新
            #   要) 前部長ID, 次部長ID, 所属部署 ( User.user_id(position_id, department_id), User.user_id(session['next_dir_id']) ), num
            #   boss_id : 前部長 -> 次部長 , department_id -> num, position_id -> 4,
            #   前部長をboss_idに持つユーザのboss_id -> session['next_dir_id']
            #   前部長のpos_id -> 6,
            #   次部長のpos_id -> 4,
            #   次部長のdep_id -> num,
            boss_id_ahead = User.objects.filter(position_id=4, department_id=num).values('user_id')
            # print(boss_id_ahead[0]['user_id'])  # 前部長id
            # print(request.session['next_dir_id'])  # 次部長id
            # print(num)
            dep = Department.objects.get(pk=num)
            pos_4 = Position.objects.get(pk=4)
            pos_6 = Position.objects.get(pk=6)
            boss_ahead = User.objects.get(pk=request.session['next_dir_id'])
            if boss_id_ahead.first() is None:
                chief_list = User.objects.filter(position_id=5, department_id=num)
                if chief_list.first() is not None:
                    User.objects.filter(boss_id=boss_id_ahead[0]['user_id']).update(boss=boss_ahead)
                boss_ahead.position = pos_4
                boss_ahead.department = dep
                boss_ahead.save()
            else:
                boss_former = User.objects.get(pk=boss_id_ahead[0]['user_id'])
                # pos4, 6
                # print(User.objects.filter(boss_id=boss_id_ahead[0]['user_id']))

                User.objects.filter(boss_id=boss_id_ahead[0]['user_id']).update(boss=boss_ahead)

                boss_former.position = pos_6
                boss_former.save()
                boss_ahead.position = pos_4
                boss_ahead.department = dep
                boss_ahead.save()
            mail_message = [{'email': User.objects.get(pk='00000001').mail + '@morijyobi.ac.jp',
                             'message': dep.department_name + '所属の部長を編集しました'}]

            s_m_send.send_message_for_email(mail_message)

            return redirect('dep:position-list', num)
    elif request.method == 'GET':
        if 'cb' in request.GET:
            # 社員選択画面からの遷移
            lists = request.GET.getlist('cb')
            user_data = User.objects.filter(user_id__in=lists)
            if lists[0] == '00000000' and len(lists) == 1:
                context = {'dr': user_data, 'dep_id': num, 'alert': 'no_checked'}
            elif len(lists) >= 3:
                context = {'dr': user_data, 'dep_id': num, 'alert': 'duplicate_director'}
            else:
                request.session['next_dir_id'] = user_data[0].user_id
                context = {'dr': user_data[0], 'dep_id': num}
            return render(request, 'createDep/change1.html', context)
        dr = User.objects.filter(position_id=4, department_id=num)
        if dr.first() is None:
            context = {'dr': dr, 'dep_id': num}
        else:
            context = {'dr': dr[0], 'dep_id': num}
        return render(request, 'createDep/change1.html', context)


def chief(request, num):
    context = {}
    if request.method == 'POST':
        if 'edit' in request.POST:
            user_array = User.objects.select_related().filter(
                Q(position_id=5) | Q(position_id=6), Q(department_id=num) | Q(department_id=2))
            user_checked = User.objects.filter(position_id=5, department_id=num).values_list('user_id', flat=True)
            """user_checked:現在登録されている主任の社員IDリスト"""
            user_checked = list(user_checked)
            context = {'user_array': user_array, 'flg': 'chf', 'num': num, 'checked': user_checked}
            return render(request, 'createDep/selectUser.html', context)
        elif 'back' in request.POST:
            return redirect('dep:position-list', num)
        elif 'decision' in request.POST:
            # TODO: chiefのDB登録、更新
            #   要) 部長ID, 変更する主任リスト, 変更しない主任リスト, 所属部署 ( User.boss_id -> User.user_id(dep_id=num, pos_id=4),
            #   request.post.getlist['u-cb'], num )
            #   現在主任で、変更リストにないユーザをboss_idに持つユーザ -> null,
            #   現在主任で、変更リストにないユーザのpos_id -> 6,
            #   変更リストのユーザのpos_id -> 5,
            #   変更リストのユーザのdep_id -> num
            if 'u-cb' in request.POST:
                prev_list = request.POST.getlist('u-cb')  # 3, 4
                pos_6 = Position.objects.get(pk=6)
                pos_5 = Position.objects.get(pk=5)
                dep = Department.objects.get(pk=num)
                former_chief_list = User.objects.filter(position_id=5, department_id=num).values_list('user_id')

                former_list = []
                for array in former_chief_list:
                    former_list.append(str(array[0]))  # 現在の主任 - 取得した主任
                result = list(filter(lambda x: x not in prev_list, former_list))  # 1, 2 ['99999999']

                User.objects.filter(boss_id__in=result).update(boss=None)
                User.objects.filter(user_id__in=result).update(position=pos_6)

                User.objects.filter(user_id__in=prev_list).update(position=pos_5)
                User.objects.filter(user_id__in=prev_list).update(department=dep)
                mail_message = [{'email': User.objects.get(pk='00000001').mail + '@morijyobi.ac.jp',
                                 'message': dep.department_name + '部の主任を編集しました。'}]

                s_m_send.send_message_for_email(mail_message)
            return redirect('dep:position-list', num)
    elif request.method == 'GET':
        if 'cb' in request.GET:
            # 社員選択画面からの遷移
            lists = request.GET.getlist('cb')
            user_data = User.objects.filter(user_id__in=lists)
            # print(user_data)
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
            user_data = User.objects.filter(Q(department_id=dep_id[0]['department_id']) | Q(department_id=2),
                                            Q(position_id=6))
            user_checked = User.objects.filter(boss_id=num).values_list('user_id', flat=True)
            user_checked = list(user_checked)
            context = {'user_array': user_data, 'flg': 'emp', 'num': num, 'checked': user_checked}
            return render(request, 'createDep/selectUser.html', context)
        elif 'decision' in request.POST:
            # TODO: employeeのDB登録、更新
            #   要) 主任ID, 変更する社員リスト、選択しない社員リスト、所属部署  ( User.boss_id -> num, request.post.getlist('u-cb'),
            #               User.user_id(dep_id, boss_id=User.boss_id, pos_id=num), dep_id )
            #   選択した主任をboss_idに持ち、変更リストにないユーザをnullに更新、
            #   変更リストのユーザのboss_id -> num,
            #   変更リストのユーザのdep_id -> dep_id,
            dep_id = User.objects.filter(user_id=num).values('department_id')
            dep_id = dep_id[0]['department_id']
            if 'u-cb' in request.POST:
                prev_list = request.POST.getlist('u-cb')  # 2, 3 更新するユーザのリスト
                former_emp_list = User.objects.filter(position_id=6, department_id=dep_id, boss_id=num).values_list(
                    'user_id')
                former_list = []
                for array in former_emp_list:
                    former_list.append(str(array[0]))  # 現在の一般社員 - 取得した一般社員
                result = list(filter(lambda x: x not in prev_list, former_list))  # 1 ['99999999']
                print(result, prev_list)

                boss = User.objects.get(pk=num)
                dep = Department.objects.get(pk=dep_id)

                User.objects.filter(user_id__in=result).update(boss=None)
                User.objects.filter(user_id__in=prev_list).update(boss=boss)
                User.objects.filter(user_id__in=prev_list).update(department=dep)

                mail_message = [{'email': User.objects.get(pk='00000001').mail + '@morijyobi.ac.jp',
                                 'message': dep.department_name + '部所属の' + boss.last_name + ' ' + boss.first_name + ' 主任を上司にもつ一般社員を編集しました。'}]

                s_m_send.send_message_for_email(mail_message)

            return redirect('dep:employee-1', dep_id)
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
            # TODO: user_listで所属する一般社員をコントロールする
            #   要) 選択した社員リスト、選択しない社員リスト、所属部署
            #   選択した社員リストと、現在所属している社員のリストの差分を元に、選択している社員のdep_id -> num
            #   選択した社員リストと、現在所属している社員のリストの差分を元に、選択していない社員のdep_id -> 1, boss_id -> null
            # num -> dep_id
            prev_list = request.GET.getlist('cb')  # 2, 3 更新するユーザのリスト
            prev_list.remove('00000000')
            former_emp_list = User.objects.filter(position_id=6, department_id=num).values_list('user_id')
            former_list = []
            for array in former_emp_list:
                former_list.append(str(array[0]))  # 現在の一般社員 - 取得した一般社員
            result = list(filter(lambda x: x not in prev_list, former_list))  # 1 ['99999999']

            dep_id = Department.objects.get(pk=num)
            dep_none = Department.objects.get(pk=2)

            User.objects.filter(user_id__in=prev_list).update(department=dep_id)
            User.objects.filter(user_id__in=result).update(department=dep_none)
            User.objects.filter(user_id__in=result).update(boss=None)
            print(User.objects.get(pk='00000001').mail + '@morijyobi.ac.jp')
            mail_message = [{'email': User.objects.get(pk='00000001').mail + '@morijyobi.ac.jp',
                             'message': str(dep_id.department_name) + 'から、一般社員を未所属に移動しました'}]

            s_m_send.send_message_for_email(mail_message)

            return redirect('dep:position-list', num)
        user_list_all = User.objects.filter(department_id=num, position_id=6)
        user_checked = User.objects.filter(department_id=num, position_id=6).values_list('user_id', flat=True)
        context = {'user_array': user_list_all, 'flg': 'delete', 'num': num, 'checked': user_checked}
        return render(request, 'createDep/selectUser.html', context)
