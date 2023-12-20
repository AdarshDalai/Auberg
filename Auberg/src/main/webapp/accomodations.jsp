<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Accommodations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .accommodations-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%; /* Updated to be 80% of the viewport width */
            margin: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 1.5em; /* Responsive font size */
        }

        .accommodation {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
        }

        .accommodation h3 {
            margin-bottom: 10px;
        }

        .accommodation p {
            color: #555;
        }

        @media screen and (max-width: 600px) {
            /* Adjust styles for screens smaller than 600px */
            .accommodations-container {
                width: 100%; /* Take up full width on smaller screens */
            }

            h2 {
                font-size: 1.2em; /* Adjust font size for smaller screens */
            }
        }
    </style>
</head>

<body>
    <div class="container">
<%@ include file="navbar.jsp" %>

        <div class="accommodations-container">        
            <h2>Accommodations</h2>

            <div class="accommodation">
                <h3>Accommodation Title 1</h3>
                <p>Description of the accommodation. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>

            <div class="accommodation">
                <h3>Accommodation Title 2</h3>
                <p>Description of the accommodation. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>

            <!-- Add more accommodations as needed -->

        </div>
    </div>
</body>
</html>
