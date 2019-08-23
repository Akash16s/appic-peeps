from rest_framework.parsers import FileUploadParser
from rest_framework.response import Response
import json
from django.http import HttpResponse
from rest_framework.generics import ListAPIView
from .models import File
from .serializers import FileSerializer


class ImageViewSet(ListAPIView):
    queryset = File.objects.all()
    serializer_class = FileSerializer

    def post(self, request, *args, **kwargs):
        file = request.data['file']
        image = File.objects.create(image=file)
        return HttpResponse(json.dumps({'message': "Uploaded"}), status=200)
