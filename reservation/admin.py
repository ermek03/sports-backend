from django.contrib import admin

# Register your models here.
from .models import *


class ReservationAdmin(admin.ModelAdmin):
    list_display = ['user', 'admin', 'sport_area', 'status', 'date']
    list_display_links = list_display
    search_fields = ['stadium', 'user']


admin.site.register(Reservation, ReservationAdmin)
