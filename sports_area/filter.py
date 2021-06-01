import django_filters

from sports_area.models import SportsArea


class SportAreaFilter(django_filters.FilterSet):
    type = django_filters.filterset.BaseInFilter(field_name='type', lookup_expr='in')
    price_min = django_filters.filterset.NumberFilter(field_name='price', lookup_expr='gte')
    price_max = django_filters.filterset.NumberFilter(field_name='price', lookup_expr='lte')
    infrastructure = django_filters.filterset.BaseInFilter(field_name='infrastructure', lookup_expr='in')

    class Meta:
        model = SportsArea
        fields = ['category', 'admin']
