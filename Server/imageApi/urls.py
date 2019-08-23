from django.urls import path
from . import views

urlpatterns = [
    path('', views.ImageViewSet.as_view(), name='upload'),
]