from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import datetime

# Create your models here.

class CustomUser(AbstractUser):
    usertype = models.CharField(blank=True,max_length=50)
    approve=models.CharField(max_length=20, default='Pending')

    def __str__(self):
        return self.username

class Developer(models.Model):
    name = models.CharField(max_length=100) 
    lname = models.CharField(max_length=100,null=True, blank=True) 
    username = models.CharField(max_length=100,null=True, blank=True) 
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=15)
    department = models.CharField(max_length=100)
    course_completed = models.CharField(max_length=200)
    address = models.TextField()
    certificate = models.FileField(upload_to='developer_proofs/', null=True, blank=True)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    team_lead = models.ForeignKey('TeamLead', on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.name

class TeamLead(models.Model):
    name = models.CharField(max_length=100)
    lname = models.CharField(max_length=100,null=True, blank=True) 
    username = models.CharField(max_length=100,null=True, blank=True) 
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=15)
    department = models.CharField(max_length=100)
    course_completed = models.CharField(max_length=200)
    address = models.TextField()
    certificate = models.FileField(upload_to='teamlead_proofs/', null=True, blank=True)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class Project(models.Model):
    title = models.CharField(max_length=200)
    client_name = models.CharField(max_length=200)
    description = models.TextField()
    # requirements = models.TextField()
    start_date = models.DateField(null=True, blank=True)
    end_date = models.DateField(null=True, blank=True)
    # attachment = models.FileField(upload_to='project_attachments/', null=True, blank=True)
    # team_lead = models.ForeignKey(TeamLead, on_delete=models.CASCADE)
    status = models.CharField(max_length=50, default='Ongoing')

    def __str__(self):
        return self.title


class AssignTeamLead(models.Model):
    requirements = models.TextField()
    start_date = models.DateField(null=True, blank=True)
    end_date = models.DateField(null=True, blank=True)
    attachment = models.FileField(upload_to='project_attachments/', null=True, blank=True)
    project = models.ForeignKey(Project, on_delete=models.CASCADE)
    team_lead = models.ForeignKey(TeamLead, on_delete=models.CASCADE)
    assigned_date = models.DateField(auto_now_add=True)
    seen = models.BooleanField(default=False)
    clear=models.BooleanField(default=False)

    def __str__(self):
        return f"{self.project.title} - {self.team_lead.name}"

class Assignment(models.Model):
    project = models.ForeignKey(Project, on_delete=models.CASCADE)
    developer = models.ForeignKey(Developer, on_delete=models.CASCADE)
    module=models.CharField(max_length=200)
    attachment = models.FileField(upload_to='assignment_attachments/', null=True, blank=True)
    description = models.TextField()
    assigned_date = models.DateField(auto_now_add=True)
    team_lead = models.ForeignKey(TeamLead, on_delete=models.CASCADE,null=True, blank=True)
    status = models.CharField(max_length=50, default='Assigned')
    seen = models.BooleanField(default=False)
    start_date = models.DateField(null=True, blank=True)
    end_date = models.DateField(null=True, blank=True)
    clear=models.BooleanField(default=False)

    def __str__(self):
        return f"{self.project.title} - {self.developer.name}"

class AssignmentUpdate(models.Model):
    assignment = models.ForeignKey(Assignment, on_delete=models.CASCADE)
    progress_description = models.TextField()
    update_date = models.DateField(auto_now_add=True)
    attachment = models.FileField(upload_to='assignment_updates/', null=True, blank=True)

    def __str__(self):
        return f"Update for {self.assignment.project.title} by {self.assignment.developer.name}"


class AssignTLupdate(models.Model):
    assignment = models.ForeignKey(AssignTeamLead, on_delete=models.CASCADE)
    progress_description = models.TextField()
    update_date = models.DateField(auto_now_add=True)
    attachment = models.FileField(upload_to='assigntl_updates/', null=True, blank=True)

    def __str__(self):
        return f"Update for {self.assigntl.project.title} by {self.assigntl.team_lead.name}"