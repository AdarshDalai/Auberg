package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.UserManager;

@WebServlet("/registration-action")
public class RegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String parentDetails = request.getParameter("parentDetails");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String aadharNumber = request.getParameter("aadharNumber");
        String collegeName = request.getParameter("collegeName");
        String collegeAddress = request.getParameter("collegeAddress");

        // Create a User object
        User newUser = new User(username, password, email, address, phoneNumber, parentDetails, age, gender, aadharNumber, collegeName, collegeAddress);

        // Insert user into the database
        if (UserManager.registerUser(newUser)) {
            // Registration successful, redirect to a success page
            response.sendRedirect(request.getContextPath() + "/registration-success.jsp");
        } else {
            // Registration failed, redirect to an error page
            response.sendRedirect(request.getContextPath() + "/registration-error.jsp");
        }
    }
}
