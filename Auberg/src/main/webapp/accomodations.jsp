<!--accomodations.jsp-->
<!-- accommodation.jsp -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="navbar.jsp" %>
<%@ page import="user.User" %>
<%@ page import="servlets.LoginServlet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>


<%! 
    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xE";
    private static final String DB_USER = "Auberg";
    private static final String DB_PASSWORD = "auberg123";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accommodation Booking</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <header>
        <h1>Auberge Travels</h1>
    </header>
    <p>Find the perfect accommodation for your stay</p>
    
    <% if (loggedIn) { %>
        <h1>Welcome, <%= ((User) session.getAttribute("user")).getUsername() %>!</h1>

        <form action="${pageContext.request.contextPath}/BookAccomodationServlet" method="post">
            <div class="gallery">
                <% 
                    // Fetch accommodation options from the database
                    try {
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
                        String sql = "SELECT * FROM accomodations";
                        PreparedStatement preparedStatement = connection.prepareStatement(sql);
                        ResultSet resultSet = preparedStatement.executeQuery();

                        // Display accommodation options
                        while (resultSet.next()) {
                            int accommodationId = resultSet.getInt("accommodation_id");
                            String hostelName = resultSet.getString("hostel_name");
                            
                %>
                            <div>
                                <img src="images/<%= hostelName.toLowerCase() %>.jpg" alt="<%= hostelName %>"><br>
                                <button class="book-button" name="accommodation" value="<%= hostelName %>">Book a Bed</button>
                            </div>
                <%
                        }
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </form>

    <% } else { %>
        <!-- Content to be displayed when the user is not logged in -->
        <p>Please log in to access this page.</p>
    <% } %>

</body>
</html>
