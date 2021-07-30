from django.shortcuts import render
from common.models import *

# Create your views here.


# userテーブルのデータを一覧で表示する
def index(request):
    user_data = User.objects.select_related().filter(user_id__gt='90_000_100')  # カラム名__gtで < , ltで >
    context = {'user': user_data}
    return render(request, 'common/user_list.html', context)
