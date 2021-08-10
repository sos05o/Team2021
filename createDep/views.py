from django.shortcuts import render
from common.models import *


# Create your views here.


def create(request):
    context = {}
    if request.method == 'POST':
        if 'select' in request.POST:
            if 'dep_name' in request.POST:
                request.session['dep_name'] = request.POST['dep_name']
            user_array = User.objects.select_related().filter(position_id=6)
            context['user_array'] = user_array
            return render(request, 'createDep/selectUser.html', context)
        elif 'back' in request.POST:
            return render(request, 'createDep/sample.html', context)
        elif 'create' in request.POST:
            return render(request, 'createDep/sample.html', context)

    elif request.method == 'GET':
        if 'cb' in request.GET:
            print(request.GET["cb"])
            # checkboxを選択せずに決定ボタンを押すと、このifで弾かれる模様
        if 'dep_name' in request.session:
            context['dep_name'] = request.session['dep_name']
            return render(request, 'createDep/newDep.html', context)
        return render(request, 'createDep/newDep.html', context)


def dep_list(request):
    dep_data = Department.objects.filter(department_id__gt='2')
    context = {'department': dep_data}
    return render(request, 'createDep/depList.html', context)


def position_list(request):
    return render(request, 'createDep/positionList.html')


def director(request):
    return render(request, 'createDep/change1.html')


def chief(request):
    return render(request, 'createDep/change2.html')


def employee_1(request):
    return render(request, 'createDep/change3.html')


def employee_2(request):
    return render(request, 'createDep/change4.html')


def user_list(request):
    return render(request, 'createDep/selectUser.html')


def top(request):
    return render(request, 'createDep/sample.html')
