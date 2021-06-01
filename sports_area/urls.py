from django.urls import path
from .views import *

urlpatterns = [
    path('categories/', CategoriesView.as_view()),
    path('types/', TypesView.as_view()),
    path('infrastructures/', InfrastructuresView.as_view()),
    path('sports_areas/', SportsAreaView.as_view()),
    path('sports_areas/for_map/', SportsAreaForMapView.as_view()),
    path('sports_area/detail/<int:id>/', SportsAreaDetailView.as_view()),
]
