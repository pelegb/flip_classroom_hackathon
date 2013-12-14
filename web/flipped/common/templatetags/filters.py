from django import template

register = template.Library()

@register.filter(name="heb_data")
def week_day(dt):
    return dt.day


