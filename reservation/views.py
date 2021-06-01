from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import pagination
from rest_framework import viewsets
from rest_framework.filters import SearchFilter
from rest_framework.permissions import IsAuthenticated
from .serializers import *


class MyPagination(pagination.PageNumberPagination):
    page_size = 15


# list get API
class ReservationsView(viewsets.generics.ListAPIView):
    serializer_class = ReservationSerializer
    filter_backends = [SearchFilter, DjangoFilterBackend]
    search_fields = ['id', 'sport_area__title', 'sport_area__text', ]
    filterset_fields = ['user', 'admin', 'sport_area', 'status']

    def get_queryset(self):
        queryset = Reservation.objects.all()
        return queryset


# create post API
class ReservationCreateView(viewsets.generics.CreateAPIView):
    serializer_class = CreateReservationSerializer
    permission_classes = [IsAuthenticated]
