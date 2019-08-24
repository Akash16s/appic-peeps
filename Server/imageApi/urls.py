from django.urls import path
from . import views

urlpatterns = [
    path("", views.imageCollect.as_view(), name = "imageCollect"),
]