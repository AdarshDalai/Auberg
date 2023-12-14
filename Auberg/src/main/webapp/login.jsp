<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
     <link rel="stylesheet" href="login.css">
    </head>
<body>

    <div class="login-container">
        <h2>Login</h2>
        <form action="login-action" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
            <button type="button" class="register-button" onclick="location.href='register.jsp';">Register</button>
        </form>
    </div>

</body>
</html>
