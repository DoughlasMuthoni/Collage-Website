

from django.urls import path
from .import views

app_name = 'mwala_app'

urlpatterns = [
    path('',views.homePage, name="index"),
    path('noticeBoard',views.notice, name="noticeBoard"),
    path('notices/', views.all_notices, name='all_notices'),
    path('history/',views.historyPage, name="history"),
    path('adminstration/',views.adminstrationPage, name="adminstration"),
    path('allCourses/',views.allCourses, name="allCourses"),
    path('accounting/<str:level>/',views.accountingCourses, name="accounting"),
    path('diploma/<str:level>/',views.diplomaCourses, name="diploma"),
    path('certificate/<str:level>/',views.certificateCourses, name="certificate"),
    path('artisan/<str:level>/',views.artisanCourses, name="artisan"),
    path('shortCourses/<str:level>/',views.shortCourses, name="shortCourses"),
    path('nitaCoures/<str:level>/',views.nitaCourses, name="nitaCourses"),
    path('departments/',views.allDepartments, name="departments"),
    path('contactUs/',views.contactPage, name="contactUs"),
    path('feeStructure/',views.feeStructure, name="feeStructure"),
    path('feedBack/',views.feedBack, name="feedBack"),
    path('applicationForm/',views.applicationForm, name="applicationForm"),
    path('onlineApplication/',views.onlineApplication, name="onlineApplication"),
    path('applicationPdf/',views.applicationPdf, name="applicationPdf"),
    path('details/<int:id>/', views.adminstrationDetails, name='details'),
]