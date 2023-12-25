<!--accomodations.jsp-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ include file="navbar.jsp" %>
<%@ page import="user.User" %>
<%@ page import="servlets.LoginServlet" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Accommodations</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet.css">
</head>

<body>

    <div class="container">
        <div class="accommodations-container">
            <% if (loggedIn) { %>
                <!-- User is logged in -->
                <h1>Welcome, <%= ((user.User) session.getAttribute("user")).getUsername() %>!</h1>
                <h2>Accommodations</h2>
                <div class="accommodation">
                    <h3>Accommodation Title 1</h3>
                    <p>Description of the accommodation. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
                <div class="accommodation">
                    <h3>Accommodation Title 2</h3>
                    <p>Description of the accommodation. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
            <% } else { %>
                <!-- Content to be displayed when the user is not logged in -->
                <p>Please log in to access this page.</p>
            <% } %>
        </div>
    </div>

</body>

</html>
