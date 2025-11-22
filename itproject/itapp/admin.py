from django.contrib import admin
from .models import *
# Register your models here.
admin.site.register(TeamLead)
admin.site.register(Developer)
admin.site.register(Project)
admin.site.register(AssignTeamLead)
admin.site.register(CustomUser)