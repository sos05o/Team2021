import requests
from django.shortcuts import render, redirect
from common.models import *
from Team2021 import slack_message as s_m_send
from datetime import datetime, timedelta


# Create your views here.


def create(request):
    # ここの機能でのみ、user_formerセッションを使用する
    user_former = User.objects.get(pk=90000200)
    request.session['user_former'] = user_former

    # 結合時に上をコメントアウト
    # user_former = User.objects.get(pk=request.session['user_data'])
    # request.session['user_former'] = user_former
    context = {'user_former': user_former}

    if 'context' in request.session:
        print('check context')
        print(context)
        context = request.session['context']
        del request.session['context']

    boss_data = User.objects.get(pk=user_former.boss_id)
    if request.method == 'POST':
        redirect('login:login')
    elif request.method == 'GET':
        if 'back' in request.GET:
            print(context)
            return render(request, 'createRingisyo/create.html', context)
        if 'user_former' in request.session:
            if 'edit' in request.GET:
                limit = request.GET['limit']
                title = request.GET['title']
                product_name = request.GET['product_name']
                trader_name = request.GET['trader_name']
                quantity = request.GET['quantity']
                unit_price = request.GET['unit_price']
                reason = request.GET['reason']
                trader_reason = request.GET['trader_reason']
                remarks = request.GET['remarks']
                context = {
                    'user_former': user_former,
                    'boss_former': boss_data,
                    'limit': limit,
                    'title': title,
                    'p_name': product_name,
                    't_name': trader_name,
                    'quantity': quantity,
                    'unit_price': unit_price,
                    'reason': reason,
                    't_reason': trader_reason,
                    'remarks': remarks
                }
                first_date = datetime.now()
                limit = limit.split('-')
                second_date = datetime(int(limit[0]), int(limit[1]), int(limit[2]))
                if first_date > second_date:
                    context['alert'] = "承認期限に、過去または今日の日付が入力されています"
                    return render(request, 'createRingisyo/create.html', context)
                elif len(title) < 1 or len(title) >= 33:
                    context['alert'] = "件名(表題)が1文字未満 もしくは 33文字以上となっています。"
                    return render(request, 'createRingisyo/create.html', context)
                elif len(product_name) < 1 or len(product_name) >= 33:
                    context['alert'] = "物品名が1文字未満 もしくは 33文字以上となっています。"
                    return render(request, 'createRingisyo/create.html', context)
                elif len(trader_name) < 1 or len(trader_name) >= 33:
                    context['alert'] = "業者名が1文字未満 もしくは 33文字以上となっています。"
                    return render(request, 'createRingisyo/create.html', context)
                elif is_not_int(quantity) and quantity != "一式":
                    context['alert'] = "数量に数値以外が入力されています。数量に使用できるのは、数値 または 一式 のみです。"
                    return render(request, 'createRingisyo/create.html', context)
                elif is_not_int(unit_price):
                    context['alert'] = "単価に数値以外が入力されています。単価に使用できるのは数値のみです。"
                    return render(request, 'createRingisyo/create.html', context)
                elif len(reason) < 1 or len(reason) >= 513:
                    context['alert'] = "必要理由が1文字未満 もしくは 512以上となっています。"
                    return render(request, 'createRingisyo/create.html', context)
                elif len(trader_reason) < 1 or len(trader_reason) >= 513:
                    context['alert'] = "業者選定理由が1文字未満 もしくは 512文字以上となっています。"
                    return render(request, 'createRingisyo/create.html', context)
                elif len(remarks) < 0 or len(remarks) >= 513:
                    context['alert'] = "備考が512文字以上となっています。"
                    return render(request, 'createRingisyo/create.html', context)

                if '一式' == quantity:
                    quantity = 1
                pay_all = int(quantity) * int(unit_price) * 1.1
                context['pay_all'] = pay_all

                request.session['title'] = title
                request.session['limit'] = limit
                request.session['goods'] = product_name
                request.session['trader'] = trader_name
                request.session['quantity'] = quantity
                request.session['price'] = unit_price
                request.session['necessity_reason'] = reason
                request.session['trader_reason'] = trader_reason
                request.session['remarks'] = remarks

                request.session['context'] = context

                return render(request, 'createRingisyo/check.html', context)
            else:
                context = {'user_former': user_former}
                return render(request, 'createRingisyo/create.html', context)
    else:
        return redirect('login:login')


def check(request):
    if request.method == 'GET':
        if 'send' in request.GET:
            if 'user_former' in request.session:
                limit = request.session['limit']
                limit = datetime(int(limit[0]), int(limit[1]), int(limit[2]))
                approval = Approval(
                    title=request.session['title'],
                    user=request.session['user_former'],
                    limited=limit,
                    goods=request.session['goods'],
                    trader=request.session['trader'],
                    quantity=request.session['quantity'],
                    price=request.session['price'],
                    necessity_reason=request.session['necessity_reason'],
                    trader_reason=request.session['trader_reason'],
                    p_chief=0,
                    p_director=0,
                    p_mdirectop=0,
                    p_president=0
                )

                approval.save()

                Remarks.objects.create(
                    approval=approval,
                    user=request.session['user_former'],
                    remarks=request.session['remarks']
                )
                print('create all')
                # トップに戻る
                return render(request, 'createRingisyo/create.html')


def is_not_int(s):
    try:
        int(s, 10)
    except ValueError:
        return True
    else:
        return False
