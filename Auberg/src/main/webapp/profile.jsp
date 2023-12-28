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
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        h1 {
            color: #007bff;
        }

        p {
            margin-bottom: 10px;
        }

        .profile-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .error-message {
            color: #dc3545;
            font-weight: bold;
        }


    </style>
</head>
<body>
 <div class="profile-container">
<h1>Profile Page</h1>
<% if(loggedIn) { %>
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
<% } else { %>
<p class="error-message">Please login to view details</p>
<% } %>
</div>
</body>
</html>