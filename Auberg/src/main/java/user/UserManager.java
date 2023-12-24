//UserManager class
package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserManager {
    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String JDBC_USER = "auberg";
    private static final String JDBC_PASSWORD = "auberg123";

    public static boolean authenticate(String username, String password) {
        // Implement your authentication logic here
        // For simplicity, assuming admins are stored in a list
        List<User> admins = getAdmins();
        for (User admin : admins) {
            if (admin.getUsername().equals(username) && admin.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }

    public static boolean registerUser(User user) {
        // Implement user registration logic and database insertion here
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                String sql = "INSERT INTO users (username, email, password, address, phone_number, parent_details, age, gender, aadhar_number, college_name, college_address) "
                        +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, user.getUsername());
                    preparedStatement.setString(2, user.getEmail());
                    preparedStatement.setString(3, user.getPassword());
                    preparedStatement.setString(4, user.getAddress());
                    preparedStatement.setString(5, user.getPhoneNumber());
                    preparedStatement.setString(6, user.getParentDetails());
                    preparedStatement.setInt(7, user.getAge());
                    preparedStatement.setString(8, user.getGender());
                    preparedStatement.setString(9, user.getAadharNumber());
                    preparedStatement.setString(10, user.getCollegeName());
                    preparedStatement.setString(11, user.getCollegeAddress());

                    int rowsAffected = preparedStatement.executeUpdate();
                    return rowsAffected > 0;
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Sample method to retrieve admin users (replace it with your actual logic)
    private static List<User> getAdmins() {
        List<User> admins = new ArrayList<>();
        admins.add(new User("admin1", "password1"));
        admins.add(new User("admin2", "password2"));
        admins.add(new User("admin3", "password3"));
        admins.add(new User("admin4", "password4"));
        return admins;
    }
}
