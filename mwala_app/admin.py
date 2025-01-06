from django.contrib import admin

# Register your models here.
from .models import Administration, Course, Notice

@admin.register(Administration)
class AdministrationAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'position', 'image_preview')  # Show an image preview
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
    list_display = ('id', 'course_name', 'qualification', 'duration', 'examination_body', 'course_level')
    
    # Add filters for the list view
    list_filter = ('examination_body', 'course_level')
    
    # Enable search for specific fields
    search_fields = ('course_name', 'qualification', 'description')

    

    # Alternatively, use fieldsets for grouping the fields
    fieldsets = (
        ('Course Information', {
            'fields': ('course_name', 'description'),
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
    list_display = ('title', 'date')

admin.site.register(Course, CourseAdmin)
