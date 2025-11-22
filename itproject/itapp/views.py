from urllib import request
from django.shortcuts import render,redirect
from django.contrib.auth.models import User
# from django.contrib.auth import authenticate
from django.contrib.auth import authenticate, login, logout

from django.contrib import messages
from django.db.models import Q
from .models import *
from django.core.mail import send_mail
from django.utils.crypto import get_random_string
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required


# Create your views here.

def index(request):
    return render(request, 'index.html')

def teamlead_reg(request):
    msg = ''
    if request.method == 'POST':
        name = request.POST['name']
        lname = request.POST['lname']
        username = request.POST['username']
        email = request.POST['email']
        phone = request.POST['phone']
        department = request.POST['department']
        course = request.POST['course']
        certificate = request.FILES['certificate']
        address = request.POST['address']
        passw = get_random_string(length=6, allowed_chars='1234567890')
        if CustomUser.objects.filter(username=username).exists():
            messages.info(request,'Username already registred..')
            return redirect("/teamlead_reg")
        elif Developer.objects.filter(Q(phone=phone)|Q(email=email)).exists() or TeamLead.objects.filter(Q(phone=phone)|Q(email=email)).exists():
            messages.info(request,'Phone number/ email already registred..')
            return redirect("/teamlead_reg")
        else:
            usr = CustomUser.objects.create_user(
                username=username, password=passw, is_active=0, usertype='TeamLead')
            usr.save()
            par = TeamLead.objects.create(
                name=name+" "+lname, lname=lname, username=username, email=email, phone=phone, department=department, course_completed=course, address=address, certificate=certificate, user=usr)
            par.save()
            messages.info(request,"Regisgtered Successfully.. Password sent to your email..")
            subject = "Your Password for Login"
            message = f"Hello {name}, your password is: {passw}"
            send_mail(subject, message, 'teamlccalwaye@gmail.com', [email])
            request.session['id'] = email
            return redirect('/teamlead_reg')


            

    else:
        return render(request, 'teamlead_reg.html', {"msg": msg})

def developer_reg(request):
    msg = ''
    if request.method == 'POST':
        name = request.POST['name']
        lname = request.POST['lname']
        username = request.POST['username']
        email = request.POST['email']
        phone = request.POST['phone']
        department = request.POST['department']
        course = request.POST['course']
        certificate = request.FILES['certificate']
        address = request.POST['address']
        passw = get_random_string(length=6, allowed_chars='1234567890')
        if CustomUser.objects.filter(username=username).exists():
            messages.info(request,'Username already registred..')
            return redirect("/developer_reg")
        elif Developer.objects.filter(Q(phone=phone)|Q(email=email)).exists() or TeamLead.objects.filter(Q(phone=phone)|Q(email=email)).exists():
            messages.info(request,'Phone number/ email already registred..')
            return redirect("/developer_reg")
        else:
            usr = CustomUser.objects.create_user(
                username=username, password=passw, is_active=0, usertype='Developer')
            usr.save()
            par = Developer.objects.create(
                name=name+" "+lname, lname=lname, username=username, email=email, phone=phone, department=department, course_completed=course, address=address, certificate=certificate, user=usr)
            par.save()
            messages.info(request,"Regisgtered Successfully.. Password sent to your email..")
            subject = "Your Password for Login"
            message = f"Hello {name}, your password is: {passw}"
            send_mail(subject, message, 'teamlccalwaye@gmail.com', [email])
            request.session['id'] = email
            return redirect('/developer_reg')
    else:
        return render(request, 'developer_reg.html', {"msg": msg})





