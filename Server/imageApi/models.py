from django.db import models
from datetime import datetime

class File(models.Model):
    link = models.CharField(max_length = 200, null= True)

    def __str__(self):
        return self.file

