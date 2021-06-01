from django.contrib.auth import get_user_model
from rest_framework import serializers
from .models import *


class UserSportSerializer(serializers.ModelSerializer):
    class Meta:
        model = get_user_model()
        fields = ['id', 'username', 'email']


class InfrastructureSerializer(serializers.ModelSerializer):
    class Meta:
        model = Infrastructure
        fields = ('id', 'title', 'image')


class TypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Type
        fields = ('id', 'title', 'image')


class CategorySerializer(serializers.ModelSerializer):
    types = TypeSerializer(many=True)
    infrastructures = InfrastructureSerializer(many=True)

    class Meta:
        model = Category
        fields = ('id', 'title', 'image', 'numeration', 'types', 'infrastructures',)


class GallerySerializer(serializers.ModelSerializer):
    class Meta:
        model = Gallery
        fields = ['image']


class SportsAreaSerializer(serializers.ModelSerializer):
    class Meta:
        model = SportsArea
        fields = ['id', 'title', 'price', 'address', 'image']


class SportsAreaForMapSerializer(serializers.ModelSerializer):
    class Meta:
        model = SportsArea
        fields = ['id', 'title', 'price', 'address', 'image', 'latitude', 'longitude']


class SportsAreaDetailSerializer(serializers.ModelSerializer):
    galleries = GallerySerializer(many=True)
    admin = UserSportSerializer()
    type = TypeSerializer()
    infrastructure = InfrastructureSerializer(many=True)

    class Meta:
        model = SportsArea
        fields = ['id', 'title', 'text', 'price', 'address', 'image', 'open_time', 'close_time', 'phone_1', 'phone_2', 'whats_app_phone', 'instagram',
                  'admin', 'latitude', 'type', 'infrastructure', 'longitude', 'galleries']
