# -*- coding: utf-8 -*- 
from django import template

register = template.Library()

MONTHS = ['oops',
          'ינואר',
        'פברואר',
        'מרץ',
        'אפריל',
        'מאי',
        'יוני',
        'יולי',
        'אוגוסט',
        'ספטמבר',
        'אוקטובר',
        'נובמבר',
        'דצמבר',
     ]

@register.filter(name="heb_month")
def heb_month(month):
    return MONTHS[month]

@register.filter(name="range")
def get_range(i):
    return range(i)

@register.filter(name="range_to")
def get_range_to(i,rest):
    return range(i,rest)