def log_in(request):
    msg = ""
    if request.POST:
        email = request.POST['email']
        password = request.POST['password']
        auth = authenticate(username=email, password=password)

        if auth is not None:
            # ✅ Log the user in — important!
            login(request, auth)

            if auth.is_superuser:
                return redirect("/adminHome")
            elif auth.usertype == 'TeamLead':
                st = TeamLead.objects.get(username=email)
                request.session['id'] = st.id
                return redirect("/teamLeadHome")
            elif auth.usertype == 'Developer':
                st = Developer.objects.get(username=email)
                request.session['id'] = st.id
                return redirect("/developerHome")
        else:
            msg = "Invalid username/password!"
            return render(request, "login.html", {"msg": msg})
    else:
        return render(request, "login.html", {"msg": msg})





def about_us(request):
    return render(request, 'about_us.html')



@login_required(login_url='/log_in')
def adminHome(request):
    return render(request, 'adminHome.html')




def adminTeamLead(request):
    data = TeamLead.objects.filter(user__usertype='TeamLead').order_by("-id")
    return render(request, 'adminTeamLead.html', {"data": data})


def pending(request):
    count = CustomUser.objects.filter(approve='Pending').exclude(username='admin').count()
    return JsonResponse({'count': count})

def pendingTl(request):
    count = CustomUser.objects.filter(approve='Pending',usertype='TeamLead').count()
    return JsonResponse({'count': count})

def pendingDev(request):
    count = CustomUser.objects.filter(approve='Pending',usertype='Developer').count()
    return JsonResponse({'count': count})

def adminDeveloper(request):
    data = Developer.objects.filter(user__usertype='Developer').order_by("-id")
    return render(request, 'adminDeveloper.html', {"data": data})

def adminTeam(request):
    data = Developer.objects.filter(user__is_active=True).order_by("-id")
    tl=TeamLead.objects.filter(user__is_active=True).order_by("-id")

    if request.method=="POST":
        tl=request.POST['team_lead']
        dev=request.POST['developer_id']
        teamlead=TeamLead.objects.get(id=tl)
        dev=Developer.objects.get(id=dev)
        dev.team_lead=teamlead
        dev.save()

    return render(request, 'adminTeam.html', {"data": data,"tl":tl})


def admChangeUserType(request):
    user_id = request.GET.get('id')
    new_type = request.GET.get('type')

    user = CustomUser.objects.get(id=user_id)
    user.usertype = new_type  # Update usertype only, NOT id
    user.save()

    # ✅ If promoting Developer → TeamLead
    if new_type == "TeamLead":
        dev = Developer.objects.get(user=user)

        # Create TeamLead record from Developer data
        TeamLead.objects.create(
            user=user,
            name=dev.name,
            email=dev.email,
            phone=dev.phone,
            department=dev.department,
            course_completed=dev.course_completed,
            address=dev.address,
            certificate=dev.certificate,
        )

        dev.delete()  # Optional: Remove from Developer table (clean migration)

        return redirect("/adminTeamLead")

    # ✅ If demoting TeamLead → Developer
    elif new_type == "Developer":
        tl = TeamLead.objects.get(user=user)

        Developer.objects.create(
            user=user,
            name=tl.name,
            email=tl.email,
            phone=tl.phone,
            department=tl.department,
            course_completed=tl.course_completed,
            address=tl.address,
            certificate=tl.certificate,
        )

        tl.delete()

        return redirect("/adminDeveloper")


def adm_app_user(request):
    id = request.GET['id']
    status = request.GET['status']
    data = CustomUser.objects.get(id=id)
    if status=='Approved':
        data.approve=status
        data.is_active = 1
    else:
        data.approve=status
        data.is_active = 0
    data.save()
    user=Developer.objects.get(user=data)
    name=user.name
    email=user.email
    if status=='Approved':
        subject = "Admin Approved, Your Account is Activated"
        message = f"Hello {name}, your Account has been activated. You can now log in."
        send_mail(subject, message, 'teamlccalwaye@gmail.com', [email])
        request.session['id'] = email
        return redirect("/adminDeveloper")
    elif status=='Rejected':
        subject = "Admin Rejected, Your Account is Deactivated"
        message = f"Hello {name}, your Account has been deactivated by Admin."
        send_mail(subject, message, 'teamlccalwaye@gmail.com', [email])
        request.session['id'] = email
        return redirect("/adminDeveloper")
    else:
        return redirect("/adminDeveloper")

