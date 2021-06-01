from django.conf import settings
from django.db import models
from datetime import datetime
from django.utils.translation import ugettext_lazy as _
from django.db.models.signals import pre_delete
from django.dispatch import receiver
from django.utils.safestring import mark_safe
from django.core.validators import MinValueValidator, MaxValueValidator
import PIL
from PIL import Image
from smart_selects.db_fields import *


####################################################################################
class Category(models.Model):
    title = models.CharField(max_length=50, verbose_name="Название")
    image = models.ImageField(upload_to='categories/', verbose_name="Изображение")
    numeration = models.IntegerField(validators=[MinValueValidator(0)], verbose_name='Нумерация')

    class Meta:
        verbose_name = _("Категория")
        verbose_name_plural = _("Категории")

    def image_tag(self):
        return mark_safe('<img src="%s" width="200" />' % self.image.url)

    image_tag.short_description = 'Изображение'

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        try:
            this = Category.objects.get(id=self.id)
            if this.image != self.image:
                this.image.delete()
        except:
            pass

        super(Category, self).save(*args, **kwargs)
        img = Image.open(self.image)
        width, height = img.size
        if width > 500:
            ratio = float(width / 500)
            width = int(width / ratio)
            height = int(height / ratio)
            img = img.resize((width, height), PIL.Image.ANTIALIAS)
            img.save(self.image.path, quality=100, optimize=True)
        else:
            img.save(self.image.path, quality=100, optimize=True)


@receiver(pre_delete, sender=Category)
def delete_image(sender, instance, **kwargs):
    # Pass false so FileField doesn't save the model.
    instance.image.delete(False)


####################################################################################
class Infrastructure(models.Model):
    title = models.CharField(max_length=50, verbose_name="Название")
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='infrastructures', verbose_name="Категория")
    image = models.ImageField(upload_to='infrastructures/', verbose_name="Изображение")

    class Meta:
        verbose_name = _("Инфраструктура")
        verbose_name_plural = _("Инфраструктуры")

    def image_tag(self):
        return mark_safe('<img src="%s" width="200" />' % self.image.url)

    image_tag.short_description = 'Изображение'

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        try:
            this = Infrastructure.objects.get(id=self.id)
            if this.image != self.image:
                this.image.delete()
        except:
            pass

        super(Infrastructure, self).save(*args, **kwargs)
        img = Image.open(self.image)
        width, height = img.size
        if width > 110:
            ratio = float(width / 110)
            width = int(width / ratio)
            height = int(height / ratio)
            img = img.resize((width, height), PIL.Image.ANTIALIAS)
            img.save(self.image.path, quality=100, optimize=True)
        else:
            img.save(self.image.path, quality=100, optimize=True)


@receiver(pre_delete, sender=Infrastructure)
def delete_infrastructure(sender, instance, **kwargs):
    # Pass false so FileField doesn't save the model.
    instance.image.delete(False)


####################################################################################
class Type(models.Model):
    title = models.CharField(max_length=50, verbose_name="Название")
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='types', verbose_name="Категория")
    image = models.ImageField(upload_to='types/', verbose_name="Изображение")

    class Meta:
        verbose_name = _("Тип")
        verbose_name_plural = _("Типы")

    def image_tag(self):
        return mark_safe('<img src="%s" width="200" />' % self.image.url)

    image_tag.short_description = 'Изображение'

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        try:
            this = Type.objects.get(id=self.id)
            if this.image != self.image:
                this.image.delete()
        except:
            pass

        super(Type, self).save(*args, **kwargs)
        img = Image.open(self.image)
        width, height = img.size
        if width > 600:
            ratio = float(width / 600)
            width = int(width / ratio)
            height = int(height / ratio)
            img = img.resize((width, height), PIL.Image.ANTIALIAS)
            img.save(self.image.path, quality=100, optimize=True)
        else:
            img.save(self.image.path, quality=100, optimize=True)


@receiver(pre_delete, sender=Type)
def delete_type(sender, instance, **kwargs):
    # Pass false so FileField doesn't save the model.
    instance.image.delete(False)


