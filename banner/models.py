import PIL
from PIL import Image
from django.core.validators import MinValueValidator
from django.db.models.signals import pre_delete
from django.dispatch import receiver
from django.utils.safestring import mark_safe
from django.utils.translation import ugettext_lazy as _

from smart_selects.db_fields import *


####################################################################################
class Slider(models.Model):
    title = models.CharField(max_length=50, verbose_name="Название")
    text = models.TextField(verbose_name="Описание")
    image = models.ImageField(upload_to='sliders/', verbose_name="Изображение")
    numeration = models.IntegerField(validators=[MinValueValidator(0)], verbose_name='Нумерация')

    class Meta:
        verbose_name = _("Слайдер")
        verbose_name_plural = _("Слайдеры")

    def image_tag(self):
        return mark_safe('<img src="%s" width="200" />' % self.image.url)

    image_tag.short_description = 'Изображение'

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        try:
            this = Slider.objects.get(id=self.id)
            if this.image != self.image:
                this.image.delete()
        except:
            pass

        super(Slider, self).save(*args, **kwargs)
        img = Image.open(self.image)
        width, height = img.size
        if width > 1600:
            ratio = float(width / 1600)
            width = int(width / ratio)
            height = int(height / ratio)
            img = img.resize((width, height), PIL.Image.ANTIALIAS)
            img.save(self.image.path, quality=80, optimize=True)
        else:
            img.save(self.image.path, quality=80, optimize=True)


@receiver(pre_delete, sender=Slider)
def delete_image(sender, instance, **kwargs):
    # Pass false so FileField doesn't save the model.
    instance.image.delete(False)


####################################################################################
class Feedback(models.Model):
    text = models.TextField(verbose_name="Текс")
    user_name = models.CharField(max_length=30, verbose_name="Пользователь")
    email = models.CharField(max_length=30, null=True, verbose_name="Email")
    is_active = models.BooleanField(verbose_name='Активный', default=False)

    class Meta:
        verbose_name = _("Отзыв")
        verbose_name_plural = _("Отзывы")

    def __str__(self):
        return self.text