def adm_app_tmuser(request):
    id = request.GET['id']
    status = request.GET['status']
    data = CustomUser.objects.get(id=id)
    if status=='Approved':
        data.approve=status
        data.is_active = 1
    else:
        data.approve=status
        data.is_active = 0
    data.save()
    user=TeamLead.objects.get(user=data)
    name=user.name
    email=user.email
    if status=='Approved':
        subject = "Admin Approved, Your Account is Activated"
        message = f"Hello {name}, your Account has been activated. You can now log in."
        send_mail(subject, message, 'teamlccalwaye@gmail.com', [email])
        request.session['id'] = email
        return redirect("/adminTeamLead")
    elif status=='Rejected':
        subject = "Admin Rejected, Your Account is Deactivated"
        message = f"Hello {name}, your Account has been deactivated by Admin."
        send_mail(subject, message, 'teamlccalwaye@gmail.com', [email])
        request.session['id'] = email
        return redirect("/adminTeamLead")
    else:
        return redirect("/adminTeamLead")

def adminViewassignment(request):
    id=request.GET['id']
    project=Project.objects.get(id=id)
    assignments=Assignment.objects.filter(project=project).order_by("-id")
    return render(request, 'adminViewassignment.html', {"assignments": assignments, "project": project})

def adminViewProgress(request):
    id=request.GET['id']
    data=AssignmentUpdate.objects.filter(assignment=id).order_by("-id")
    return render(request, 'adminViewProgress.html', {"data": data})

def adminProjectComplete(request):
    id=request.GET['id']
    project=Project.objects.get(id=id)
    project.status='Completed'
    project.save()
    return redirect('/adminAddProject')

def adminAddProject(request):
    team_leads = TeamLead.objects.filter(user__is_active=True).order_by("-id")
    projects = Project.objects.all().order_by("-id")  # Fetch all projects

    if request.method == "POST":
        title = request.POST['title']
        client_name = request.POST['client']
        description = request.POST['description']
        # requirements = request.POST['requirements']
        start_date = request.POST['start_date']
        end_date = request.POST['end_date']
        # attachment = request.FILES.get('attachement')  # ✅ Match template name
        # lead_id = request.POST['lead']

        # team_lead = TeamLead.objects.get(id=lead_id)

        Project.objects.create(
            title=title,
            client_name=client_name,
            description=description,
            # requirements=requirements,
            start_date=start_date,
            end_date=end_date,
            # attachment=attachment,
            # team_lead=team_lead
        )

        messages.success(request, "Project Added Successfully!")
        return redirect('/adminAddProject')

    return render(request, 'adminAddProject.html', {
        "team_leads": team_leads,
        "projects": projects
    })

def adminViewProject(request):
    team_leads = TeamLead.objects.filter(user__is_active=True).order_by("-id")
    projects = Project.objects.all().order_by("-id")  # Fetch all projects
    return render(request, 'adminViewProject.html',{
        "team_leads": team_leads,
        "projects": projects
    })

def adminDeleteProject(request):
    id=request.GET['id']
    project=Project.objects.get(id=id)
    project.delete()
    messages.info(request,"Project Deleted Successfully!")
    return redirect('/adminViewProject')

