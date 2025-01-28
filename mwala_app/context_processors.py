



# context_processors.py

from .models import ImageGallery, News, StudentAffairs, SupportingDepartment, Administration, Department, Course
from django.db.models import Q

def supporting_department(request):
    # Fetch all supporting departments from the database
    supporting_departments = SupportingDepartment.objects.all()
    return {'supporting_departments': supporting_departments}

def academic_departments(request):
    departments = Department.objects.all()
    return {
        'departments': departments
    }

# Context processor
def studentAffairs(request):
    all_student_affairs = StudentAffairs.objects.all()  
    return {'all_student_affairs': all_student_affairs}


def breaking_news(request):
    # Fetch the most recent news (or any logic you prefer)
    recent_news = News.objects.order_by('-date')[:5]
    return {'breaking_news': recent_news}




def courses_search(request):
    query = request.GET.get('q', '')  # Get the search query from the URL
    courses = Course.objects.all()  # Get all courses

    if query:
        # Filter courses based on the search query
        courses = courses.filter(
            Q(course_name__icontains=query) | Q(description__icontains=query)
        )

    return {
        'courses': courses,
        'query': query,
    }

def administration_context(request):
    administrators = Administration.objects.all()
    admin_count = administrators.count()
    return {
        'administrators': administrators,
        'admin_count': admin_count,
    }

def news_context(request):
    # Retrieve all news
    limited_news = News.objects.all()[:3]
    news = News.objects.all()
    # Retrieve the most popular and recent news
    popular_news = News.objects.order_by('-date')[:5]
    recent_news = News.objects.order_by('-date')[:5]
    
    return {
        'news': news,
        'popular_news': popular_news,
        'recent_news': recent_news,
        'limited_news': limited_news,

    }

def collage_gallery_context(request):
    first_8_images = ImageGallery.objects.all()[:4]  # Fetch the first 4 images
    all_images = ImageGallery.objects.all()  # Fetch all images
    return {
        'first_8_images': first_8_images,
        'all_images': all_images,
    }