# 🏢 IT Employee Management System
A complete Django-based web application designed to streamline project assignment, employee management, and daily work tracking within an IT organization. The system includes three main roles: **Admin**, **Team Lead (TL)**, and **Developer**, each with dedicated features to ensure smooth workflow and project monitoring.

---

## 🚀 Project Overview
The IT Employee Management System helps IT companies manage employees and their project activities efficiently. It simplifies registration, project assignment, daily work tracking, approval workflows, and communication between Admins, TLs, and Developers.

---

# 📱 General Requirements
- Fully **mobile-responsive** UI.
- Modules include Admin, Workers/Agencies, and Users.
- Live form validation for all user input fields.

---

# 📝 Features

## 🔐 Registration & Login

### Registration
- Collects details: Address, Course Completed, Certification Upload.
- Department selection (Python, Digital Marketing, etc.).
- Live validation for:
  - Name  
  - Email  
  - Password  
- Email must be unique (duplicate email error shown).
- Automatic email sent with a **random 6-digit password** after successful registration.
- Users can reset password anytime.

### Login
- Secure password reset option.
- Live form validation for login fields.
- Users can update profile details after login.

---

# 🛠 Admin Features
- Add project details: client info, description, requirements, start/end dates, attachments.
- Assign projects to Team Leads.
- Track project progress **daily wise**.
- Promote Developer → TL and TL → Developer.
- Add/Remove Developers and TLs.
- Approve or Reject new Developer registrations.
- Dashboard notifications for new registrations and project updates.  

---

# 👨‍💼 Team Lead (TL) Features
- Receive project assignment notifications.
- View project details with timeline.
- Assign project modules to Developers.
- View Developer daily work status.
- Download Developer work attachments.
- Monitor complete project progress daily.

---

# 👨‍💻 Developer Features
- Receive module assignments with start & end dates.
- Submit daily work updates with file attachments.
- View daily-wise work history.
- Receive notifications from TL/Admin.

---

# 🧪 Technologies Used
- Python 3.x  
- Django  
- HTML5, CSS3, JavaScript  
- Bootstrap  
- jQuery (for live validation)  
- SQLite / MySQL  

---

# ⚙️ Installation & Setup Guide

Follow these steps to run the project locally:

---

## ✅ 1. Clone the Repository
```bash
git clone https://github.com/yourusername/IT-Employee-Management.git
cd IT-Employee-Management
