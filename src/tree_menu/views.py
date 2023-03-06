from django.shortcuts import render
from .models import Menu


# Create your views here.
def index(request):
    menu_names = set(Menu.objects.filter(parent__isnull=True).values_list('name', flat=True))
    return render(request, 'tree_menu/index.html', {'menu_names': menu_names})


def blank_page(request):
    return render(request, 'tree_menu/skills.html')


def skills(request):
    return render(request, 'tree_menu/skills.html')
