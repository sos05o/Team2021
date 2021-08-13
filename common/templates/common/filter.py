from django import template

register = template.Library()


@register.filter()
def dep_list_filter(args):
    users = args.filter(position_id=4)
    for array in users:
        return array.last_name, array.first_name
    return '該当者なし'
