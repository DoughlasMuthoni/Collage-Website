# Generated by Django 5.1.4 on 2025-01-13 06:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mwala_app', '0020_admissionapplication'),
    ]

    operations = [
        migrations.AddField(
            model_name='imagegallery',
            name='description',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='imagegallery',
            name='title',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
    ]
