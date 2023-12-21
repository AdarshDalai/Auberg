package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;

@WebServlet("/admin")
public class AdminPageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if the user is an admin
        if (isAdmin(request)) {
            // Render the admin page
            request.getRequestDispatcher("/adminPage.jsp").forward(request, response);
        } else {
            // Redirect to the login page if not authenticated as admin
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }

    private boolean isAdmin(HttpServletRequest request) {
        // Retrieve user object from the session
        Object userObj = request.getSession().getAttribute("user");

        // Check if the user is an admin (assuming User class has isAdmin() method)
        return userObj instanceof User && ((User) userObj).isAdmin();
    }
}
