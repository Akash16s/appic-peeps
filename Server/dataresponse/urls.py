from django.urls import path
from . import views

urlpatterns = [
    path("", views.pushdata.as_view(), name = "pushdata"),
]