from django.contrib import admin

# Register your models here.
from .models import Administration, AdmissionApplication, Contact, Course, Department, Feedback, ImageGallery, JobsVacancies, Brochures, Notice, StudentAffairs, SupportingDepartment, News, Tenders

@admin.register(Administration)
class AdministrationAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'position', 'position_level','image_preview')  # Show an image preview
    search_fields = ('title', 'position')
    list_filter = ('position',)
    
    def image_preview(self, obj):
        if obj.image:
            return f'<img src="{obj.image.url}" width="50" height="50" style="border-radius: 50%;" />'
        return "No Image"
    image_preview.short_description = 'Image'
    image_preview.allow_tags = True



class CourseAdmin(admin.ModelAdmin):
    # Display fields in the list view
    list_display = ('id', 'course_name', 'qualification', 'duration', 'examination_body', 'course_level', 'department')
    
    # Add filters for the list view
    list_filter = ('examination_body', 'course_level')
    
    # Enable search for specific fields
    search_fields = ('course_name', 'qualification', 'description')

    

    # Alternatively, use fieldsets for grouping the fields
    fieldsets = (
        ('Course Information', {
            'fields': ('course_name', 'department'),
            'classes': ('collapse',),  # Optional: Collapse the section by default
        }),
        ('Qualification & Duration', {
            'fields': ('qualification', 'duration'),
        }),
        ('Examination & Level', {
            'fields': ('examination_body', 'course_level'),
        }),
    )

@admin.register(Notice)
class NoticeAdmin(admin.ModelAdmin):
    list_display = ('title', 'date', 'uploadNotice')

@admin.register(JobsVacancies)
class JobsVacanciesAdmin(admin.ModelAdmin):
    list_display = ('position', 'deadlineDate', 'uploadJobs')

@admin.register(Tenders)
class TendersAdmin(admin.ModelAdmin):
    list_display = ('name', 'deadlineDate', 'uploadJobs')


@admin.register(ImageGallery)
class ImageGalleryAdmin(admin.ModelAdmin):
    list_display = ('date', 'image')



@admin.register(Department)
class DepartmentAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'hod_name', 'image','hod_image',)  # Fields to display in the list view
    search_fields = ('title', 'hod_name', 'course__title')  # Fields to enable search functionality
    list_filter = ('title',)  # Add filters for courses
    readonly_fields = ('id',)  # Make the 'id' field read-only
    fieldsets = (
        (None, {
            'fields': ('title', 'image', 'hod_image','description', 'hod_name', 'hod_message', 'hod_info')
        }),
        ('Additional Info', {
            'fields': ('id',),
            'classes': ('collapse',),  # Collapse section for less important fields
        }),
    )

@admin.register(SupportingDepartment)
class SupportingDepartmentAdmin(admin.ModelAdmin):
    list_display = ('title', 'hod_name', 'position', 'image', 'hod_information')  # Display these fields in the admin list
    search_fields = ('title', 'hod_name', 'position')  # Make title, hod_name, and position searchable
    list_filter = ('position',)  # Add filtering by position to the list view

@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    list_display = ('title', 'date')

@admin.register(Brochures)
class BrochuresAdmin(admin.ModelAdmin):
    list_display = ('title','brochure',)

@admin.register(StudentAffairs)
class StudentAffairsAdmin(admin.ModelAdmin):
    list_display = ('title', 'name', 'image', 'details', )

@admin.register(Contact)
class ContactAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'phone', 'created_at')
    search_fields = ('name', 'email', 'phone')

class FeedbackAdmin(admin.ModelAdmin):
    list_display = (
        'organization_name',
        'visit_date',
        'time_in',
        'time_out',
        'service_rating',
        'complaints',
        'compliments',
    )
    list_filter = ('visit_date', 'service_rating', 'complaints', 'compliments')
    search_fields = ('organization_name', 'departments', 'complaints_description', 'compliments_description')
    ordering = ('-visit_date',)  # Sorts by most recent visit date by default



class AdmissionApplicationAdmin(admin.ModelAdmin):
    # Include the new 'submitted_at' field in list_display
    list_display = ('first_name', 'last_name', 'email', 'phone', 'kcse_grade', 'course','county','department', 'intake_month', 'submitted_at')
    
    # Allow these fields to be clickable to go to the detail view
    list_display_links = ('first_name', 'last_name')

    # Add filters for intake month and KCSE grade
    list_filter = ('intake_month', 'kcse_grade')

    # Add a search bar for the first name, last name, and email
    search_fields = ('first_name', 'last_name', 'get_course_level')

    # Group fields in the form view, including 'submitted_at' (which is read-only)
    fieldsets = (
        (None, {
            'fields': ('first_name', 'last_name', 'email', 'phone', 'kcse_grade', 'course', 'intake_month', 'kcse_certificate','county','department', 'birth_certificate')
        }),
        ('Submission Info', {
            'fields': ('submitted_at',),
            'classes': ('collapse',)  # Collapsed by default
        }),
    )

    # Make 'submitted_at' field read-only
    readonly_fields = ('submitted_at',)

    # Optionally, specify the ordering of records based on submission date
    ordering = ['submitted_at']

# Register the AdmissionApplication model in the admin panel
admin.site.register(AdmissionApplication, AdmissionApplicationAdmin)
admin.site.register(Course, CourseAdmin)
admin.site.register(Feedback, FeedbackAdmin)
