package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/CookieServlet")
public class CookieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = null;
        int count = 0;

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("user")) {
                    name = c.getValue();
                }
                if (c.getName().equals("count")) {
                    count = Integer.parseInt(c.getValue());
                }
            }
        }

        if (name != null) {
            count++;
            Cookie countCookie = new Cookie("count", String.valueOf(count));
            countCookie.setMaxAge(30); // expires in 30 sec
            response.addCookie(countCookie);

            out.println("<h2>Welcome back, " + name + "!</h2>");
            out.println("<h3>You visited " + count + " times</h3>");
        } else {
            out.println("<form method='post'>");
            out.println("Enter name: <input name='userName'>");
            out.println("<input type='submit'>");
            out.println("</form>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("userName");

        Cookie user = new Cookie("user", name);
        user.setMaxAge(30);

        Cookie count = new Cookie("count", "0");
        count.setMaxAge(30);

        response.addCookie(user);
        response.addCookie(count);

        response.sendRedirect("CookieServlet");
    }
}