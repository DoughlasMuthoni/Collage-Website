

from django.urls import path
from .import views

app_name = 'admin_app'

urlpatterns = [
    path('',views.index, name="admin_index"),
    path('admin/',views.dashboard, name="admin"),
    path('user_profile/',views.user_profile, name="user_profile"),
    path('register/',views.register, name="register"),
    path('login/',views.login, name="login"),
]