# def adminEditProject(request):
    # id=request.GET['id']
    # project=Project.objects.get(id=id)
    # team_leads = TeamLead.objects.filter(user__is_active=True).order_by("-id")
    # if request.method=="POST":
    #     title=request.POST['title']
    #     client_name=request.POST['client']
    #     description=request.POST['description']
    #     requirements=request.POST['requirements']
    #     start_date=request.POST['start_date']
    #     end_date=request.POST['end_date']
    #     attachment=request.FILES.get('attachement')
    #     lead_id=request.POST['lead']
    #     team_lead=TeamLead.objects.get(id=lead_id)
    #     Project.objects.filter(id=id).update(
    #         title=title,
    #         client_name=client_name,
    #         description=description,
    #         requirements=requirements,
    #         start_date=start_date,
    #         end_date=end_date,
    #         attachment=attachment,
    #         team_lead=team_lead
    #     )
    #     messages.info(request,"Project Updated Successfully..")
    #     return redirect('/adminAddProject')
    # return render(request, 'adminEditProject.html', {"project": [project], "team_leads": team_leads})


def adminEditProject(request):
    id = request.GET['id']
    project = Project.objects.get(id=id)
    team_leads = TeamLead.objects.filter(user__is_active=True).order_by("-id")

    if request.method == "POST":
        title = request.POST['title']
        client_name = request.POST['client']
        description = request.POST['description']
        # requirements = request.POST['requirements']
        start_date = request.POST['start_date']
        end_date = request.POST['end_date']
        # attachment = request.FILES.get('attachement')  # New file if uploaded
        # lead_id = request.POST['lead']
        # team_lead = TeamLead.objects.get(id=lead_id)

        # Update fields
        project.title = title
        project.client_name = client_name
        project.description = description
        # project.requirements = requirements
        project.start_date = start_date
        project.end_date = end_date
        # project.team_lead = team_lead

        # Only update attachment if a new file is uploaded
        # if attachment:
        #     project.attachment = attachment

        project.save()  # ✅ Save changes

        messages.info(request, "Project Updated Successfully..")
        return redirect('/adminViewProject')

    return render(request, 'adminEditProject.html', {
        "project": [project],
        "team_leads": team_leads
    })

def adminAssignProject(request):
    team_leads = TeamLead.objects.filter(user__is_active=True).order_by("-id")
    projects = Project.objects.all().order_by("-id")  # Fetch all projects
    assign=AssignTeamLead.objects.all().order_by("-id")

    if request.method == "POST":
        project = request.POST['project']
        requirements = request.POST['requirements']
        start_date = request.POST['start_date']
        end_date = request.POST['end_date']
        attachment = request.FILES.get('attachement')  # ✅ Match template name
        lead_id = request.POST['lead']

        project = Project.objects.get(id=project)
        team_lead = TeamLead.objects.get(id=lead_id)

        AssignTeamLead.objects.create(
            requirements=requirements,
            start_date=start_date,
            end_date=end_date,
            attachment=attachment,
            team_lead=team_lead,
            project=project
        )

        messages.success(request, "Project Assigned Successfully!")
        return redirect('/adminAssignProject')

    return render(request, 'adminAssignProject.html', {
        "team_leads": team_leads,
        "projects": projects,
        "assign": assign
    })

def adminViewAssPrj(request):
#     team_leads = TeamLead.objects.filter(user__is_active=True).order_by("-id")
#     projects = Project.objects.all().order_by("-id")  # Fetch all projects
    assign=AssignTeamLead.objects.all().order_by("-id")

    
    return render(request, 'adminViewAssPrj.html', {
        # "team_leads": team_leads,
        # "projects": projects,
        "assign": assign
    })





def adminViewWorkProgress(request):
    projects = Project.objects.all().order_by("-id")   
    return render(request, 'adminViewWorkProgress.html', {"projects": projects})

def adminVWprogress(request):
    id=request.GET['id']
    project = Project.objects.get(id=id)
    # devU=AssignmentUpdate.objects.filter(assignment__project=project).order_by("-id")
    tlU=AssignTLupdate.objects.filter(assignment__project=project).order_by("-id")
    return render(request, 'adminVWprogress.html', {"projects": [project], "tlU": tlU})

