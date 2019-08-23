from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from . models import user
from . serializers import userSerializer

# Create your views here.
class maker(APIView):
    def get(self, request):
        user1 = employees.objects.all()
        serializer = employeesSerializer(user1, many=True)
        return Response(serializer.data)
    
    def post(self,request):
        return