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
    <style>
    .about-container {
  max-width: 800px;
  margin: 20px auto;
  padding: 20px;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
}

.about-container h3 {
  color: #007bff;
}

.about-container p {
  color: #555;
  line-height: 1.6;
}
</style>
</head>

<body>

    <header>
        <h1>Auberg - Hostel Provision</h1>
        <p>Find Accommodation, Food, Study Resources, and Transport Options Near Your College</p>
    </header>

    <% if (loggedIn) { %>
        <!-- Content to be displayed when the user is logged in -->
        <h1>Welcome, <%= ((user.User) session.getAttribute("user")).getUsername() %>!</h1>
    <% }  %>
 <div class="about-container" style="margin-bottom:100px">       
<h3>About Us:</h3>
<p>

<h4>Mission:</h4>
At our platform, we endeavor to support students who face challenges securing accommodation at their institutions or affording hostels/mess facilities. Our comprehensive services aim to provide food, library resources, and transport solutions for students, ensuring they have a conducive environment for learning and daily commuting.
<h4>
Vision:
</h4>
Our vision is to become a cornerstone in the lives of students, offering not just a place to stay but an ecosystem that fosters learning, growth, and community engagement. We envision a future where every student, regardless of their financial constraints or accommodation availability, has access to essential facilities and resources crucial for their educational journey. Through innovation and dedication, we aspire to be the go-to platform that transforms the living experience for students across the nation.</p>
</div>
    <footer >
        <p>&copy; 2023 Auberg - Hostel Provision. All rights reserved.</p>
    </footer>

</body>

</html>
