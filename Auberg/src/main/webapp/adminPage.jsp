<!--adminPage.jsp-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Admin Page</title>
        <link rel="stylesheet" href="styles.css"> 
    </head>

    <body>
        <h1>Welcome, Admin!</h1>
        <div class="container">
    <h2>Admin Page</h2>
    <p>Welcome, Admin!</p>

    <!-- Display additional content for admin users -->
    <c:if test="${currentSession != null && currentSession.getAttribute('user') != null && currentSession.getAttribute('user').isAdmin()}">
        <div>
            <h2>Admin Controls</h2>
            <ul>
                <li><a href="/Auberg/accommodations">Manage Accommodations</a></li>
                <li><a href="/Auberg/users">Manage Users</a></li>
                <!-- Add more controls/links as needed -->
            </ul>
        </div>
    </c:if>
        </div>
    </body>

    </html>