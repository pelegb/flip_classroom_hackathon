# -*- coding: utf-8 -*-
import re

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
def get_range_to(i, rest):
    return range(i, rest)


ISO8601_PERIOD_REGEX = re.compile(
    r"^(?P<sign>[+-])?"
    r"P(?!\b)"
    r"(?P<years>[0-9]+([,.][0-9]+)?Y)?"
    r"(?P<months>[0-9]+([,.][0-9]+)?M)?"
    r"(?P<weeks>[0-9]+([,.][0-9]+)?W)?"
    r"(?P<days>[0-9]+([,.][0-9]+)?D)?"
    r"((?P<separator>T)(?P<hours>[0-9]+([,.][0-9]+)?H)?"
    r"(?P<minutes>[0-9]+([,.][0-9]+)?M)?"
    r"(?P<seconds>[0-9]+([,.][0-9]+)?S)?)?$")


@register.filter(name="duration")
def duration(duration_string):
    m = ISO8601_PERIOD_REGEX.match(duration_string)
    if m:
        ret_val = ''
        for unit in ('hours', 'minutes', 'seconds'):
            if m.group(unit):
                if unit == 'seconds' and not ret_val:
                    ret_val = '00:'
                ret_val += m.group(unit)[:-1].rjust(2, '0') + ':'
            elif ret_val:
                ret_val += '00:'
        return ret_val[:-1]
    else:
        return ''
