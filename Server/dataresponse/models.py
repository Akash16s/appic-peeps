from django.db import models
from datetime import datetime

# Create your models here.
class BMI(models.Model):
    bmi = models.IntegerField()
    date = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.bmi

class ylinks(models.Model):
    ylinks1 = models.CharField(max_length = 200)
    ylinks2 = models.CharField(max_length = 200)
    ylinks3 = models.CharField(max_length = 200)
    ylinks4 = models.CharField(max_length = 200)
    ylinks5 = models.CharField(max_length = 200)
    ylinks6 = models.CharField(max_length = 200)
    ylinks7 = models.CharField(max_length = 200)
    ylinks8 = models.CharField(max_length = 200)
    ylinks9 = models.CharField(max_length = 200)
    ylinks10 = models.CharField(max_length = 200)