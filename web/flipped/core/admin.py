from django.contrib import admin
from django.db import models
from wysihtml5.widgets import Wysihtml5TextareaWidget
import core.models

class VideoPageAdmin(admin.ModelAdmin):
    formfield_overrides = {
        models.TextField: {'widget': Wysihtml5TextareaWidget},
    }

class TeachItemAdmin(admin.ModelAdmin):
    formfield_overrides = {
        models.TextField: {'widget': Wysihtml5TextareaWidget},
    }
    exclude = ('video_count_cache',)

class TeachTopicAdmin(admin.ModelAdmin):
    formfield_overrides = {
        models.TextField: {'widget': Wysihtml5TextareaWidget},
    }
    exclude = ('video_count_cache',)


admin.site.register(core.models.VideoPage,admin_class=VideoPageAdmin)
admin.site.register(core.models.TextualReview)
admin.site.register(core.models.RatingReview)
admin.site.register(core.models.TeachItem,admin_class=TeachItemAdmin)
admin.site.register(core.models.TeachTopic,admin_class=TeachTopicAdmin)
admin.site.register(core.models.Tag)
admin.site.register(core.models.TopicSuggestion)






