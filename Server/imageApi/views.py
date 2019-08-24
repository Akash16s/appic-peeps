from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from . models import File
from . serializers import FileSerializer
from PIL import Image
import requests
import cv2
from io import BytesIO
from ml.check_for_bmi import check
from threading import Thread


class imageCollect(APIView):
    def post(self,request):
        s =  FileSerializer(data = request.data)
        if s.is_valid():
                s.save()
                response = requests.get(request.data['link'])
                Thread1 = Thread(target=check,args=(request.data['link'],))
                # checkBmi.check(request.data['link'])
                Thread1.start()
                Thread1.join()
                return Response(request.data, status=status.HTTP_201_CREATED)
        return Response(s.error, status = status.HTTP_400_BAD_REQUEST)
