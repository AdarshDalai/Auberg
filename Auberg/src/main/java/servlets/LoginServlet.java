//LoginServlet Class
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
import javax.servlet.http.HttpSession;

import user.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String JDBC_USER = "auberg";
    private static final String JDBC_PASSWORD = "auberg123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (authenticate(username, password)) {
            // Get user details from the database (you can modify this based on your user structure)
            User authenticatedUser = getUserDetails(username);

            // Create a session and store the authenticated user
            HttpSession session = request.getSession(true);
            session.setAttribute("user", authenticatedUser);
            session.setAttribute("loggedIn", true);

            // Redirect to the accommodations page or any other page you want to go after successful login
            response.sendRedirect(request.getContextPath() + "/accomodations.jsp");
        } else {
            // Redirect to the login page with an error message
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=1");
        }
    }

    private boolean authenticate(String username, String password) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
     // Load Oracle JDBC driver
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            // Handle the exception (e.g., log an error)
        }

        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private User getUserDetails(String username) {
        // Retrieve user details from the database based on the username
        // You can modify this method based on your user structure
        // Return a User object with the retrieved details
        return null;
    }
}
