from rest_framework import serializers
from . models import user


class userSerializer(serializers.ModelSerializer):
    class Meta:
        model = user
        # field = ('firstname', 'lastname')
        fields = '__all__'
