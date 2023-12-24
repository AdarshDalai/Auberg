<!--navbar.jsp-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<link rel="stylesheet" href="stylesheet.css">

<nav>
    <a href="index.jsp"><img src="your-logo.png" alt="Auberg Logo"></a>

    <ul>
        <li><a href="accomodations.jsp">Accommodation</a></li>
        <li><a href="#food">Food</a></li>
        <li><a href="#library">Library</a></li>
        <li><a href="#transport">Transport</a></li>
    </ul>

    <% HttpSession currentSession=request.getSession(false); %>
    <% if (currentSession != null && currentSession.getAttribute("loggedIn") != null && (boolean) currentSession.getAttribute("loggedIn")) { %>
        <!-- User is logged in -->
        <a href="logout" class="login-button">Logout</a>
    <% } else { %>
        <!-- User is not logged in -->
        <a href="login.jsp" class="login-button">Login</a>
    <% } %>
</nav>
