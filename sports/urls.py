"""jarnama URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls.static import static
from django.conf.urls import url
from django.contrib import admin
from django.shortcuts import redirect
from django.urls import path, include

# for swagger
from django.views.generic import TemplateView
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

schema_view = get_schema_view(
    openapi.Info(
        title="Sports.kg api",
        default_version='v1',
        description="For sports.kg rest api",
        terms_of_service="https://www.google.com/policies/terms/",
        contact=openapi.Contact(email="zyntemirov@gmail.com"),
        license=openapi.License(name="BSD License"),
    ),
    public=True,
    permission_classes=(permissions.IsAuthenticated,),
)


class IndexView(TemplateView):
    def get(self, request, *args, **kwargs):
        return redirect('/admin')


urlpatterns = [
  path('', IndexView.as_view(), name='index'),
  path('admin/', admin.site.urls),
  path('auth/', include('djoser.urls')),
  path('auth/', include('djoser.urls.jwt')),
  path('api/', include('accounts.urls')),
  path('api/', include('banner.urls')),
  path('api/', include('sports_area.urls')),
  path('api/', include('reservation.urls')),
  path('api/', include('news.urls')),
  url(r'^chaining/', include('smart_selects.urls'), name='chaining'),
  path('docs', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
  url(r'^swagger(?P<format>\.json|\.yaml)$', schema_view.without_ui(cache_timeout=0), name='schema-json'),
  url(r'^swagger/$', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
  url(r'^redoc/$', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
