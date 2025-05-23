# Generated by Django 5.1.4 on 2025-01-06 15:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mwala_app', '0009_remove_department_course_course_department'),
    ]

    operations = [
        migrations.CreateModel(
            name='SupportingDepartment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('image', models.ImageField(blank=True, null=True, upload_to='supporting_departments/')),
                ('hod_name', models.CharField(max_length=150)),
                ('hod_message', models.TextField()),
                ('position', models.CharField(max_length=50)),
            ],
        ),
    ]
