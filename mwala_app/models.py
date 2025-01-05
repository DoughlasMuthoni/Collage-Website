from django.db import models

# Create your models here.
from django.utils.html import mark_safe


class Administration(models.Model):
    id = models.AutoField(primary_key=True)  # Automatically increments for unique ID
    title = models.CharField(max_length=100, help_text="Name of the administrator (e.g., Principal, Dean, etc.)")
    position = models.CharField(max_length=100, help_text="Position or role (e.g., Principal, Vice Principal)")
    description = models.TextField(help_text="Description of responsibilities or role")
    image = models.ImageField(upload_to='administration_images/', blank=True, null=True, help_text="Upload a profile picture")


    def __str__(self):
        return f"{self.title} - {self.position}"




class Course(models.Model):
    EXAMINATION_BODY_CHOICES = [
        ('KNEC', 'KNEC'),
        ('CDACC', 'CDACC'),
        ('KASNEB', 'KASNEB'),
    ]

    COURSE_LEVEL_CHOICES = [
        ('Diploma', 'Diploma'),
        ('Certificate', 'Certificate'),
        ('Artisan', 'Artisan'),
        ('Short courses', 'Short courses'),
        ('Accounting', 'Accounting'),
        ('NITA', 'NITA'),
    ]

    id = models.AutoField(primary_key=True)
    description = models.TextField()
    course_name = models.CharField(max_length=255)
    qualification = models.CharField(max_length=255)
    duration = models.CharField(max_length=100)
    examination_body = models.CharField(
        max_length=10,
        choices=EXAMINATION_BODY_CHOICES
    )
    course_level = models.CharField(
        max_length=20,
        choices=COURSE_LEVEL_CHOICES
    )



    def __str__(self):
        return self.course_name 