def adminVWDevprogress(request):
    id=request.GET['id']
    project = Project.objects.get(id=id) 
    devU=AssignmentUpdate.objects.filter(assignment__project=project).order_by("-id")
    return render(request, 'adminVWDevprogress.html', {"projects": [project], "devU": devU})

def adminAddTl(request):
    msg = ''
    if request.method == 'POST':
        name = request.POST['name']
        lname = request.POST['lname']
        username = request.POST['username']
        email = request.POST['email']
        phone = request.POST['phone']
        department = request.POST['department']
        course = request.POST['course']
        certificate = request.FILES['certificate']
        address = request.POST['address']
        passw = get_random_string(length=6, allowed_chars='1234567890')
        if CustomUser.objects.filter(username=username).exists():
            messages.info(request,'Username already registred..')
            return redirect("/adminAddTl")
        elif Developer.objects.filter(Q(phone=phone)|Q(email=email)).exists() or TeamLead.objects.filter(Q(phone=phone)|Q(email=email)).exists():
            messages.info(request,'Phone number/ email already registered..')
            return redirect("/adminAddTl")
        else:
            usr = CustomUser.objects.create_user(
                username=username, password=passw, is_active=0, usertype='TeamLead')
            usr.save()
            par = TeamLead.objects.create(
                name=name+" "+lname, lname=lname, username=username, email=email, phone=phone, department=department, course_completed=course, address=address, certificate=certificate, user=usr)
            par.save()
            messages.info(request,"Regisgtered Successfully.. Password sent to team lead email..")
            subject = "Your Password for Login"
            message = f"Hello {name}, your password is: {passw}"
            send_mail(subject, message, 'teamlccalwaye@gmail.com', [email])
            request.session['id'] = email
            return redirect('/adminAddTl')

    else:
        return render(request, 'adminAddTl.html', {"msg": msg})

def adminAddDev(request):
   msg=''
   if request.method == 'POST':
        name = request.POST['name']
        lname = request.POST['lname']
        username = request.POST['username']
        email = request.POST['email']
        phone = request.POST['phone']
        department = request.POST['department']
        course = request.POST['course']
        certificate = request.FILES['certificate']
        address = request.POST['address']
        passw = get_random_string(length=6, allowed_chars='1234567890')
        if CustomUser.objects.filter(username=username).exists():
            messages.info(request,'Username already registered..')
            return redirect("/adminAddDev")
        elif Developer.objects.filter(Q(phone=phone)|Q(email=email)).exists() or TeamLead.objects.filter(Q(phone=phone)|Q(email=email)).exists():
            messages.info(request,'Phone number/ email already registered..')
            return redirect("/adminAddDev")
        else:
            usr = CustomUser.objects.create_user(
                username=username, password=passw, is_active=0, usertype='Developer')
            usr.save()
            par = Developer.objects.create(
                name=name+" "+lname, lname=lname, username=username, email=email, phone=phone, department=department, course_completed=course, address=address, certificate=certificate, user=usr)
            par.save()
            messages.info(request,"Regisgtered Successfully.. Password sent to developer email..")
            subject = "Your Password for Login"
            message = f"Hello {name}, your password is: {passw}"
            send_mail(subject, message, 'teamlccalwaye@gmail.com', [email])
            request.session['id'] = email
            return redirect('/adminAddDev')
   else:
        return render(request, 'adminAddDev.html', {"msg": msg})




@login_required(login_url='/log_in')
def teamLeadHome(request):
    return render(request, 'teamLeadHome.html')  



from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt






def teamNotifications(request):
    team_lead_id = request.session['id']

    # All assigned projects
    all_projects = AssignTeamLead.objects.filter(team_lead=team_lead_id,clear=False).order_by("-id")

    # Unseen notifications
    unseen_projects = AssignTeamLead.objects.filter(team_lead=team_lead_id, seen=False)
    unseen_count = unseen_projects.count()

    return render(request, 'teamNotifications.html', {
        "data": all_projects,
        "unseen": unseen_projects,
        "unseen_count": unseen_count
    })

