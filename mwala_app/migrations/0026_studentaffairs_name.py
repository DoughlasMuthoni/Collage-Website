# Generated by Django 5.1.4 on 2025-01-18 13:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mwala_app', '0025_admissionapplication_county_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='studentaffairs',
            name='name',
            field=models.CharField(default=1, max_length=200),
            preserve_default=False,
        ),
    ]
