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
            User authenticatedUser = getUserDetails(username);

            HttpSession session = request.getSession(true);
            session.setAttribute("user", authenticatedUser);
            session.setAttribute("loggedIn", true);
            System.out.println("User " + username + " logged in. Session ID: " + session.getId());

            response.sendRedirect(request.getContextPath() + "/accomodations.jsp");
        } else {
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
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE username = ?")) {
            preparedStatement.setString(1, username);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    User user = new User(
                            resultSet.getString("USERNAME"),
                            resultSet.getString("PASSWORD"),  // Consider not retrieving password for security
                            resultSet.getString("EMAIL"),
                            resultSet.getString("ADDRESS"),
                            resultSet.getString("PHONE_NUMBER"),
                            resultSet.getString("PARENT_DETAILS"),
                            resultSet.getInt("AGE"),
                            resultSet.getString("GENDER"),
                            resultSet.getString("AADHAR_NUMBER"),
                            resultSet.getString("COLLEGE_NAME"),
                            resultSet.getString("COLLEGE_ADDRESS")
                    );
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // User not found
    }
}
