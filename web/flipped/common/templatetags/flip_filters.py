from django import template

register = template.Library()

@register.filter(name="heb_date")
def heb_date(dt):
    return "HEB" + unicode(dt)





