from django.db import models
from django.urls import reverse


class Menu(models.Model):
    name = models.CharField(max_length=255)

    parent = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True, related_name='children')
    url = models.CharField(max_length=255, help_text='Path or named url')
    title = models.CharField(max_length=255)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        try:
            return reverse(self.url)
        except:
            return self.url

    class Meta:
        ordering = ('parent__pk', 'pk')
