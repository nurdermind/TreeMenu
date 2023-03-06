from ..models import Menu


class MenuTreeBuilder:
    def __init__(self, menu_name, current_path):
        self.menu_name = menu_name
        self.menu_list = Menu.objects.select_related('parent').order_by('parent__id', 'id')
        self.current_path = current_path
        self.menu_dict = {}
        self.children_dict = {}
        self.roots = []

    def build(self):
        self._build_menu_dict()
        self._build_children_dict()
        self._find_roots()
        return [self._build_node(root.id) for root in self.roots]

    def _is_expanded_node(self, node, current_path):
        is_expanded = node['url'] == current_path
        if 'children' in node and not is_expanded:
            return any([self._is_expanded_node(n, current_path) for n in node['children']])
        return is_expanded

    def _build_menu_dict(self):
        self.menu_dict = {menu.id: menu for menu in self.menu_list}

    def _build_children_dict(self):
        for menu in self.menu_list:
            if menu.parent_id:
                self.children_dict.setdefault(menu.parent_id, []).append(menu.id)

    def _find_roots(self):
        for menu in self.menu_list:
            if menu.name == self.menu_name:
                self.roots.append(menu)

    def _build_node(self, menu_id):
        menu = self.menu_dict[menu_id]
        node = {
            'name': menu.name,
            'url': menu.get_absolute_url(),
            'title': menu.title,
            'is_expanded': menu.get_absolute_url() == self.current_path,
            'disabled': menu.get_absolute_url() == self.current_path
        }
        if menu_id in self.children_dict:
            node['children'] = [self._build_node(child_id) for child_id in self.children_dict[menu_id]]
            if node['children'] and not node['is_expanded']:
                node['is_expanded'] = any([self._is_expanded_node(n, self.current_path) for n in node['children']])
        return node
