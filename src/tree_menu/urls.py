from django.urls import path, re_path
from . import views

urlpatterns = [
    path('', views.index, name='main-page'),
    re_path('^.+$', views.index, name='main-page')
]
