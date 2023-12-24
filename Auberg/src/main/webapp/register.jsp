<!--register.jsp-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css"> <!-- Assuming you have a styles.css for common styling -->
        <title>User Registration</title>
        <link rel="stylesheet" href="stylesheet.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
        </style>
    </head>

    <body>

        <div class="registration-container">
            <h2>User Registration</h2>
            <form action="registration-action" method="post">
                <!-- Existing fields -->
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>

                <!-- Additional fields -->
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>

                <label for="phoneNumber">Phone Number:</label>
                <input type="tel" id="phoneNumber" name="phoneNumber" required>

                <label for="parentDetails">Parent Details:</label>
                <input type="text" id="parentDetails" name="parentDetails" required>

                <label for="age">Age:</label>
                <input type="number" id="age" name="age" required>

                <label for="gender">Gender:</label>
                <select id="gender" name="gender" required>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>

                <label for="aadharNumber">Aadhar Card Number:</label>
                <input type="text" id="aadharNumber" name="aadharNumber" required>

                <label for="collegeName">College Name:</label>
                <input type="text" id="collegeName" name="collegeName" required>

                <label for="collegeAddress">College Address:</label>
                <input type="text" id="collegeAddress" name="collegeAddress" required>

                <button type="submit">Register</button>
            </form>
        </div>
        <script src="registration-validation.js"></script>

    </body>

    </html>