def tlNotiClose(request):
    id=request.GET['id']
    assignment=AssignTeamLead.objects.get(id=id)
    assignment.clear=True
    assignment.save()
    return redirect('/teamNotifications')

from django.http import JsonResponse

def get_unseen_count(request):
    """Return unseen notification count for the logged-in team lead"""
    team_lead_id = request.session.get('id')
    count = 0
    if team_lead_id:
        count = AssignTeamLead.objects.filter(team_lead=team_lead_id, seen=False).count()
    return JsonResponse({'count': count})




@csrf_exempt
def clear_notifications(request):
    """Mark all unseen notifications as seen"""
    if request.method == "POST":
        AssignTeamLead.objects.filter(team_lead=request.session['id'], seen=False).update(seen=True)
        return JsonResponse({"status": "cleared"})
    return JsonResponse({"status": "invalid request"}, status=400)



def teamProjects(request):
        # Get all assigned projects for table
    all_projects = AssignTeamLead.objects.filter(team_lead=request.session['id']).order_by("-id")

    # Get unseen projects for popup
    # unseen_projects = AssignTeamLead.objects.filter(team_lead=request.session['id'], seen=False)

    return render(request, 'teamProjects.html', {
        "data": all_projects
    })
    return render(request, 'teamProjects.html')


def tlUpdate(request):
    id=request.GET['id']
    assignment=AssignTeamLead.objects.get(id=id)
    data=AssignTLupdate.objects.filter(assignment=assignment).order_by("-id")
    if request.method=="POST":
        attachment=request.FILES.get('attachment')
        description=request.POST['description']
        update=AssignTLupdate.objects.create(
            assignment=assignment,
            attachment=attachment,
            progress_description=description
        )
        update.save()
        messages.info(request,"Work Progress Updated Successfully..")
        return redirect('/teamProjects')
    return render(request, 'tlUpdate.html', {"assignment": assignment, "data": data}) 

def tlHistory(request):
    uid=request.session['id']
    tl=TeamLead.objects.get(id=uid)
    name=tl.name
    data=AssignTLupdate.objects.filter(assignment__team_lead=uid).order_by("-id")

    return render(request, 'tlHistory.html', {"data": data, "name": name})




def teamAssign(request):
    uid=request.session['id']
    lead=TeamLead.objects.get(id=uid)
    data=AssignTeamLead.objects.filter(team_lead=request.session['id']).order_by("-id")
    dev=Developer.objects.filter(team_lead=lead).order_by("-id")
    assignments=Assignment.objects.filter(team_lead=lead).order_by("-id")
    
    if request.method=="POST":
        project_id=request.POST['project']
        developer_id=request.POST['developer']
        module=request.POST['module']
        attachment=request.FILES.get('attachment')
        description=request.POST['description']
        start_date = request.POST['start_date']
        end_date = request.POST['end_date']
        project=Project.objects.get(id=project_id)
        developer=Developer.objects.get(id=developer_id)
        assign=Assignment.objects.create(
            project=project,
            developer=developer,
            module=module,
            attachment=attachment,
            description=description,
            team_lead=lead,
            start_date=start_date,
            end_date=end_date
        )
        assign.save()
        messages.info(request,"Project Assigned Successfully..")
        return redirect('/teamAssign')
    return render(request, 'teamAssign.html', {"data": data, "dev": dev,
                                                "assignments": assignments
                                                })

def teamViewAssign(request):
    uid=request.session['id']
    lead=TeamLead.objects.get(id=uid)
    data=AssignTeamLead.objects.filter(team_lead=request.session['id']).order_by("-id")
    dev=Developer.objects.filter(user__is_active=True,department=lead.department).order_by("-id")
    assignments=Assignment.objects.filter(team_lead=lead).order_by("-id")
    
    
    return render(request, 'teamViewAssign.html', {"data": data, "dev": dev,
                                                "assignments": assignments
                                                })


