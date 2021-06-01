from django.conf import settings
from django.db import models
from datetime import datetime
from django.utils.translation import ugettext_lazy as _
from django.db.models.signals import pre_delete
from django.dispatch import receiver
from django.utils.safestring import mark_safe
from django.core.validators import MinValueValidator, MaxValueValidator
from sports_area.models import *


class Reservation(models.Model):
    status_choices = ((0, "Ожидания"), (1, "Принятый"), (2, "законченный"))

    date = models.DateField(default=datetime.now, verbose_name="Дата")
    start_time = models.TimeField(default=datetime.now, verbose_name="Начальное время")
    end_time = models.TimeField(default=datetime.now, verbose_name="Время окончания")
    status = models.IntegerField(default=0, choices=status_choices, verbose_name="Статус")
    sport_area = models.ForeignKey(SportsArea, on_delete=models.CASCADE, related_name='reservations', blank=True)
    admin = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='reservations_admin', blank=True,
                              null=True, verbose_name="Админ")
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='reservations_user', blank=True, null=True,
                             verbose_name="Пользователь")
    price = models.IntegerField(default=0, verbose_name="Цена")

    class Meta:
        verbose_name = _("Бронирования")
        verbose_name_plural = _("Бронирование")

