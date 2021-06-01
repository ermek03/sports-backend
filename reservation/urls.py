from django.urls import path
from .views import *

urlpatterns = [
    path('reservations/', ReservationsView.as_view()),
    path('reservations/create', ReservationCreateView.as_view()),
]