def teamViewProgress(request):
    id=request.GET['id']
    data=AssignmentUpdate.objects.filter(assignment=id).order_by("-id")
    return render(request, 'teamViewProgress.html', {"data": data})

def teamProfile(request):
    uid=request.session['id']
    data=TeamLead.objects.get(id=uid)
    cus=data.user
    passw=cus.password
  

    if request.POST:
        name = request.POST['name']
        lname = request.POST['lname']
        username = request.POST['username']
        email = request.POST['email']
        phone = request.POST['phone']
        dept = request.POST['dept']
        course = request.POST['course']
        # password=request.POST['password']
        address = request.POST['address']
        if CustomUser.objects.exclude(id=cus.id).filter(username=username).exists():
            messages.info(request, 'Username already registered..')
            return redirect("/teamProfile")
        elif TeamLead.objects.exclude(id=uid).filter(Q(phone=phone)|Q(email=email)).exists() or Developer.objects.filter(Q(phone=phone)|Q(email=email)).exists():
            messages.info(request,'Phone number/ email already registered..')
            return redirect("/teamProfile")
        else:
            TeamLead.objects.filter(id=uid).update(name=name,lname=lname,username=username,email=email,phone=phone,
                department=dept,course_completed=course,address=address)
            # updC=CustomUser.objects.get(id=data.user.id)
            # updC.set_password(password)  # ✅ call the method
            # updC.save()

            messages.info(request,"Profile Updated!")
            return redirect("/teamProfile")
    return render(request,"teamProfile.html",{"data":[data],"passw":passw})

def teamUpdatePassword(request):
    uid=request.session['id']
    data=TeamLead.objects.get(id=uid)
    cus=data.user
    passw=cus.password

    if request.POST:
        password=request.POST['password']
        newpassword=request.POST['newpassword']
        confirmpassword=request.POST['confirmpassword']
        if not cus.check_password(password):
            messages.info(request,"Current Password is incorrect!")
            return redirect("/teamUpdatePassword")
        if newpassword==confirmpassword:
            updC=CustomUser.objects.get(id=data.user.id)
            updC.set_password(newpassword)  # ✅ call the method
            updC.save()
            messages.info(request,"Password Updated!")
            return redirect("/teamUpdatePassword")
        else:
            messages.info(request,"Passwords do not match!")
            return redirect("/teamUpdatePassword")

        messages.info(request,"Password Updated!")
        return redirect("/teamUpdatePassword")
    return render(request,"teamUpdatePassword.html",{"data":[data],"passw":passw})

@login_required(login_url='/log_in')
def developerHome(request):
    return render(request, 'developerHome.html')    

def devNotifications(request):
    data=Assignment.objects.filter(developer=request.session['id'],clear=False).order_by("-id") 

    # Get unseen projects for popup
    unseen_projects = Assignment.objects.filter(developer=request.session['id'], seen=False)

    return render(request, 'devNotifications.html', {
        "data": data,
        "unseen": unseen_projects
    })

def DevNotiClose(request):
    id=request.GET['id']
    assignment=Assignment.objects.get(id=id)
    assignment.clear=True
    assignment.save()
    return redirect('/devNotifications')

def get_unseen_dcount(request):
    """Return unseen notification count for the logged-in developer"""
    developer_id = request.session.get('id')
    count = 0
    if developer_id:
        count = Assignment.objects.filter(developer=developer_id, seen=False).count()
    return JsonResponse({'count': count})


@csrf_exempt
def clear_devnotifications(request):
    """Mark all unseen notifications as seen"""
    if request.method == "POST":
        Assignment.objects.filter(developer=request.session['id'], seen=False).update(seen=True)
        return JsonResponse({"status": "cleared"})
    return JsonResponse({"status": "invalid request"}, status=400)


# def devProjects(request):
#         # Get all assigned projects for table
#     all_projects = Assignment.objects.filter(developer=request.session['id']).order_by("-id")


