package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/prime")
public class PrimeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int num = Integer.parseInt(request.getParameter("number"));

        boolean isPrime = true;
        String steps = "";

        if (num <= 1) isPrime = false;

        for (int i = 2; i <= num / 2; i++) {
            if (num % i == 0) {
                isPrime = false;
                steps += num + " divisible by " + i + "<br>";
                break;
            } else {
                steps += num + " not divisible by " + i + "<br>";
            }
        }

        out.println("<html><body>");
        out.println("<h2>Prime Check</h2>");
        out.println("<p>Number: " + num + "</p>");
        out.println("<p>" + steps + "</p>");

        if (isPrime)
            out.println("<h3>" + num + " is PRIME</h3>");
        else
            out.println("<h3>" + num + " is NOT PRIME</h3>");

        out.println("<a href='prime.html'>Back</a>");
        out.println("</body></html>");
    }
}