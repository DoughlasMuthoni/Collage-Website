# Generated by Django 5.1.4 on 2025-01-14 12:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mwala_app', '0021_imagegallery_description_imagegallery_title'),
    ]

    operations = [
        migrations.AddField(
            model_name='studentaffairs',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='student_affairs/'),
        ),
    ]
