package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserManager;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (UserManager.authenticate(username, password)) {
            // Store user credentials in the session
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("password", password);

            // Redirect to the admin page
            response.sendRedirect(request.getContextPath() + "/admin");
        } else {
            // Redirect to the login page with an error message
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=1");
        }
    }
}
