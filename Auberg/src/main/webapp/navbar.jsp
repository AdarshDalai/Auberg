<!--navbar.jsp-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="servlets.LoginServlet" %>
<%@ page import="user.User" %>
<%@ page import="servlets.LoginServlet" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet.css">

<%
 
    boolean loggedIn = session != null && session.getAttribute("loggedIn") != null
            && (boolean) session.getAttribute("loggedIn");

%>

<nav>
    <a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/your-logo.png" alt="Auberg Logo"></a>

    <ul>
        <li><a href="${pageContext.request.contextPath}/accomodations.jsp">Accommodation</a></li>
        <li><a href="#food">Food</a></li>
        <li><a href="${pageContext.request.contextPath}/library.jsp">Library</a></li>
        <li><a href="${pageContext.request.contextPath}/travels.jsp">Transport</a></li>
        <li><a href="${pageContext.request.contextPath}/profile.jsp">Profile</a></li>
        
    </ul>

    <% if (loggedIn) { %>
        <!-- User is logged in -->
        <a href="${pageContext.request.contextPath}/logout" class="login-button">Logout</a>
    <% } else { %>
        <!-- User is not logged in -->
        <a href="${pageContext.request.contextPath}/login.jsp" class="login-button">Login</a>
    <% } %>
    
</nav>
