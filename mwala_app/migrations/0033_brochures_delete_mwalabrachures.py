# Generated by Django 5.1.4 on 2025-01-29 12:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mwala_app', '0032_mwalabrachures_title_alter_mwalabrachures_brochure'),
    ]

    operations = [
        migrations.CreateModel(
            name='Brochures',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('brochure', models.FileField(blank=True, null=True, upload_to='brochures/')),
            ],
        ),
        migrations.DeleteModel(
            name='MwalaBrachures',
        ),
    ]
