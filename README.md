# Hamro-Basti(हाम्रो-बस्ती)

## Overview
Hamro-Basti is a web-based application designed to facilitate the reporting and management of issues within a community. It allows residents (Citizens) to report problems such as potholes, broken streetlights, or Drainage Blockage and enables administrators (Admins) to manage these reports efficiently. The system incorporates role-based access control, secure authentication, and image uploads for reports. Built using Java Servlets, JSP, and MariaDB, it follows a MVC architecture to ensure maintainability and scalability.

## Key Features
- **User Authentication & Authorization**: Secure login and registration with role-based access for Citizens and Admins.
- **Report Management**: Citizens can create, edit, and delete their reports, including uploading images.
- **Admin Dashboard**: Admins can view all reports, update their status and priority, and manage user accounts.
- **Database Integration**: MariaDB is used with secure password hashing and for data integrity.
- **UI/UX Design**: A clean, responsive interface inspired by modern platforms, ensuring usability across devices.


## Technologies Used
- **Backend**: Java Servlets, JSP, JDBC
- **Frontend**: HTML, CSS, JavaScript
- **Database**: MariaDB (with secure password hashing using BCrypt)
- **Security**: BCrypt for password hashing, Filters for authentication and authorization
- **Build Tool**: Maven
- **Server**: Apache Tomcat

## Setup Instructions

### Prerequisites
- Java JDK 11 or higher
- Apache Tomcat 9 or higher
- MariaDB 10.5 or higher
- Maven 3.6 or higher

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/4bhisheksharma/HamroBasti.git
   cd HamroBasti


## User Roles
1. Citizen:
   - Register/log in, create/edit/delete reports, upload images, and manage profiles.

2. Admin:
   - Access dashboard to manage reports (update status/priority) and user accounts.

3. Key Pages
   - Landing Page: /landing-page (public)
   - Login/Register: /login, /register
   - Dashboard: /home (authenticated users)

4. Report Management:
   - Create: /createReport
   - View/Edit/Delete: /report, /editReport, /deleteReport
   - Admin Dashboard: /admin/dashboard (admin-only)

### Contributing
Contributions are welcome! Please fork the repository, make a new branch, and submit a pull request with your changes.

### License
This project is open-source and available under the MIT License.
