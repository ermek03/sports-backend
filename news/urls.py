from django.urls import path
from .views import *

urlpatterns = [
    path('news/category/<str:name>/<int:page>/', News.as_view()),
    path('news/detail/', NewsDetail.as_view()),
]
