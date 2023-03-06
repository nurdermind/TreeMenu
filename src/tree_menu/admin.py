from django.contrib import admin
from django.urls import reverse
from django.utils.html import format_html

from .models import Menu


class ChildMenuInline(admin.TabularInline):
    model = Menu
    extra = 0
    verbose_name_plural = 'Child Menus'
    readonly_fields = ['edit_link']

    def edit_link(self, obj):
        if obj.id:
            url = reverse('admin:tree_menu_menu_change', args=[obj.id])
            return format_html('<a href="{}">EDIT</a>', url)
        return '-'

    # edit_link.short_description = 'Edit Child Menu'


class MenuAdmin(admin.ModelAdmin):
    inlines = [ChildMenuInline]
    list_display = ['title', 'name', 'url']


admin.site.register(Menu, MenuAdmin)
