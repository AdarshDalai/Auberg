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
    <style>
    
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        .travel-container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        header {
            text-align: center;
            margin-bottom: 20px;
        }

        h1 {
            color: #007bff;
        }

        p {
            margin-bottom: 10px;
        }

        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        div {
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px;
            background-color: #fff;
        }

        img {
            max-width: 100%;
            height: auto;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .book-button {
            background-color: #007bff;
            color: #fff;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .book-button:hover {
            background-color: #0056b3;
        }
    
    </style>
</head>
<body>
<div class="travel-container">
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
                                <img src="<%= vehicleType %>.jpg" alt="<%= vehicleType %>"><br>
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
</div>
</body>
</html>
