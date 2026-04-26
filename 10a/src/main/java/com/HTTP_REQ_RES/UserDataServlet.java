package com.HTTP_REQ_RES;



import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/processUser")
public class UserDataServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form values
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String designation = request.getParameter("designation");

        String message;

        // Server-side validation
        if (username == null || username.trim().isEmpty()) {
            message = "Username is required";
        } else if (email == null || email.trim().isEmpty()) {
            message = "Email is required";
        } else if (designation == null || designation.trim().isEmpty()) {
            message = "Designation is required";
        } else {
            message = "User Data Processed Successfully";

            // Store values in request object
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("designation", designation);
        }

        request.setAttribute("message", message);

        // Forward to result.jsp
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/result.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("index.jsp");
    }
}