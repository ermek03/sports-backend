from django.db.models import Sum
from rest_framework import serializers
from django.contrib.auth import get_user_model
from fcm_django.models import FCMDevice
from .models import *


class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = "__all__"


class FcmCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = FCMDevice
        fields = '__all__'
