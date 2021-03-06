from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from . models import BMI
from . serializers import dataSerializer


# Create your views here.
class pushdata(APIView):
    def get(self, request):
        user1 = user.objects.all()
        serializer = userSerializer(user1, many=True)
        return Response(serializer.data)
    
    def post(self,request):
        serializer = userSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
