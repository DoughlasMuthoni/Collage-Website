from django.shortcuts import redirect, render
from django.shortcuts import render, get_object_or_404
from mwala_app.forms import AdmissionApplicationForm, ContactForm, FeedbackForm
from django.contrib import messages
from django.urls import reverse
from django.http import JsonResponse
from django.db.models import Q
from datetime import datetime
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from mwala_app.models import Administration, AdmissionApplication, Brochures, Contact, Course, Department, Feedback, ImageGallery, JobsVacancies, News, Notice, StudentAffairs, SupportingDepartment, Tenders

# Create your views here.
def homePage(request):
    
    notices = Notice.objects.order_by('-date')[:3]
    job_vacancies  = JobsVacancies.objects.order_by('-deadlineDate')[:4]
    departments = Department.objects.order_by('-title')[:5]
    principal_message = Administration.objects.filter(position__iexact="Chief Principal").first()
    # Group courses by their levels
    course_levels = Course.objects.values_list('course_level', flat=True).distinct().order_by('-course_level')[:3]
    courses_by_level = {
    level: Course.objects.filter(course_level__iexact=level).order_by('course_name')[:10]
    for level in course_levels
}

    context = {
        'notices': notices,
        'courses_by_level': courses_by_level,
        'departments': departments,
        'principal_message': principal_message,
        'job_vacancies': job_vacancies,
        
       
    }
    return render(request, 'index1.html', context )

def courseLevelView(request, level):
    # Define a mapping of slugs to database course levels
    level_mapping = {
        'diplomalevel-6': 'Diploma(level 6)',
        'certificatelevel-5': 'Certificate(level 5)',
        'artisanlevel-4': 'Artisan(level 4)',
        'short-courseslevel-3': 'Short courses(level 3)',
        'accounting': 'Accounting',
        'nita': 'NITA',
    }

    level_name = level_mapping.get(level.lower())

    if not level_name:
        context = {
            'error_message': f"Invalid course level '{level}'."
        }
        return render(request, 'index1.html', context, status=404)

    courses = Course.objects.filter(course_level__iexact=level_name)

    if not courses.exists():
        context = {
            'error_message': f"No courses found for level '{level_name}'."
        }
        return render(request, 'index1.html', context, status=404)

    # Add pagination logic
    paginator = Paginator(courses, 10)  # Show 10 courses per page
    page_number = request.GET.get('page')
    page_courses = paginator.get_page(page_number)

    # Pass the paginated courses and level to the template
    context = {
        'level': level_name,
        'courses': page_courses,
    }
    return render(request, 'courses/course_level.html', context)

def all_notices(request):
    all_notices = Notice.objects.order_by('-date')  # Fetch all notices
    return render(request, 'all_notices.html', {'notices': all_notices})

def all_jobsVacancies(request):
    all_jobsVacancies = JobsVacancies.objects.order_by('-deadlineDate')
    return render(request, 'all_jobs&vacancies.html', {'all_jobsVacancies':all_jobsVacancies})

def all_tenders(request):
    all_tenders = Tenders.objects.order_by('-deadlineDate')
    return render(request, 'all_tenders.html', {'all_tenders':all_tenders})


def collageGallery(request):
    images = ImageGallery.objects.all()
    context ={
        'images':images

    }
    return render(request, 'collage_gallery.html', context)

def get_images_for_carousel(request):
    try:
        # Retrieve the images (excluding the direct 'url' in the query)
        images = ImageGallery.objects.all()

        # Prepare the image data
        images_data = [
            {
                'id': image.id,
                'url': image.image.url,  # Access the URL of the image field
                'date': image.date
            }
            for image in images
        ]

        # Return the image data as JSON
        return JsonResponse({'images': images_data})

    except Exception as e:
        print(f"Error fetching images: {e}")
        return JsonResponse({'error': 'Internal Server Error', 'details': str(e)}, status=500)

def newsEvents(request):
    news = News.objects.all()
    context = {
        'news':news
    }
    return render(request, 'newsEvents.html', context)

def news_details(request, news_id):
    news_details = get_object_or_404(News, id=news_id)
    popular_news = News.objects.order_by('-date')[:5]  
    recent_news = News.objects.order_by('-date')[:5] 
    context = {
       'news':news_details,
        'popular_news': popular_news,
        'recent_news': recent_news,
    }
    return render(request, 'news_details.html', context)


def historyPage(request):
    return render(request, 'about1.html')

def adminstrationPage(request):
    administrators = Administration.objects.all()
    admin_count = administrators.count()
    return render(request, 'adminstration.html',  {'administrators': administrators,'admin_count':admin_count})

def adminstrationDetails(request, id):
    admin = get_object_or_404(Administration, id=id)
    return render(request, 'adminstration_details.html', {'admin':admin})


def principalDetail(request):
    principal_message = get_object_or_404(Administration, position__iexact="Chief Principal")
    
    context = {
        'principal_message': principal_message,
    }
    return render(request, 'principal_detail.html', context)

