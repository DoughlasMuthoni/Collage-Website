# Generated by Django 5.1.4 on 2025-05-28 09:36

import ckeditor_uploader.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mwala_app', '0035_alter_course_course_level'),
    ]

    operations = [
        migrations.AddField(
            model_name='department',
            name='hod_info',
            field=ckeditor_uploader.fields.RichTextUploadingField(blank=True, max_length=1200, null=True),
        ),
    ]
