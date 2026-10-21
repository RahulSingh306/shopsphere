# ShopSphere

ShopSphere is a Java-based web application for browsing products and managing user accounts. It uses Java Servlets and JSP pages for request handling and the web interface, with DAO and service classes to organize application logic.

## Features

- User registration and login
- Password hashing with SHA-256
- Product listing and product detail pages
- Search products by keyword or brand
- Filter products by category
- User profile page
- Role-based admin dashboard access
- Authentication and admin filters
- MySQL database access through DAO classes

## Tech Stack

- **Language:** Java
- **Web:** Java Servlets, JSP, Jakarta Tags (JSTL)
- **Database:** MySQL (expected by the DAO SQL queries)
- **Frontend:** HTML, CSS, JSP
- **Architecture:** Model / DAO / Service / Controller

## Project Structure

```text
src/
└── main/
    ├── java/com/shopsphere/
    │   ├── controller/   # Servlet controllers
    │   ├── dao/          # Database access objects
    │   ├── filter/       # Authentication and admin filters
    │   ├── model/        # Data models
    │   ├── service/      # Application/business logic
    │   └── util/         # Utility classes
    └── webapp/
        ├── WEB-INF/views/ # JSP pages and fragments
        ├── css/           # Stylesheets
        └── index.jsp      # Home page
```

## Requirements

To run the application, you will generally need:

- JDK compatible with your servlet container
- Apache Tomcat compatible with the Jakarta Servlet APIs used by the code
- MySQL Server
- MySQL JDBC driver
- Jakarta Tags/JSTL libraries

## Setup

> **Important:** The source archive currently provided does not include a build file (`pom.xml` or `build.gradle`), a database schema/seed script, or some referenced classes (including `DBUtil`, `Product`, and `User`). Add these project files before the application can be compiled and run. Database connection settings and the required schema must also be configured.

1. **Install Java, Tomcat, and MySQL.** Use a Tomcat version compatible with the Jakarta Servlet imports in the source.
2. **Create the database.** Create a MySQL database and tables matching the SQL used in the DAO classes. The code expects tables such as `users`, `products`, and `categories`.
3. **Configure database access.** Implement the missing `com.shopsphere.util.DBUtil` class to create JDBC connections, and keep database credentials out of source control (use environment variables or a local, untracked configuration file).
4. **Complete missing model classes.** Add the referenced `com.shopsphere.model.User` and `com.shopsphere.model.Product` classes with the fields/getters/setters used by the controllers, services, and DAO classes.
5. **Add dependencies/build configuration.** Configure the Servlet API, JSP/Jakarta Tags, and MySQL JDBC driver for your chosen build process.
6. **Build and deploy.** Package the project as a WAR and deploy it to Tomcat, or configure it as a web application in your IDE.
7. **Open the application.** Visit the local URL provided by Tomcat, typically `http://localhost:8080/<your-app-context>/`.

The exact commands depend on the build configuration and files added to the project.

## Main Pages

- `/` — Home page
- `/products` — Product listing, search, and category filtering
- `/login` — Login
- `/register` — Registration
- `/profile` — User profile (requires login)
- `/admin/dashboard` — Admin dashboard (requires an admin account)
- `/logout` — Log out

The application also links to `/dbtest` from the home page; ensure a matching servlet/controller is present if you want to use that database test link.

## Security Notes

- Do not commit real database passwords, API keys, or other secrets.
- The current `PasswordUtil` uses plain SHA-256 hashing. For production systems, prefer a password-hashing algorithm designed for passwords, such as Argon2id, bcrypt, or scrypt, with a unique salt.
- Review session handling, authorization, input validation, and error handling before deploying publicly.

## Current Status

This README describes the source files in the supplied archive. The project appears to be a partial source snapshot and may need the missing classes, database schema, and build configuration before it runs.

## License

No license file was included in the supplied source archive. Add a `LICENSE` file if you intend to publish the project with explicit reuse terms.
