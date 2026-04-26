/*
6a. Build a servlet program to find the factorial of a number using HTML with step by step procedure.
Step by step implementation procedure:
 Create a new Dynamic Web Project:
o Open Eclipse
o File → New → Dynamic Web Project
o Name it &quot;FactorialCalculatorDemo&quot;
o Choose Apache Tomcat as the target runtime
o Click Finish

 Create the Servlet:
o Right-click on src folder
o New → Class
o Name it &quot;FactorialServlet&quot;
o Copy the Java code from the second artifact above
o Save the file*/


package com.factorial;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/factorial")
public class FactorialServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int number = Integer.parseInt(request.getParameter("number"));

        long fact = 1;

        for(int i=1; i<=number; i++)
        {
            fact = fact * i;
        }

        out.println("<html><body>");
        out.println("<h2>Factorial Result</h2>");
        out.println("<p>Number : " + number + "</p>");
        out.println("<p>Factorial : " + fact + "</p>");
        out.println("<a href='index.html'>Back</a>");
        out.println("</body></html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.sendRedirect("index.html");
    }
}
/*3. Create the HTML file:

o Right-click on WebContent folder
o New → HTML File
o Name it &quot;index.html&quot;*/