from django.urls import path
from .views import *

urlpatterns = [
    path('sliders', SlidersView.as_view()),
    path('feedback', FeedbackView.as_view()),
]
