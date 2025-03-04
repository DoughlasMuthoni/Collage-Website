# Generated by Django 5.1.4 on 2025-01-12 06:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mwala_app', '0018_feedback'),
    ]

    operations = [
        migrations.RenameField(
            model_name='feedback',
            old_name='departments',
            new_name='department_choices',
        ),
        migrations.AlterField(
            model_name='feedback',
            name='complaints',
            field=models.CharField(choices=[('Yes', 'Yes'), ('No', 'No')], max_length=3),
        ),
        migrations.AlterField(
            model_name='feedback',
            name='compliments',
            field=models.CharField(choices=[('Yes', 'Yes'), ('No', 'No')], max_length=3),
        ),
        migrations.AlterField(
            model_name='feedback',
            name='service_rating',
            field=models.CharField(choices=[('Excellent', 'Excellent'), ('Very Good', 'Very Good'), ('Good', 'Good'), ('Fair', 'Fair'), ('Poor', 'Poor')], max_length=20),
        ),
    ]
