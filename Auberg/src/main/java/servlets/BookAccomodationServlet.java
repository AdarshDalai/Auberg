//BookAccomodationServlet.java
package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;

@WebServlet("/BookAccomodationServlet")
public class BookAccomodationServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;
 private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xE";
 private static final String DB_USER = "Auberg";
 private static final String DB_PASSWORD = "auberg123";

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String accommodationType = request.getParameter("accommodation");
	    long accommodationId = getAccommodationId(accommodationType);
	    saveAccommodationBooking(accommodationId, request);

	    response.sendRedirect("confirmation.jsp");
	}

 private long getAccommodationId(String accommodationType) {
	    long accommodationId = 0;

	    try {
	        // Load the Oracle JDBC driver
	        Class.forName("oracle.jdbc.driver.OracleDriver");

	        // Connect to the Oracle database
	        try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
	            // Query the accommodations table to get the accommodation_id
	            String sql = "SELECT accommodation_id FROM accomodations WHERE hostel_name = ?";
	            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	                // Set parameter for the SQL query
	                preparedStatement.setString(1, accommodationType);

	                // Execute the SQL query
	                try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                    if (resultSet.next()) {
	                        // Retrieve the accommodation_id from the result set
	                        accommodationId = resultSet.getLong("accommodation_id");
	                    }
	                }
	            }
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	        // Handle the exception appropriately (log it, show an error message, etc.)
	    }

	    return accommodationId;
	}


 private void saveAccommodationBooking(long accommodationId, HttpServletRequest request) {
	    try {
	        // Load the Oracle JDBC driver
	        Class.forName("oracle.jdbc.driver.OracleDriver");

	        // Connect to the Oracle database
	        try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
	            // Insert the accommodation booking information into the database
	            String sql = "INSERT INTO book_accommodation (user_id, accommodation_id) VALUES (?, ?)";
	            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	                // Get the user ID from the session
	                User user = (User) request.getSession().getAttribute("user");
	                long userId = user.getUserId();

	                // Set parameters for the SQL query
	                preparedStatement.setLong(1, userId);
	                preparedStatement.setLong(2, accommodationId);

	                // Execute the SQL query
	                preparedStatement.executeUpdate();
	            }
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	        // Handle the exception appropriately (log it, show an error message, etc.)
	    }
	}

}
