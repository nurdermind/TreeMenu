from django.urls import path, re_path
from . import views

urlpatterns = [
    path('', views.index, name='main-page'),
    path('skills/', views.skills, name='skills'),
    re_path('^.+$', views.skills, name='blank_page'),
]
