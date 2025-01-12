

from django.urls import path
from .import views

app_name = 'mwala_app'

urlpatterns = [
    path('',views.homePage, name="index"),
    path('principal-detail/', views.principalDetail, name='principal_detail'), 
    
    path('notices/', views.all_notices, name='all_notices'),
    path('JobsVacancies/', views.all_jobsVacancies, name='JobsVacancies'),
    path('gallery', views.collageGallery, name='gallery'),
    path('get_images_for_carousel/', views.get_images_for_carousel, name='get_images_for_carousel'),
    path('newsEvents/', views.newsEvents, name='newsEvents'),
    path('news_details/<int:news_id>/', views.news_details, name='news_details'),
    path('history/',views.historyPage, name="history"),
    path('adminstration/',views.adminstrationPage, name="adminstration"),
    path('departments/<int:department_id>/', views.department_details, name='department_details'),
    path('support_department/<int:support_department_id>/', views.supporting_department_details, name='support_department'),
    path('allCourses/',views.allCourses, name="allCourses"),
    path('courses/<slug:level>/', views.courseLevelView, name='course_level'),
    path('accounting/<str:level>/',views.accountingCourses, name="accounting"),
    path('diploma/<str:level>/',views.diplomaCourses, name="diploma"),
    path('certificate/<str:level>/',views.certificateCourses, name="certificate"),
    path('artisan/<str:level>/',views.artisanCourses, name="artisan"),
    path('shortCourses/<str:level>/',views.shortCourses, name="shortCourses"),
    path('nitaCoures/<str:level>/',views.nitaCourses, name="nitaCourses"),
    path('departments/',views.allDepartments, name="departments"),
    path('contactUs/',views.contact_view, name="contactUs"),
    path('feeStructure/',views.feeStructure, name="feeStructure"),
    path('feedBack/',views.feedback_view, name="feedBack"),
    path('studentAffairs/<int:student_affairs_id>/', views.studentAffairs, name='studentAffairs'),
    path('govnt_scholar/',views.govnt_scholar, name="govnt_scholar"),
    path('applicationForm/',views.applicationForm, name="applicationForm"),
    path('onlineApplication/',views.admission_application_view, name="onlineApplication"),
    path('applicationPdf/',views.applicationPdf, name="applicationPdf"),
    path('details/<int:id>/', views.adminstrationDetails, name='details'),
    path('search/', views.search_view, name='search'),
]