from rest_framework import serializers
from .models import *


class ReservationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reservation()
        fields = '__all__'


class CreateReservationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reservation
        fields = ['user', 'sport_area', 'admin', 'date', 'start_time', 'end_time', 'price']
