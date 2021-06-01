from rest_framework import viewsets
from rest_framework import pagination
from .serializers import *
from .models import *


class MyPagination(pagination.PageNumberPagination):
    page_size = 15


# list get API
class SlidersView(viewsets.generics.ListAPIView):
    serializer_class = SliderSerializer
    queryset = Slider.objects.all().order_by('numeration')


class FeedbackView(viewsets.generics.ListCreateAPIView):
    serializer_class = FeedbackSerializer
    queryset = Feedback.objects.filter(is_active=True).order_by('-id')[:3]
