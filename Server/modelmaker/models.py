from django.db import models

# Create your models here.
class user(models.Model):
    firstname = models.CharField(max_length = 30)
    lastname = models.CharField(max_length = 30)
    age = models.IntegerField()
    sex = models.CharField(max_length = 1)
    weightcurrent = models.IntegerField()
    bmicurrent = models.IntegerField(blank=True)


    def __str__(self):
        return self.firstname