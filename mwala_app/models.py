from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField
from django.utils import timezone
# Create your models here.



class Administration(models.Model):
    id = models.AutoField(primary_key=True)  # Automatically increments for unique ID
    title = models.CharField(max_length=100, help_text="Name of the administrator (e.g., Principal, Dean, etc.)")
    position = models.CharField(max_length=100, help_text="Position or role (e.g., Principal, Vice Principal)")
    description = RichTextUploadingField(help_text="Description of responsibilities or role")
    image = models.ImageField(upload_to='administration_images/', blank=True, null=True, help_text="Upload a profile picture")


    def __str__(self):
        return f"{self.title} - {self.position}"

class Department(models.Model):
    id = models.AutoField(primary_key=True)  # Auto-incrementing primary key
    title = models.CharField(max_length=200)  # Department title
    image = models.ImageField(upload_to='department_images/', blank=True, null=True)  # Department image
    description =RichTextUploadingField()  # Detailed description of the department
    hod_name = models.CharField(max_length=150)  # Head of Department's name
    hod_message =RichTextUploadingField()  # Message from the Head of Department
    

    def __str__(self):
        return self.title

class Course(models.Model):
    EXAMINATION_BODY_CHOICES = [
        ('KNEC', 'KNEC'),
        ('CDACC', 'CDACC'),
        ('KASNEB', 'KASNEB'),
    ]

    COURSE_LEVEL_CHOICES = [
        ('Diploma(level 6)', 'Diploma(level 6)'),
        ('Certificate(level 5)', 'Certificate(level 5)'),
        ('Artisan(level 4)', 'Artisan(level 4)'),
        ('Short courses(level 3)', 'Short courses(level 3)'),
        ('Accounting', 'Accounting'),
        ('NITA', 'NITA'),
    ]

    id = models.AutoField(primary_key=True)
    description =RichTextUploadingField()
    course_name = models.CharField(max_length=255)
    department = models.ForeignKey(Department, on_delete=models.CASCADE, related_name='courses')
    qualification = models.CharField(max_length=255)
    duration = models.CharField(max_length=100)
    examination_body = models.CharField(
        max_length=10,
        choices=EXAMINATION_BODY_CHOICES
    )
    course_level = models.CharField(
        max_length=200,
        choices=COURSE_LEVEL_CHOICES
    )



    def __str__(self):
        return self.course_name 

class Notice(models.Model):
    title = models.CharField(max_length=200)  # Notice title
    date = models.DateField()  # Notice date
    uploadNotice = models.FileField(upload_to='notices/', blank=True, null=True)  # Optional file upload for notice

    def __str__(self):
        return self.title
    
class JobsVacancies(models.Model):
    position = models.CharField(max_length=200)
    deadlineDate = models.DateField()  
    uploadJobs = models.FileField(upload_to='Jobs_vacancies/', blank=True, null=True)  

    def __str__(self):
        return self.position
    
class Tenders(models.Model):
    name = models.CharField(max_length=200)
    deadlineDate = models.DateField()  
    uploadJobs = models.FileField(upload_to='Tenders/', blank=True, null=True)  

    def __str__(self):
        return self.name


class SupportingDepartment(models.Model):
    title = models.CharField(max_length=200)  # Title of the department
    image = models.ImageField(upload_to='supporting_departments/', blank=True, null=True)  # Department image
    hod_name = models.CharField(max_length=150)  # Head of Department name
    hod_message = RichTextUploadingField()  # Head of Department message
    position = models.CharField(max_length=50)  # Position of the department (e.g., 'Faculty', 'Support')

    def __str__(self):
        return self.title

class StudentAffairs(models.Model):
    image = models.ImageField(upload_to='student_affairs/', blank=True, null=True)
    title = models.CharField(max_length=200)
    name = models.CharField(max_length=200, blank=True, null=True)
    details = RichTextUploadingField(max_length=8000) 
    
    def __str__(self):
        return self.title



class ImageGallery(models.Model):
    title = models.CharField(max_length=200, blank=True, null=True)
    description = models.CharField(max_length=200, blank=True, null=True)
    date = models.DateField()
    image = models.ImageField(upload_to='imageGallery/', blank=True, null=True)

    def __str__(self):
        return self.title or self.date.strftime('%Y-%m-%d')


class News(models.Model):
    title = models.CharField(max_length=200)  # Title of the news
    description = RichTextUploadingField()  # Description of the news
    image = models.ImageField(upload_to='news/images/')  # Image file, stored in 'news/images/' directory
    video_attachment = models.FileField(upload_to='news/videos/', blank=True, null=True)  # Optional video attachment
    date = models.DateField()  # Date of the news

    def __str__(self):
        return self.title
    


class Contact(models.Model):
    name = models.CharField(max_length=100)
    phone = models.CharField(max_length=15)
    email = models.EmailField()
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.name} - {self.email}"

class Feedback(models.Model):
    organization_name = models.CharField(max_length=255)
    visit_date = models.DateField()
    time_in = models.TimeField()
    time_out = models.TimeField()
    
    DEPARTMENTS = [
        ('Procurement', 'Procurement'),
        ('Finance', 'Finance'),
        ('Principal', 'Principal'),
        ('Admissions', 'Admissions'),
    ]
    department_choices = models.CharField(max_length=255)
    
    SERVICE_RATING_CHOICES = [
        ('Excellent', 'Excellent'),
        ('Very Good', 'Very Good'),
        ('Good', 'Good'),
        ('Fair', 'Fair'),
        ('Poor', 'Poor'),
    ]
    service_rating = models.CharField(max_length=20, choices=SERVICE_RATING_CHOICES)
    
    complaints = models.CharField(max_length=3, choices=[('Yes', 'Yes'), ('No', 'No')])
    complaints_description = models.TextField(blank=True, null=True)
    compliments = models.CharField(max_length=3, choices=[('Yes', 'Yes'), ('No', 'No')])
    compliments_description = models.TextField(blank=True, null=True)
    submitted_at = models.DateTimeField(default=timezone.now)
    
    def __str__(self):
        return self.organization_name

class AdmissionApplication(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField()
    phone = models.CharField(max_length=15)
    kcse_grade = models.CharField(max_length=5)
    course = models.ForeignKey(Course, on_delete=models.CASCADE, default=1)  # Default to course with ID 1
    department = models.ForeignKey(Department, on_delete=models.CASCADE, default=1)  # Default to department with 
    county = models.CharField(max_length=50, default='Nairobi')
    intake_month = models.CharField(max_length=20)
    kcse_certificate = models.FileField(upload_to='kcse_certificates/')
    birth_certificate = models.FileField(upload_to='birth_certificates/')
    submitted_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.first_name} {self.last_name} - {self.course}"