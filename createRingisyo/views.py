from django.shortcuts import render


# Create your views here.


def create(request):
    return render(request, 'createRingisyo/create.html')


def check(request):
    return render(request, 'createRingisyo/check.html')
