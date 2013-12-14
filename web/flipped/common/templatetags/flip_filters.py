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






