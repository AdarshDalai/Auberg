<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="user.User" %>

<%@ page import="servlets.LoginServlet" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ include file="navbar.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page</title>
<link rel="stylesheet" href="stylesheet.css">
</head>
<body>
<h1>Profile Page</h1>
<p>User ID: <%= ((user.User) session.getAttribute("user")).getUserId() %></p>

<p>Username: <%= ((user.User) session.getAttribute("user")).getUsername() %></p>
<p>Email: <%= ((user.User) session.getAttribute("user")).getEmail()  %></p>
<p>Address: <%= ((user.User) session.getAttribute("user")).getAddress() %></p>

<p>Phone Number: <%= ((user.User) session.getAttribute("user")).getPhoneNumber() %></p>

<p>Father's name: <%= ((user.User) session.getAttribute("user")).getParentDetails()  %></p>

<p>Age: <%= ((user.User) session.getAttribute("user")).getAge() %></p>

<p>Gender: <%= ((user.User) session.getAttribute("user")).getGender()  %></p>

<p>Aadhar Number: <%= ((user.User) session.getAttribute("user")).getAadharNumber()%></p>

<p>College Name: <%= ((user.User) session.getAttribute("user")).getCollegeName() %></p>

<p>College Address: <%= ((user.User) session.getAttribute("user")).getCollegeAddress() %></p>

    
</body>
</html>