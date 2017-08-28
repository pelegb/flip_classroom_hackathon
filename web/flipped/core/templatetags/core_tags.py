from django.contrib.admin.templatetags.admin_modify import submit_row
from django.template.loader import get_template
from django import template

# this would be the path to your "submit_line.html"
t = get_template('admin/core/candidatevideopage/submit_line.html')
register = template.Library()
register.inclusion_tag(t, takes_context=True)(submit_row)