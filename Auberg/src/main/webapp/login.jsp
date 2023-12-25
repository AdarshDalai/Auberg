<!--login.jsp-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheet.css">
    <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 100px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            button {
                background-color: #4caf50;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            button:hover {
                background-color: #45a049;
            }
        </style>
</head>

<body>

    <div class="login-container">
        <h2>Login</h2>
        <form action="${pageContext.request.contextPath}/login" method="post">
           <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">Login</button>
                <button type="button" class="register-button" onclick="location.href='register.jsp';">Register</button>
            </form>
        </div>
        <script src="${pageContext.request.contextPath}/registration-validation.js"></script>
    
    </body>
    
    </html>