<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="navbar.jsp" %>
    <%@ page import="user.User" %>
<%@ page import="servlets.LoginServlet" %>
    
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
	<p>Now rent any vehicle you want at a very minimal cost
	</p>
<% if (loggedIn) { %>
<h1>Welcome, <%= ((user.User) session.getAttribute("user")).getUsername() %>!</h1>
                	
	<form action="BookingServlet" method="post">
		<!-- Your existing form content -->



		<div class="gallery">
			<div>
				<img src="images/auto.jpeg" alt="Auto"><br>
				<button class="book-button" onclick="bookTaxi('Auto')">Book
					Auto</button>
			</div>
			<div>
				<img src="images/car.jpg" alt="Car"><br>
				<button class="book-button" onclick="bookTaxi('Car')">Book
					Car</button>
			</div>
			<div>
				<img src="images/scooter.jpeg" alt="Scooter"><br>
				<button class="book-button" onclick="bookTaxi('Scooter')">Book
					Bike</button>
			</div>
			<!-- Add more images and buttons as needed -->
		</div>
	</form>
	<% } else { %>
                <!-- Content to be displayed when the user is not logged in -->
                <p>Please log in to access this page.</p>
            <% } %>
	<script>
		function bookTaxi(vehicle) {
			
			
			alert('Booking confirmed for ' + vehicle);
	        function sendDataToServlet() {
	            // Get the data from an input field or any other source
	            var inputData = vehicle; // Replace with your data

	            // Create a new FormData object
	            var formData = new FormData();
	            formData.append("data", inputData);

	            // Make an AJAX request to the servlet
	            fetch('BookingServlet', {
	                method: 'POST',
	                body: formData
	            })
	            .then(response => response.text())
	            .then(data => {
	                // Handle the response from the servlet if needed
	                console.log(data);
	            })
	            .catch(error => {
	                // Handle errors
	                console.error('Error:', error);
	            });
	        }
			// You can add more logic for actual booking process
		}
	</script>

</body>
</html>
