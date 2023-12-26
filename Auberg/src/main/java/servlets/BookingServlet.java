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

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "Auberg";
    private static final String DB_PASSWORD = "auberg123";
    
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vehicleType = request.getParameter("vehicle");
        long vehicleId = getVehicleId(vehicleType);
        saveBooking(vehicleId, request);

        response.sendRedirect("confirmation.jsp");
    }
    
    private long getVehicleId(String vehicleType) {
        long vehicleId = 1; // Default value if not found

        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Connect to the Oracle database
            try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
                // Query to get the vehicle_id based on vehicleType
                String sql = "SELECT vehicle_id FROM vehicles WHERE vehicle_type = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, vehicleType);

                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        if (resultSet.next()) {
                            // Retrieve the vehicle_id from the result set
                            vehicleId = resultSet.getLong("vehicle_id");
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return vehicleId;
    }

    private void saveBooking(long vehicleId, HttpServletRequest request) {
        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Connect to the Oracle database
            try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
                // Insert the booking information into the database
                String sql = "INSERT INTO bookings (user_id, vehicle_id) VALUES (?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    // Get the user ID from the session
                    User user = (User) request.getSession().getAttribute("user");
                    long userId = user.getUserId();

                    // Set parameters for the SQL query
                    preparedStatement.setLong(1, userId);
                    preparedStatement.setLong(2, vehicleId); // Use setLong for vehicleId

                    // Execute the SQL query
                    preparedStatement.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            
        }
    }

}
