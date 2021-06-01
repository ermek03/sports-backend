from django.contrib import admin
from django import forms

# Register your models here.
from .models import *


class CategoryForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(CategoryForm, self).__init__(*args, **kwargs)
        self.fields['numeration'].initial = len(Category.objects.all()) + 1


class CategoryAdmin(admin.ModelAdmin):
    list_display = ['title', 'image']
    search_fields = ['title']

    form = CategoryForm
    fields = ('title', 'numeration', 'image')


class InfrastructureAdmin(admin.ModelAdmin):
    list_display = ['title', 'category', 'image']
    search_fields = ['title']
    list_filter = ['category']


class TypeAdmin(admin.ModelAdmin):
    list_display = ['title', 'category', 'image']
    search_fields = ['title']
    list_filter = ['category']


class GalleryInline(admin.TabularInline):
    model = Gallery


class SportsAreaAdmin(admin.ModelAdmin):
    list_display = ['title', 'category', 'create_at', 'is_active']
    list_display_links = list_display
    search_fields = ['text']
    list_filter = ['category']
    inlines = [GalleryInline]


admin.site.register(Category, CategoryAdmin)
admin.site.register(Infrastructure, InfrastructureAdmin)
admin.site.register(Type, TypeAdmin)
admin.site.register(SportsArea, SportsAreaAdmin)
