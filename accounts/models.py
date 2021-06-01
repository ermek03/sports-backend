from datetime import datetime
from django.db import models
from django.conf import settings
from django.contrib.auth.models import AbstractUser
from django.db.models.signals import pre_delete
from django.dispatch import receiver
from django.utils.translation import ugettext_lazy as _
import PIL
from PIL import Image


class User(AbstractUser):
    email = models.EmailField(_('email address'), unique=True)


# Create your models here.
class UserProfile(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name="profile", primary_key=True,
                                verbose_name="Пользователь")
    full_name = models.CharField(max_length=50, blank=True)
    admin = models.BooleanField(default=False, verbose_name='Админ Статус')
    image = models.ImageField(upload_to='users/', null=True, blank=True, verbose_name="Фотография")

    class Meta:
        verbose_name = _("Аккаунт профиль")
        verbose_name_plural = _("Аккаунт профиль")

    def __str__(self):
        return self.user.username

    def save(self, *args, **kwargs):
        try:
            user = User.objects.get(id=self.pk)
            if user.profile.image != self.image:
                user.profile.image.delete()
        except:
            pass

        super(UserProfile, self).save(*args, **kwargs)
        if self.image:
            img = Image.open(self.image)
            width, height = img.size
            if width > 300:
                ratio = float(width / 300)
                width = int(width / ratio)
                height = int(height / ratio)
                img = img.resize((width, height), PIL.Image.ANTIALIAS)
                img.save(self.image.path, quality=100, optimize=True)
            else:
                img.save(self.image.path, quality=100, optimize=True)


@receiver(pre_delete, sender=UserProfile)
def user_profile_image(sender, instance, **kwargs):
    # Pass false so FileField doesn't save the model.
    instance.image.delete(False)
