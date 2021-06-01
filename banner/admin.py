from django.contrib import admin
from django import forms

# Register your models here.
from .models import *


class SliderForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(SliderForm, self).__init__(*args, **kwargs)
        self.fields['numeration'].initial = len(Slider.objects.all()) + 1


class SliderAdmin(admin.ModelAdmin):
    list_display = ['title', 'image']
    search_fields = ['title']

    form = SliderForm
    fields = ('title', 'text', 'numeration', 'image')


class FeedbackAdmin(admin.ModelAdmin):
    list_display = ['text', 'user_name', 'email', 'is_active']
    search_fields = ['text']


admin.site.register(Slider, SliderAdmin)
admin.site.register(Feedback, FeedbackAdmin)
