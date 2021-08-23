from django import template

register = template.Library()


@register.filter(name='dep_list_filter')
def dep_list_filter(args):
    return args.object.filter(position_id=4)
