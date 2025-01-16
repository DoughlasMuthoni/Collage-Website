from django.shortcuts import render

# Create your views here.

def dashboard(request):
    return render(request, 'admin_dashboard/index.html')

def index(request):
    context = {

    }
    return render(request, 'admin_dashboard/index.html', context)

def user_profile(request):
    context = {

    }
    return render(request, 'admin_dashboard/user_profile.html', context)

def register(request):
    context = {

    }
    return render(request, 'admin_dashboard/register.html', context)


def login(request):
    context = {

    }
    return render(request, 'admin_dashboard/login.html', context)