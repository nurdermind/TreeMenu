from django.contrib import admin

from .models import Menu


# Register your models here.
@admin.register(Menu)
class MenuAdmin(admin.ModelAdmin):
    list_display = ['title', 'name', 'url']
