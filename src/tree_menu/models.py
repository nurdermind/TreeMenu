from django.db import models
from django.urls import reverse


class Menu(models.Model):
    name = models.CharField(max_length=255, verbose_name='Имя меню')

    parent = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True, related_name='children')
    url = models.CharField(max_length=255)
    title = models.CharField(max_length=255)

    def __str__(self):
        return f"{self.name}"

    def get_absolute_url(self):
        try:
            return reverse(self.url)
        except:
            return self.url
