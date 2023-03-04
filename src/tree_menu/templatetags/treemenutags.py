from django import template
from django.utils.safestring import mark_safe

from ..models import Menu

register = template.Library()


@register.inclusion_tag('tree_menu/menu.html', takes_context=True)
def draw_menu(context, menu_name):
    current_path = context.request.path
    menus_list = list(Menu.objects.select_related('parent').order_by('parent__id', 'id'))

    nodes = []
    if menus_list:
        nodes = build_menu_tree(menu_name, menus_list, current_path)
    return {'nodes': nodes}


def build_menu_tree(menu_name, menu_list, current_path):
    # Создаем словарь, где ключи - это id объектов, а значения - это сами объекты
    menu_dict = {menu.id: menu for menu in menu_list}

    # Создаем словарь, где ключи - это id объектов, а значения - это списки id дочерних объектов
    children_dict = {}
    for menu in menu_list:
        if menu.parent_id:
            children_dict.setdefault(menu.parent_id, []).append(menu.id)

    def is_expanded_node(node, current_path):
        is_expanded = node['url'] == current_path
        if 'children' in node and not is_expanded:
            return any([is_expanded_node(n, current_path) for n in node['children']])
        return is_expanded

    # Рекурсивно строим древовидный словарь
    def build_node(menu_id):
        menu = menu_dict[menu_id]
        node = {
            'name': menu.name,
            'url': menu.get_absolute_url(),
            'title': menu.title,
            'is_expanded': menu.get_absolute_url() == current_path,
            'disabled': menu.get_absolute_url() == current_path
        }
        if menu_id in children_dict:
            node['children'] = [build_node(child_id) for child_id in children_dict[menu_id]]
            if node['children'] and not node['is_expanded']:
                node['is_expanded'] = any([is_expanded_node(n, current_path) for n in node['children']])
        return node

    # Находим корневые элементы и строим древовидный словарь
    roots = []
    for menu in menu_list:
        if menu.name == menu_name:
            roots.append(menu)
    return [build_node(root.id) for root in roots]
