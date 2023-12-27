<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="navbar.jsp" %>
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
<%@ page import="user.User" %>
<%@ page import="servlets.LoginServlet" %>

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
    <title>Taxi Booking</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <header>
        <h1>Auberge Travels</h1>
    </header>
    <p>Now rent any vehicle you want at a very minimal cost</p>
    
    <% if (loggedIn) { %>
        <h1>Welcome, <%= ((User) session.getAttribute("user")).getUsername() %>!</h1>

        <form action="${pageContext.request.contextPath}/BookingServlet" method="post">
            <div class="gallery">
                <% 
                    // Fetch vehicle options from the database
                    try {
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
                        String sql = "SELECT vehicle_id, vehicle_type FROM vehicles";
                        PreparedStatement preparedStatement = connection.prepareStatement(sql);
                        ResultSet resultSet = preparedStatement.executeQuery();

                        // Display vehicle options
                        while (resultSet.next()) {
                            int vehicleId = resultSet.getInt("vehicle_id");
                            String vehicleType = resultSet.getString("vehicle_type");
                %>
                            <div>
                                <img src="<%= vehicleType.toLowerCase() %>.jpg" alt="<%= vehicleType %>"><br>
                                <button class="book-button" name="vehicle" value="<%= vehicleType %>">Book <%= vehicleType %></button>
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
