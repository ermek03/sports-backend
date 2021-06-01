from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import pagination
from rest_framework import viewsets
from rest_framework.filters import SearchFilter
from rest_framework.response import Response

from .filter import SportAreaFilter
from .serializers import *


class CustomPagination(pagination.PageNumberPagination):
    page_size = 15
    page_size_query_param = 'per_page'

    def get_paginated_response(self, data):
        return Response({
            'next': self.page.next_page_number() if self.page.has_next() else None,
            'previous': self.page.previous_page_number() if self.page.has_previous() else None,
            'count': self.page.paginator.count,
            'page_size': self.page_size,
            'num_pages': self.page.paginator.num_pages,
            'results': data,
        })


class MyPagination(pagination.PageNumberPagination):
    page_size = 15


# list get API
class CategoriesView(viewsets.generics.ListAPIView):
    serializer_class = CategorySerializer
    queryset = Category.objects.all().order_by('numeration')


class TypesView(viewsets.generics.ListAPIView):
    serializer_class = TypeSerializer
    filter_backends = [SearchFilter, DjangoFilterBackend]
    search_fields = ['id', 'title', 'category__title']
    filterset_fields = ['category']

    def get_queryset(self):
        queryset = Type.objects.all()
        return queryset


class InfrastructuresView(viewsets.generics.ListAPIView):
    serializer_class = InfrastructureSerializer
    filter_backends = [SearchFilter, DjangoFilterBackend]
    search_fields = ['id', 'title', 'category__title']
    filterset_fields = ['category']

    def get_queryset(self):
        queryset = Infrastructure.objects.all()
        return queryset


class SportsAreaView(viewsets.generics.ListAPIView):
    serializer_class = SportsAreaSerializer
    pagination_class = CustomPagination
    queryset = SportsArea.objects.all()
    filter_backends = [SearchFilter, DjangoFilterBackend]
    search_fields = ['id', 'title', 'text', 'address', 'category__title']
    filterset_class = SportAreaFilter
    ordering = ['-create_at']

    def get_queryset(self):
        queryset = SportsArea.objects.filter(is_active=True).distinct()
        return queryset


class SportsAreaForMapView(viewsets.generics.ListAPIView):
    serializer_class = SportsAreaForMapSerializer
    queryset = SportsArea.objects.all()
    filter_backends = [SearchFilter, DjangoFilterBackend]
    search_fields = ['id', 'title', 'text', 'address', 'category__title']
    filterset_class = SportAreaFilter
    ordering = ['-create_at']

    def get_queryset(self):
        queryset = SportsArea.objects.filter(is_active=True).distinct()
        return queryset


class SportsAreaDetailView(viewsets.generics.RetrieveAPIView):
    queryset = SportsArea.objects.filter(is_active=True)
    serializer_class = SportsAreaDetailSerializer
    lookup_field = 'id'
