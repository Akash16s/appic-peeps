from rest_framework.parsers import FileUploadParser
from rest_framework.response import Response
import json
from django.http import HttpResponse
from rest_framework.generics import ListAPIView
from .models import File, BMI
from .serializers import FileSerializer
import base64


def imageCollect(request):
    if request == "POST":
        request.files
        return
