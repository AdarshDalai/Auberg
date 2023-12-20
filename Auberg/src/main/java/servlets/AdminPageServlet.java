package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserManager;

@WebServlet("/admin")
public class AdminPageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if the user is authenticated
        if (isAdminAuthenticated(request)) {
            // Render the admin page
            request.getRequestDispatcher("/adminPage.jsp").forward(request, response);
        } else {
            // Redirect to the login page if not authenticated
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }

    private boolean isAdminAuthenticated(HttpServletRequest request) {
        String username = (String) request.getSession().getAttribute("username");
        String password = (String) request.getSession().getAttribute("password");

        return UserManager.authenticate(username, password);
    }
}
	