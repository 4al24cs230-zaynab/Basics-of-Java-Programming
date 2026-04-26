package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.util.Date;

@WebServlet("/session")
public class SessionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(true);

        // Set session timeout = 1 minute
        session.setMaxInactiveInterval(60);

        Integer count = (Integer) session.getAttribute("count");

        if (count == null) {
            count = 1;
        } else {
            count++;
        }

        session.setAttribute("count", count);

        out.println("<html><body>");
        out.println("<h2>Session Tracking Info</h2>");
        out.println("<p>Session ID: " + session.getId() + "</p>");
        out.println("<p>Creation Time: " + new Date(session.getCreationTime()) + "</p>");
        out.println("<p>Last Access Time: " + new Date(session.getLastAccessedTime()) + "</p>");
        out.println("<p>Visit Count: " + count + "</p>");
        out.println("<p>Session expires in 1 minute</p>");
        out.println("</body></html>");
    }
}