from django.urls import include, path

from .views import *

urlpatterns = [
    path("fcm/create", FcmCreateView.as_view(), name="fcm-create"),
    path("profile/detail/<int:pk>", UserDetailView.as_view(), name="detail"),
]
