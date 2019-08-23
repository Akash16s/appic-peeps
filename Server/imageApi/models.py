from django.db import models


class File(models.Model):
    file = models.FileField(upload_to='photos/', max_length=254, blank=True, null=True)

    def __str__(self):
        return self.file.name
