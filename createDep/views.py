from django.shortcuts import render
from common.models import *


# Create your views here.


def create(request):
    if request.method == 'GET':
        return render(request, 'createDep/newDep.html')
    elif request.method == 'POST':
        return render(request, 'createDep/newDep.html')


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
