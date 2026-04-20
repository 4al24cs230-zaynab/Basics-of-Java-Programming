package cookieservlet8b;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/visit")
public class CookieVisitServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String user = null;
        int count = 0;

        // Read existing cookies
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("user")) {
                    user = c.getValue();
                }
                if (c.getName().equals("count")) {
                    count = Integer.parseInt(c.getValue());
                }
            }
        }

        out.println("<html><body>");

        if (user != null) {
            // Existing user → increment visit count
            count++;

            Cookie countCookie = new Cookie("count", String.valueOf(count));
            countCookie.setMaxAge(60); // expires in 60 seconds

            response.addCookie(countCookie);

            out.println("<h2>Welcome back, " + user + "!</h2>");
            out.println("<h3>You have visited " + count + " times</h3>");

        } else {
            // First-time user
            out.println("<h2>Enter your name</h2>");
            out.println("<form method='post'>");
            out.println("Name: <input type='text' name='username'>");
            out.println("<input type='submit' value='Submit'>");
            out.println("</form>");
        }

        // Display all cookies
        out.println("<h3>All Cookies:</h3>");
        if (cookies != null) {
            for (Cookie c : cookies) {
                out.println("Name: " + c.getName() + 
                            " | Value: " + c.getValue() + "<br>");
            }
        }

        out.println("<p>(Cookies expire in 60 seconds)</p>");
        out.println("</body></html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("username");

        // Create user cookie
        Cookie userCookie = new Cookie("user", name);
        userCookie.setMaxAge(60); // expires in 60 sec

        // Initialize visit count
        Cookie countCookie = new Cookie("count", "0");
        countCookie.setMaxAge(60);

        response.addCookie(userCookie);
        response.addCookie(countCookie);

        response.sendRedirect("visit");
    }
}