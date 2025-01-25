

from django.urls import path
from .import views

app_name = 'mwala_app'

urlpatterns = [
    path('',views.homePage, name="index"),
    path('principal-detail/', views.principalDetail, name='principal_detail'), 
    path('courses/<slug:level>/', views.courseLevelView, name='course_level'),
    path('notices/', views.all_notices, name='all_notices'),
    path('JobsVacancies/', views.all_jobsVacancies, name='JobsVacancies'),
    path('tenders/', views.all_tenders, name='tenders'),
    path('gallery', views.collageGallery, name='gallery'),
    path('get_images_for_carousel/', views.get_images_for_carousel, name='get_images_for_carousel'),
    path('newsEvents/', views.newsEvents, name='newsEvents'),
    path('news_details/<int:news_id>/', views.news_details, name='news_details'),
    path('history/',views.historyPage, name="history"),
    path('adminstration/',views.adminstrationPage, name="adminstration"),
    path('administration/<int:id>/', views.adminstrationDetails, name='adminstrationDetails'),
    path('departments/<int:department_id>/', views.department_details, name='department_details'),
    path('support_department/<int:support_department_id>/', views.supporting_department_details, name='support_department'),
    path('allCourses/',views.allCourses, name="allCourses"),
    path('departments/',views.allDepartments, name="departments"),
    path('departments/<int:department_id>/', views.department_details, name='department_details'),
    path('contactUs/',views.contact_view, name="contactUs"),
    path('contacts/', views.contact_list_view, name='contact_list'),
    path('feeStructure/',views.feeStructure, name="feeStructure"),
    path('clearanceForm/',views.clearanceForm, name="clearanceForm"),
    path('courseTransferForm/',views.courseTransferForm, name="courseTransferForm"),
    path('feeRefundForm/',views.feeRefundForm, name="feeRefundForm"),
    path('serviceCharter/',views.serviceCharter, name="serviceCharter"),
    path('mwalaServices', views.service, name="mwalaServices"),
    path('examinations', views.examinations, name="examinations"),
    path('feedBack/',views.feedback_view, name="feedBack"),
    path('feedback-list/', views.feedback_list_view, name='feedback_list'),
    path('studentAffairs/<int:student_affairs_id>/', views.studentAffairs, name='studentAffairs'),
    path('govnt_scholar/',views.govnt_scholar, name="govnt_scholar"),
    path('applicationForm/',views.applicationForm, name="applicationForm"),
    path('onlineApplication/',views.admission_application_view, name="onlineApplication"),
    path('applicationPdf/',views.applicationPdf, name="applicationPdf"),
    path('admissions/', views.admission_applications, name='admission_applications'),
    path('get_course_levels/<int:course_id>/', views.get_course_levels, name='get_course_levels'),
    path('details/<int:id>/', views.adminstrationDetails, name='details'),
    path('search/', views.search_view, name='search'),
    path('get-counties/', views.get_counties, name='get_counties'),
    path('get-courses/<int:department_id>/', views.get_courses, name='get_courses'),
]