from django.contrib import admin
from .models import User, UserProfile
from .forms import UserChangeForm, UserCreationForm
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.utils.translation import ugettext_lazy as _


# Register your models here.
class UserProfileInline(admin.StackedInline):
    model = UserProfile
    can_delete = False


class UserAdmin(BaseUserAdmin):
    fieldsets = (
        (None, {'fields': ('username', 'email', 'password')}),
        (_('Permissions'), {'fields': ('is_active', 'is_staff', 'is_superuser')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'email', 'password1', 'password2'),
        }),
    )
    list_display = ('phone_number', 'email', 'date_joined', 'is_active')

    def phone_number(self, obj):
        return obj.username

    phone_number.short_description = 'Телефон номер'
    search_fields = ('username', 'email')
    form = UserChangeForm
    add_form = UserCreationForm
    ordering = ('email',)
    inlines = (UserProfileInline,)


admin.site.register(User, UserAdmin)
admin.site.site_header = "Sports.kg admin"
