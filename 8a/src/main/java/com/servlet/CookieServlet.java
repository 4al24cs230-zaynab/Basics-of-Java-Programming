package com.servlet;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/CookieServlet")
public class CookieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    int count = 0; // visit count

    // Handle GET request
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String userName = request.getParameter("userName");

        // Create cookie if name entered
        if (userName != null && !userName.isEmpty()) {
            Cookie userCookie = new Cookie("user", userName);

            // Cookie expiry time = 30 seconds
            userCookie.setMaxAge(30);

            response.addCookie(userCookie);
        }

        // Read cookies
        Cookie[] cookies = request.getCookies();
        String existingUser = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user")) {
                    existingUser = cookie.getValue();
                    break;
                }
            }
        }

        // HTML Output
        out.println("<html>");
        out.println("<head><title>Cookie Example</title></head>");
        out.println("<body>");

        if (existingUser != null) {
            count++;

            out.println("<font color='blue'><h2>Welcome back, "
                    + existingUser + " !</h2></font>");

            out.println("<font color='magenta'><h2>You have visited this page "
                    + count + " times!</h2></font>");

            out.println("<br><a href='CookieServlet?action=logout'>Logout</a>");
        } else {
            out.println("<h2 style='color:red;'>Welcome Guest! Kindly login first time</h2>");

            out.println("<form action='CookieServlet' method='get'>");
            out.println("Enter your name: <input type='text' name='userName'>");
            out.println("<input type='submit' value='Submit'>");
            out.println("</form>");
        }

        out.println("</body>");
        out.println("</html>");
    }

    // Handle POST request for cookie expiry/delete
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Cookie cookie = new Cookie("user", "");
        cookie.setMaxAge(0); // delete cookie
        response.addCookie(cookie);

        response.sendRedirect("CookieServlet");
    }
}