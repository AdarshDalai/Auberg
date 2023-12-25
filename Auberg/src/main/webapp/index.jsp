<!--index.jsp-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ include file="navbar.jsp" %>
<%@ page import="user.User" %>
<%@ page import="servlets.LoginServlet" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Auberg - Hostel Provision</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet.css">
</head>

<body>

    <header>
        <h1>Auberg - Hostel Provision</h1>
        <p>Find Accommodation, Food, Study Resources, and Transport Options Near Your College</p>
    </header>

    <% if (loggedIn) { %>
        <!-- Content to be displayed when the user is logged in -->
        <h1>Welcome, <%= ((user.User) session.getAttribute("user")).getUsername() %>!</h1>
    <% } else { %>
        <!-- Content to be displayed when the user is not logged in -->
        <p>Please log in to access this page.</p>
    <% } %>

    <footer>
        <p>&copy; 2023 Auberg - Hostel Provision. All rights reserved.</p>
    </footer>

</body>

</html>
