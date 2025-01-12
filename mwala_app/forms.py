

from django import forms

from mwala_app.models import AdmissionApplication, Feedback

class ContactForm(forms.Form):
    name = forms.CharField(max_length=100, label="Enter your name", widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter your name'}))
    phone = forms.CharField(max_length=15, label="Enter phone number", widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter phone number'}))
    email = forms.EmailField(label="Enter email address", widget=forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Enter email address'}))
    message = forms.CharField(label="Write your message here", widget=forms.Textarea(attrs={'class': 'form-control', 'rows': 5, 'placeholder': 'Write your message here...'}))




class FeedbackForm(forms.ModelForm):
    departments_choices = [

        ('Procurement', 'Procurement'),
        ('Finance', 'Finance'),
        ('Principal', 'Principal'),
        ('Admissions', 'Admissions'),
    ]

    department_choices = forms.MultipleChoiceField(
        choices=departments_choices,
        widget=forms.CheckboxSelectMultiple(attrs={
            'class': 'form-check-input',
        }),
        label="Which department(s) were you visiting?"
    )

    class Meta:
        model = Feedback
        fields = [
            'organization_name', 'visit_date', 'time_in', 'time_out',
            'department_choices', 'service_rating', 'complaints',
            'complaints_description', 'compliments', 'compliments_description'
        ]
        widgets = {
            'organization_name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Enter the organization name or your full name...',
            }),
            'visit_date': forms.DateInput(attrs={
                'class': 'form-control',
                'type': 'date',
            }),
            'time_in': forms.TimeInput(attrs={
                'class': 'form-control',
                'type': 'time',
            }),
            'time_out': forms.TimeInput(attrs={
                'class': 'form-control',
                'type': 'time',
            }),
            'service_rating': forms.RadioSelect(attrs={'class': 'form-check-input'}),
            'complaints': forms.RadioSelect(attrs={'class': 'form-check-input'}),
            'complaints_description': forms.Textarea(attrs={
                'class': 'form-control',
                'rows': 3,
                'placeholder': 'Describe any complaints here...',
            }),
            'compliments': forms.RadioSelect(attrs={'class': 'form-check-input'}),
            'compliments_description': forms.Textarea(attrs={
                'class': 'form-control',
                'rows': 3,
                'placeholder': 'Enter any compliments here...',
            }),
        }

class AdmissionApplicationForm(forms.ModelForm):
    class Meta:
        model = AdmissionApplication
        fields = [
            'first_name', 'last_name', 'email', 'phone', 
            'kcse_grade', 'course', 'intake_month', 
            'kcse_certificate', 'birth_certificate'
        ]
        widgets = {
            'first_name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Enter your first name',
            }),
            'last_name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Enter your last name',
            }),
            'email': forms.EmailInput(attrs={
                'class': 'form-control',
                'placeholder': 'Enter your email address',
            }),
            'phone': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Enter your phone number',
            }),
            'kcse_grade': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Enter your KCSE mean grade',
            }),
            'course': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Enter the course you are interested in',
            }),
            'intake_month': forms.Select(attrs={
                'class': 'form-select',
            }, choices=[
                ('January', 'January'),
                ('May', 'May'),
                ('September', 'September')
            ]),
            'kcse_certificate': forms.ClearableFileInput(attrs={
                'class': 'form-control',
            }),
            'birth_certificate': forms.ClearableFileInput(attrs={
                'class': 'form-control',
            }),
        }