####################################################################################
class SportsArea(models.Model):
    title = models.CharField(max_length=60, verbose_name="Название")
    text = models.TextField(verbose_name="Описание")
    address = models.CharField(max_length=200, verbose_name="Адрес")
    open_time = models.TimeField(default=datetime.now, verbose_name="Время открытия")
    close_time = models.TimeField(default=datetime.now, verbose_name="Время закрытия")
    phone_1 = models.CharField(max_length=13, null=True, verbose_name="Номер телефона владельца (1)")
    phone_2 = models.CharField(max_length=13, null=True, blank=True, verbose_name="Номер телефона владельца (2)")
    whats_app_phone = models.CharField(max_length=13, null=True, blank=True, verbose_name="Ватсапп номер телефона владельца")
    instagram = models.CharField(max_length=60, null=True, blank=True, verbose_name="Инстаграм")
    price = models.IntegerField(default=0, verbose_name='Цена')
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='advertisements', verbose_name="Категория")
    type = ChainedForeignKey(
        Type,
        verbose_name='Тип',
        chained_field="category",
        chained_model_field="category",
        show_all=False,
        auto_choose=True,
        sort=True)
    infrastructure = ChainedManyToManyField(
        Infrastructure,
        horizontal=True,
        verbose_name='Инфрастрактура',
        chained_field="category",
        chained_model_field="category",
        blank=True)
    admin = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='advertisements', verbose_name="Админ")
    is_active = models.BooleanField(default=True, verbose_name="Активный")
    is_top = models.BooleanField(default=True, verbose_name="Топ")
    image = models.ImageField(upload_to='sports_area/', verbose_name="Изображение")
    create_at = models.DateTimeField(default=datetime.now, verbose_name="Дата")
    latitude = models.FloatField(verbose_name="Широта")
    longitude = models.FloatField(verbose_name="Долгота")

    class Meta:
        verbose_name = _("Спортивная площадка")
        verbose_name_plural = _("Спортивные площадки")

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        try:
            this = SportsArea.objects.get(id=self.id)
            if this.image != self.image:
                this.image.delete()
        except:
            pass

        super(SportsArea, self).save(*args, **kwargs)
        img = Image.open(self.image)
        width, height = img.size
        if width > 1080:
            ratio = float(width / 1080)
            width = int(width / ratio)
            height = int(height / ratio)
            img = img.resize((width, height), PIL.Image.ANTIALIAS)
            img.save(self.image.path, quality=80, optimize=True)
        else:
            img.save(self.image.path, quality=80, optimize=True)


@receiver(pre_delete, sender=SportsArea)
def sports_area_image(sender, instance, **kwargs):
    # Pass false so FileField doesn't save the model.
    instance.image.delete(False)


####################################################################################
class Gallery(models.Model):
    image = models.ImageField(upload_to='galleries/', verbose_name="Изображение", null=True, blank=True)
    sports_area = models.ForeignKey(SportsArea, on_delete=models.CASCADE, related_name='galleries', verbose_name="Спортивная площадка")

    class Meta:
        verbose_name = _("Фото")
        verbose_name_plural = _("Галерия")

    def save(self, *args, **kwargs):
        try:
            this = Gallery.objects.get(id=self.id)
            if this.image != self.image:
                this.image.delete()
        except:
            pass

        super(Gallery, self).save(*args, **kwargs)
        img = Image.open(self.image)
        width, height = img.size
        if width > 1080:
            ratio = float(width / 1080)
            width = int(width / ratio)
            height = int(height / ratio)
            img = img.resize((width, height), PIL.Image.ANTIALIAS)
            img.save(self.image.path, quality=100, optimize=True)
        else:
            img.save(self.image.path, quality=100, optimize=True)


@receiver(pre_delete, sender=Gallery)
def gallery_image(sender, instance, **kwargs):
    # Pass false so FileField doesn't save the model.
    if instance.image:
        instance.image.delete(False)