#     # Get unseen projects for popup
#     # unseen_projects = Assignment.objects.filter(developer=request.session['id'], seen=False)

#     return render(request, 'devProjects.html', {
#         "data": all_projects,
#     })


def devProjects(request):
    # Get all assignments for the developer
    all_projects = Assignment.objects.filter(developer=request.session['id']).order_by("-id")

    # Attach start and end dates from AssignTeamLead
    for assign in all_projects:
        lead_assignment = AssignTeamLead.objects.filter(project=assign.project).first()
        assign.start_date = lead_assignment.start_date if lead_assignment else None
        assign.end_date = lead_assignment.end_date if lead_assignment else None

    return render(request, 'devProjects.html', {
        "data": all_projects,
    })



def devUpdate(request):
    id=request.GET['id']
    assignment=Assignment.objects.get(id=id)
    data=AssignmentUpdate.objects.filter(assignment=assignment).order_by("-id")
    if request.method=="POST":
        attachment=request.FILES.get('attachment')
        description=request.POST['description']
        update=AssignmentUpdate.objects.create(
            assignment=assignment,
            attachment=attachment,
            progress_description=description
        )
        update.save()
        messages.info(request,"Work Progress Updated Successfully..")
        return redirect('/devProjects')
    return render(request, 'devUpdate.html', {"assignment": [assignment], "data": data})   


def devHistory(request):
    uid=request.session['id']
    tl=Developer.objects.get(id=uid)
    name=tl.name
    data=AssignmentUpdate.objects.filter(assignment__developer=uid).order_by("-id")

    return render(request, 'devHistory.html', {"data": data, "name": name})

def devProfile(request):
    uid=request.session['id']
    data=Developer.objects.get(id=uid)
    cus=data.user
    passw=cus.password
  

    if request.POST:
        name = request.POST['name']
        lname = request.POST['lname']
        username = request.POST['username']
        email = request.POST['email']
        phone = request.POST['phone']
        dept = request.POST['dept']
        course = request.POST['course']
        # password=request.POST['password']
        address = request.POST['address']
        if CustomUser.objects.exclude(id=cus.id).filter(username=username).exists():
            messages.info(request, 'Username already registered..')
            return redirect("/devProfile")
        elif Developer.objects.exclude(id=uid).filter(Q(phone=phone)|Q(email=email)).exists() or TeamLead.objects.filter(Q(phone=phone)|Q(email=email)).exists():
            messages.info(request,'Phone number/ email already registered..')
            return redirect("/devProfile")
        else:
            Developer.objects.filter(id=uid).update(name=name,lname=lname,username=username,email=email,phone=phone,
                department=dept,course_completed=course,address=address)
            # updC=CustomUser.objects.get(id=data.user.id)
            # updC.set_password(password)  # ✅ call the method
            # updC.save()

            messages.info(request,"Profile Updated!")
            return redirect("/devProfile")
    return render(request,"devProfile.html",{"data":[data],"passw":passw})

def devUpdatePassword(request):
    uid=request.session['id']
    data=Developer.objects.get(id=uid)
    cus=data.user
    passw=cus.password

    if request.POST:
        password=request.POST['password']
        newpassword=request.POST['newpassword']
        confirmpassword=request.POST['confirmpassword']
        if not cus.check_password(password):
            messages.info(request,"Current Password is incorrect!")
            return redirect("/devUpdatePassword")
        if newpassword==confirmpassword:
            updC=CustomUser.objects.get(id=data.user.id)
            updC.set_password(newpassword)  # ✅ call the method
            updC.save()
            messages.info(request,"Password Updated!")
            return redirect("/devUpdatePassword")
        else:
            messages.info(request,"Passwords do not match!")
            return redirect("/devUpdatePassword")

    return render(request,"devUpdatePassword.html",{"data":[data],"passw":passw})