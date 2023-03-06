from django import template
from django.utils.safestring import mark_safe

from ..models import Menu
from .menu_tree_builder import MenuTreeBuilder

register = template.Library()


@register.inclusion_tag('tree_menu/menu.html', takes_context=True)
def draw_menu(context, menu_name):
    current_path = context.request.path

    builder = MenuTreeBuilder(menu_name, current_path)
    menu_tree = builder.build()
    return {'menu_tree': menu_tree}

