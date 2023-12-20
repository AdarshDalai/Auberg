package user;
import java.util.ArrayList;
import java.util.List;

public class UserManager {
    private static List<User> admins = new ArrayList<>();

    static {
        // Add your admin users
        admins.add(new User("admin1", "password1"));
        admins.add(new User("admin2", "password2"));
        admins.add(new User("admin3", "password3"));
        admins.add(new User("admin4", "password4"));
    }

    public static boolean authenticate(String username, String password) {
        for (User admin : admins) {
            if (admin.getUsername().equals(username) && admin.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }
}