def allCourses(request):
    courses = Course.objects.all().order_by('course_level') 
    query = request.GET.get('q', '')
    if query:
        
        courses = courses.filter(
            Q(course_name__icontains=query) | Q(description__icontains=query)
        ).order_by('course_level')

    
    paginator = Paginator(courses, 10)  
    page = request.GET.get('page')
    try:
        paginated_courses = paginator.page(page)
    except PageNotAnInteger:
        paginated_courses = paginator.page(1)
    except EmptyPage:
        paginated_courses = paginator.page(paginator.num_pages)

    context = {
        'paginated_courses': paginated_courses,
        'query': query,
    }
    return render(request, 'courses/all_courses.html', context)


def allDepartments(request):
    departments = Department.objects.all()

    context ={
        'departments':departments

    }
    return render(request, 'departments/all_department.html', context)

def department_details(request, department_id):
    department = get_object_or_404(Department, id=department_id)
    courses = department.courses.all()

    
    paginator = Paginator(courses, 10)  
    page_number = request.GET.get('page')
    page_courses = paginator.get_page(page_number)

    return render(request, 'departments/department_details.html', {
        'department': department,
        'courses': page_courses
    })



def supporting_department_details(request, support_department_id):

    supporting_departments = get_object_or_404(SupportingDepartment, id=support_department_id)

    return render(request, 'departments/support_department_details.html', {'department': supporting_departments})

def applicationForm(request):
    return render(request, 'application_form.html')

def applicationPdf(request):
    application_form = Notice.objects.filter(
        title__icontains="application_form", uploadNotice__isnull=False
    ).order_by('-date').first()
    application_file_url = application_form.uploadNotice.url if application_form else None
    return render(request, 'application_pdf.html', {'application_file_url': application_file_url})

def feeStructure(request):
    fee_structure = Notice.objects.filter(
        title__icontains="fee structure", uploadNotice__isnull=False
    ).order_by('-date').first()

    fee_file_url = fee_structure.uploadNotice.url if fee_structure else None

    
    return render(request, 'fee_structure.html', {'fee_structure': fee_file_url})

def clearanceForm(request):
    clearing_form = Notice.objects.filter(
        title__icontains="clearance form", uploadNotice__isnull=False
    ).order_by('-date').first()

    clearance_file_url = clearing_form.uploadNotice.url if clearing_form else None

    
    return render(request, 'student_affairs/clearance_form.html', {'clearing_form': clearance_file_url})

def courseTransferForm(request):
    transfering_form = Notice.objects.filter(
        title__icontains="course transfer form", uploadNotice__isnull=False
    ).order_by('-date').first()

    transer_file_url = transfering_form.uploadNotice.url if transfering_form else None

    
    return render(request, 'student_affairs/course_transfer.html', {'transfering_form': transer_file_url})

def feeRefundForm(request):
    refunding_form = Notice.objects.filter(
        title__icontains="fee refunding form", uploadNotice__isnull=False
    ).order_by('-date').first()

    refunding_file_url = refunding_form.uploadNotice.url if refunding_form else None

    
    return render(request, 'student_affairs/fee_refund_form.html', {'refunding_form': refunding_file_url})


def serviceCharter(request):
    service_delivery_charter = Notice.objects.filter(
        title__icontains="service delivery charter", uploadNotice__isnull=False
    ).order_by('-date').first()

    service_delivery_file_url = service_delivery_charter.uploadNotice.url if service_delivery_charter else None

    
    return render(request, 'student_affairs/service_charter.html', {'service_delivery_charter': service_delivery_file_url})


def feedback_view(request):
    if request.method == 'POST':
        form = FeedbackForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Your feedback has been submitted successfully!")
            return redirect('mwala_app:feedBack')  # Replace 'feedback' with the URL name of your feedback page
    else:
        form = FeedbackForm()
    return render(request, 'feedback.html', {'form': form})

def feedback_list_view(request):
    # Get filter inputs
    start_date = request.GET.get('start_date')
    end_date = request.GET.get('end_date')

    # Fetch all feedbacks
    feedbacks = Feedback.objects.all().order_by('-submitted_at')

    # Date filter logic
    if start_date:
        try:
            start_date = datetime.strptime(start_date, '%Y-%m-%d').date()
            feedbacks = feedbacks.filter(submitted_at__date__gte=start_date)
        except ValueError:
            print("Invalid start date format")
    if end_date:
        try:
           
            end_date = datetime.strptime(end_date, '%Y-%m-%d').date()
            feedbacks = feedbacks.filter(submitted_at__date__lte=end_date)
        except ValueError:
            print("Invalid end date format")
    paginator = Paginator(feedbacks, 10)  
    page_number = request.GET.get('page')
    page_feedbacks = paginator.get_page(page_number)

    return render(request, 'feedback_list.html', {
        'feedbacks': page_feedbacks,
        'start_date': start_date,
        'end_date': end_date,
    })
def studentAffairs(request, student_affairs_id):
    student_affairs = get_object_or_404(StudentAffairs, id=student_affairs_id)
    context = {
        'student_affairs':student_affairs
    }
    return render(request, 'student_affairs.html', context)

