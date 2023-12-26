//BookingServlet
package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "Auberg";
    private static final String DB_PASSWORD = "auberg123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vehicle = request.getParameter("vehicle");
        saveBooking(vehicle);

        response.sendRedirect("confirmation.jsp");
    }

    private void saveBooking(String vehicle) {
        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Connect to the Oracle database
            try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
                // Insert the booking information into the database
    
                String sql = "INSERT INTO bookings (vehicle) VALUES (?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, vehicle);
                    preparedStatement.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately (log it, show an error message, etc.)
        }
    }
}
