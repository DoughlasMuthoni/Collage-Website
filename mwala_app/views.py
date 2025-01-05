from django.shortcuts import render
from django.shortcuts import render, get_object_or_404
from mwala_app.models import Administration, Course

# Create your views here.
def homePage(request):
    return render(request, 'index1.html')
def historyPage(request):
    return render(request, 'about1.html')

def adminstrationPage(request):
    administrators = Administration.objects.all()
    admin_count = administrators.count()
    return render(request, 'adminstration.html',  {'administrators': administrators,'admin_count':admin_count})

def adminstrationDetails(request, id):
    admin = get_object_or_404(Administration, id=id)
   
    return render(request, 'adminstration_details.html', {'admin':admin})


def allCourses(request):
    courses = Course.objects.all()
    context = {
       'courses' :courses
    }
    return render(request, 'courses/all_courses.html', context)

def diplomaCourses(request, level):
    courses = Course.objects.filter(course_level__iexact=level)

    context = {
        'level': level,
        'courses': courses,
    }
    return render(request, 'courses/diploma_courses.html', context)


def accountingCourses(request, level):
    courses = Course.objects.filter(course_level__iexact=level)

    context = {
        'level': level,
        'courses': courses,
    }
    return render(request, 'courses/accounting_courses.html', context)


def certificateCourses(request, level):
    courses = Course.objects.filter(course_level__iexact=level)

    context = {
        'level': level,
        'courses': courses,
    }
    return render(request, 'courses/certificate_courses.html', context)


def artisanCourses(request, level):
    courses = Course.objects.filter(course_level__iexact=level)

    context = {
        'level': level,
        'courses': courses,
    }
    return render(request, 'courses/artisan_courses.html', context)


def shortCourses(request, level):
    courses = Course.objects.filter(course_level__iexact=level)

    context = {
        'level': level,
        'courses': courses,
    }
    return render(request, 'courses/short_courses.html', context)


def nitaCourses(request, level):
    courses = Course.objects.filter(course_level__iexact=level)

    context = {
        'level': level,
        'courses': courses,
    }
    return render(request, 'courses/nita_courses.html', context)

def allDepartments(request):
    return render(request, 'departments/all_department.html')

def applicationForm(request):
    return render(request, 'application_form.html')

def applicationPdf(request):
    return render(request, 'application_pdf.html')
def onlineApplication(request):
    return render(request, 'online_application.html')

def contactPage(request):
    return render(request, 'contact1.html')

def feeStructure(request):
    return render(request, 'fee_structure.html')

def feedBack(request):
    return render(request, 'feedback.html')



