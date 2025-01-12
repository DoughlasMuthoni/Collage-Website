

# context_processors.py

from .models import News, StudentAffairs, SupportingDepartment

def supporting_department(request):
    # Fetch all supporting departments from the database
    supporting_departments = SupportingDepartment.objects.all()
    return {'supporting_departments': supporting_departments}


# Context processor
def studentAffairs(request):
    all_student_affairs = StudentAffairs.objects.all()  
    return {'all_student_affairs': all_student_affairs}


def breaking_news(request):
    # Fetch the most recent news (or any logic you prefer)
    recent_news = News.objects.order_by('-date')[:5]
    return {'breaking_news': recent_news}
