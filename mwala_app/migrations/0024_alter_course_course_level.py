# Generated by Django 5.1.4 on 2025-01-16 06:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mwala_app', '0023_alter_administration_description_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='course_level',
            field=models.CharField(choices=[('Diploma(level 6)', 'Diploma(level 6)'), ('Certificate(level 5)', 'Certificate(level 5)'), ('Artisan(level 4)', 'Artisan(level 4)'), ('Short courses(level 3)', 'Short courses(level 3)'), ('Accounting', 'Accounting'), ('NITA', 'NITA')], max_length=200),
        ),
    ]
