# Generated by Django 5.1.4 on 2025-01-24 12:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mwala_app', '0028_feedback_submitted_at'),
    ]

    operations = [
        migrations.CreateModel(
            name='Tenders',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('deadlineDate', models.DateField()),
                ('uploadJobs', models.FileField(blank=True, null=True, upload_to='Tenders/')),
            ],
        ),
    ]
