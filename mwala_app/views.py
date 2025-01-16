from django.shortcuts import redirect, render
from django.shortcuts import render, get_object_or_404
from mwala_app.forms import AdmissionApplicationForm, ContactForm, FeedbackForm
from django.contrib import messages
from django.urls import reverse
from django.db.models import Q
from mwala_app.models import Administration, Contact, Course, Department, ImageGallery, JobsVacancies, News, Notice, StudentAffairs, SupportingDepartment

# Create your views here.
def homePage(request):
    
    notices = Notice.objects.order_by('-date')[:3]
    job_vacancies  = JobsVacancies.objects.order_by('-deadlineDate')[:4]
    departments = Department.objects.all()
    principal_message = Administration.objects.filter(position__iexact="Principal").first()
    # Group courses by their levels
    course_levels = Course.objects.values_list('course_level', flat=True).distinct().order_by('course_level')
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

    # Convert the slug to the corresponding database format
    level_name = level_mapping.get(level.lower())


    # If the level is not in the mapping, return 404
    if not level_name:
        context = {
            'error_message': f"Invalid course level '{level}'."
        }
        return render(request, 'index1.html', context, status=404)

    # Fetch courses for the given level
    courses = Course.objects.filter(course_level__iexact=level_name)


    # If no courses are found, return 404 with a helpful message
    if not courses.exists():
        context = {
            'error_message': f"No courses found for level '{level_name}'."
        }
        return render(request, 'index1.html', context, status=404)

    # Pass the courses and level to the template
    context = {
        'level': level_name,
        'courses': courses,
    }
    return render(request, 'courses/course_level.html', context)




def all_notices(request):
    all_notices = Notice.objects.order_by('-date')  # Fetch all notices
    return render(request, 'all_notices.html', {'notices': all_notices})



def all_jobsVacancies(request):
    all_jobsVacancies = JobsVacancies.objects.order_by('-deadlineDate')
    return render(request, 'all_jobs&vacancies.html', {'all_jobsVacancies':all_jobsVacancies})


def collageGallery(request):
    images = ImageGallery.objects.all()
    context ={
        'images':images

    }
    return render(request, 'collage_gallery.html', context)



from django.http import JsonResponse
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
        # Log and return the error if anything goes wrong
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
    # Fetch the Principal's information
    principal_message = get_object_or_404(Administration, position__iexact="Principal")
    
    context = {
        'principal_message': principal_message,
    }
    return render(request, 'principal_detail.html', context)


from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

def allCourses(request):
    # Fetch all courses
    courses = Course.objects.all().order_by('course_level')  # Ensure ordering happens before slicing

    # Get search query
    query = request.GET.get('q', '')
    if query:
        # Filter courses based on the search query
        courses = courses.filter(
            Q(course_name__icontains=query) | Q(description__icontains=query)
        ).order_by('course_level')

    # Pagination
    paginator = Paginator(courses, 10)  # Show 10 courses per page
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
    departments = Department.objects.all()

    context ={
        'departments':departments

    }
    return render(request, 'departments/all_department.html', context)

def department_details(request, department_id):
    department = get_object_or_404(Department, id=department_id)
    courses = department.courses.all()
    return render(request, 'departments/department_details.html', {'department': department, 'courses':courses})


def supporting_department_details(request, support_department_id):

    supporting_departments = get_object_or_404(SupportingDepartment, id=support_department_id)

    return render(request, 'departments/support_department_details.html', {'department': supporting_departments})

def applicationForm(request):
    return render(request, 'application_form.html')

def applicationPdf(request):
    # Fetch the Notice where the title contains 'Application Form' and has a file uploaded
    application_form = Notice.objects.filter(
        title__icontains="application_form", uploadNotice__isnull=False
    ).order_by('-date').first()

    # Get the file URL or set to None if no match
    application_file_url = application_form.uploadNotice.url if application_form else None

    # Render the template
    return render(request, 'application_pdf.html', {'application_file_url': application_file_url})

def feeStructure(request):
    # Get the most recent Notice with a file uploaded (i.e., a non-null 'uploadNotice')
    fee_structure = Notice.objects.filter(uploadNotice__isnull=False).order_by('-date').first()

    # Check if there's an uploaded fee structure
    if fee_structure:
        fee_file_url = fee_structure.uploadNotice.url  # URL for the uploaded fee structure file
    else:
        fee_file_url = None  # If no fee structure is uploaded

    return render(request, 'fee_structure.html', {'fee_structure': fee_file_url})

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
            return redirect('mwala_app:contactUs')  # Replace 'contact' with the name of your contact page URL pattern
    else:
        form = ContactForm()

    return render(request, 'contact1.html', {'form': form})


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