package com.servlet;



import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/CookieServlet")
public class CookieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    int count = 0;

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String userName = request.getParameter("userName");

        // Create Cookie
        if (userName != null && !userName.isEmpty()) {
            Cookie cookie = new Cookie("user", userName);

            // Expiry time = 30 seconds
            cookie.setMaxAge(30);

            response.addCookie(cookie);
        }

        Cookie[] cookies = request.getCookies();
        String existingUser = null;

        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("user")) {
                    existingUser = c.getValue();
                }
            }
        }

        out.println("<html><body>");

        if (existingUser != null) {
            count++;

            out.println("<h2 style='color:blue;'>Welcome back, "
                    + existingUser + " !</h2>");

            out.println("<h2 style='color:green;'>You have visited this page "
                    + count + " times!</h2>");

            // Display all cookies
            out.println("<h3>List of Cookies:</h3>");
            out.println("<table border='1'>");
            out.println("<tr><th>Cookie Name</th><th>Cookie Value</th></tr>");

            for (Cookie c : cookies) {
                out.println("<tr>");
                out.println("<td>" + c.getName() + "</td>");
                out.println("<td>" + c.getValue() + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");
        } else {
            out.println("<h2 style='color:red;'>Cookie expired or first visit.</h2>");
            out.println("<a href='index.html'>Login Again</a>");
        }

        out.println("</body></html>");
    }
}