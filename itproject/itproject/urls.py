"""itproject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from itapp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name='index'),
    path('teamlead_reg', views.teamlead_reg, name='teamlead_reg'),    
    path('developer_reg', views.developer_reg, name='developer_reg'),
    path('log_in', views.log_in, name='log_in'),

    path('about_us', views.about_us, name='about_us'),

    path('adminHome', views.adminHome, name='adminHome'),
    path('adminTeamLead', views.adminTeamLead, name='adminTeamLead'),
    path('adminDeveloper', views.adminDeveloper, name='adminDeveloper'),
    path('admChangeUserType', views.admChangeUserType, name='admChangeUserType'),
    path('adm_app_user', views.adm_app_user, name='adm_app_user'),
    path('adm_app_tmuser', views.adm_app_tmuser, name='adm_app_tmuser'),
    path('adminAddProject', views.adminAddProject, name='adminAddProject'),
    path('adminViewProject', views.adminViewProject, name='adminViewProject'),
    path('adminAssignProject', views.adminAssignProject, name='adminAssignProject'),
    path('adminViewAssPrj', views.adminViewAssPrj, name='adminViewAssPrj'),

    path('clear-notifications/', views.clear_notifications, name='clear_notifications'),
    path('clear_devnotifications/', views.clear_devnotifications, name='clear_devnotifications'),
    path('get_unseen_count', views.get_unseen_count, name='get_unseen_count'),
    path('get_unseen_dcount', views.get_unseen_dcount, name='get_unseen_dcount'),
    path('pending', views.pending, name='pending'),
    path('pendingTl', views.pendingTl, name='pendingTl'),
    path('pendingDev', views.pendingDev, name='pendingDev'),

    path('adminViewassignment', views.adminViewassignment, name='adminViewassignment'),
    path('adminViewProgress', views.adminViewProgress, name='adminViewProgress'),
    path('adminProjectComplete', views.adminProjectComplete, name='adminProjectComplete'),
    path('adminDeleteProject', views.adminDeleteProject, name='adminDeleteProject'),
    path('adminEditProject', views.adminEditProject, name='adminEditProject'),
    path('adminViewWorkProgress', views.adminViewWorkProgress, name='adminViewWorkProgress'),
    path('adminVWprogress', views.adminVWprogress, name='adminVWprogress'),
    path('adminVWDevprogress', views.adminVWDevprogress, name='adminVWDevprogress'),
    path('adminTeam', views.adminTeam, name='adminTeam'),
    path('adminAddTl', views.adminAddTl, name='adminAddTl'),
    path('adminAddDev', views.adminAddDev, name='adminAddDev'),

    path('teamLeadHome', views.teamLeadHome, name='teamLeadHome'),
    path('teamNotifications', views.teamNotifications, name='teamNotifications'),
    path('tlNotiClose', views.tlNotiClose, name='tlNotiClose'),
    path('teamProjects', views.teamProjects, name='teamProjects'),
    path('tlUpdate', views.tlUpdate, name='tlUpdate'),
    path('tlHistory', views.tlHistory, name='tlHistory'),
    path('teamAssign', views.teamAssign, name='teamAssign'),
    path('teamViewAssign', views.teamViewAssign, name='teamViewAssign'),
    path('teamViewProgress', views.teamViewProgress, name='teamViewProgress'),
    path('teamProfile', views.teamProfile, name='teamProfile'),
    path('teamUpdatePassword', views.teamUpdatePassword, name='teamUpdatePassword'),
    path('teamViewProgress', views.teamViewProgress, name='teamViewProgress'),

    path('developerHome', views.developerHome, name='developerHome'),
    path('devNotifications', views.devNotifications, name='devNotifications'),
    path('DevNotiClose', views.DevNotiClose, name='DevNotiClose'),
    path('devProjects', views.devProjects, name='devProjects'),
    path('devHistory', views.devHistory, name='devHistory'),
    path('devUpdate', views.devUpdate, name='devUpdate'),
    path('devProfile', views.devProfile, name='devProfile'),
    path('devUpdatePassword', views.devUpdatePassword, name='devUpdatePassword'),

]


