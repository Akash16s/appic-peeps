from django.urls import path
from . import views

urlpatterns = [
    path("", views.imageCollect, name = "imageCollect"),
]