def govnt_scholar(request):
    return render(request, 'student_affairs/govnt_scholar.html')

def contact_view(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            # Save the data to the database
            contact = Contact(
                name=form.cleaned_data['name'],
                phone=form.cleaned_data['phone'],
                email=form.cleaned_data['email'],
                message=form.cleaned_data['message']
            )
            contact.save()

            # Add a success message
            messages.success(request, f"Thank you, {contact.name}. Your message has been received!")

            # Redirect to the same form or another page
            return redirect('mwala_app:contactUs') 
    else:
        form = ContactForm()

    return render(request, 'contact1.html', {'form': form})


def contact_list_view(request):
   
    start_date = request.GET.get('start_date')
    end_date = request.GET.get('end_date')

    
    contacts = Contact.objects.all().order_by('-id')
    if start_date and end_date:
        contacts = contacts.filter(
            created_at__date__gte=start_date, 
            created_at__date__lte=end_date
        )

    
    paginator = Paginator(contacts, 10)
    page_number = request.GET.get('page')
    page_contacts = paginator.get_page(page_number)

    return render(request, 'contact_list.html', {
        'all_contacts': page_contacts,
        'start_date': start_date,
        'end_date': end_date,
    })


def admission_application_view(request):
    if request.method == "POST":
        form = AdmissionApplicationForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            # Add a success message to display after form submission
            messages.success(request, 'Application submitted successfully!')

            # Redirect to the form page or a different page (e.g., application success page)
            return redirect('mwala_app:onlineApplication')
    else:
        form = AdmissionApplicationForm()

    return render(request, 'online_application.html', {'form': form})


def get_counties(request):
    counties = [
        "Mombasa", "Kwale", "Kilifi", "Tana River", "Lamu", "Taita-Taveta",
        "Garissa", "Wajir", "Mandera", "Marsabit", "Isiolo", "Meru",
        "Tharaka-Nithi", "Embu", "Kitui", "Machakos", "Makueni",
        "Nyandarua", "Nyeri", "Kirinyaga", "Murang'a", "Kiambu",
        "Turkana", "West Pokot", "Samburu", "Trans-Nzoia", "Uasin Gishu",
        "Elgeyo-Marakwet", "Nandi", "Baringo", "Laikipia", "Nakuru",
        "Narok", "Kajiado", "Kericho", "Bomet", "Kakamega", "Vihiga",
        "Bungoma", "Busia", "Siaya", "Kisumu", "Homa Bay", "Migori",
        "Kisii", "Nyamira", "Nairobi"
    ]
    return JsonResponse({'counties': counties})

# API end point to fetch courses based on departments
def get_courses(request, department_id):
    courses = Course.objects.filter(department_id=department_id).values('id', 'course_name')
    return JsonResponse({'courses': list(courses)})

def get_course_levels(request, course_id):
    try:
        course = Course.objects.get(id=course_id)  
        course_levels = [course.course_level] 
        data = {'course_levels': [{'id': course.id, 'name': course_level} for course_level in course_levels]}
        return JsonResponse(data) 
    except Course.DoesNotExist:
        return JsonResponse({'error': 'Course not found'}, status=404)
    
def admission_applications(request):
    # Fetch all applications initially
    applications = AdmissionApplication.objects.all()

    # Filter by department if selected
    department = request.GET.get('department')
    if department:
        applications = applications.filter(department__id=department)

    # Filter by course level if selected
    course_level = request.GET.get('course_level')
    if course_level:
        # Filter by course level correctly
        applications = applications.filter(course__course_level=course_level)

    # Filter by intake month if selected
    intake_month = request.GET.get('intake_month')
    if intake_month:
        applications = applications.filter(intake_month=intake_month)

    # Pagination
    paginator = Paginator(applications, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    # Get all departments and course levels for the filter dropdowns
    departments = Department.objects.all()
    course_levels = Course.COURSE_LEVEL_CHOICES  

    context = {
        'page_obj': page_obj,
        'departments': departments,
        'course_levels': course_levels,
        'selected_department': department,
        'selected_course_level': course_level,
        'selected_intake_month': intake_month,
    }
    return render(request, 'admission_applications.html', context)

def search_view(request):
    query = request.GET.get('q', '')

    if query:
        # Check if the query matches a specific model type (for redirection)
        if 'course' in query.lower():  # Searching for courses
            return redirect(reverse('mwala_app:allCourses') + f'?q={query}')
        
        # Default case (if none of the above matches)
        # Handle redirect to a generic search page or display all results as before
        results = []
        return render(request, 'search_results.html', {'query': query, 'results': results})

    return render(request, 'search_results.html', {'query': query, 'results': []})



def service(request):
    context ={

    }
    return render(request, 'services.html')

def examinations(request):
    context ={

    }
    return render(request, 'student_affairs/examinations.html')


def Bog(request):
    return render(request, 'bog.html')

def Brochure(request):
    mwala_brochures = Brochures.objects.all()
    context = {
        'mwala_brochures': mwala_brochures,
    }
    return render(request, 'brochure.html', context)
