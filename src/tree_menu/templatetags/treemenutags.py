from django import template
from django.utils.safestring import mark_safe

from ..models import Menu, MenuLink

register = template.Library()


@register.simple_tag(takes_context=True)
def draw_menu(context, menu_name):
    current_path = context.request.path
    links = list(MenuLink.objects.select_related('menu').select_related('parent').filter(menu__name=menu_name))
