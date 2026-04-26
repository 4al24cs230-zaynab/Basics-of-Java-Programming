package com.HTTP_REQ_RES;



import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/processResult")
public class ResultServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String rollno = request.getParameter("rollno");
        String studentname = request.getParameter("studentname");

        int sub1 = Integer.parseInt(request.getParameter("sub1"));
        int sub2 = Integer.parseInt(request.getParameter("sub2"));
        int sub3 = Integer.parseInt(request.getParameter("sub3"));
        int sub4 = Integer.parseInt(request.getParameter("sub4"));
        int sub5 = Integer.parseInt(request.getParameter("sub5"));

        String result;
        double average;

        // Server-side validation
        if (rollno == null || rollno.trim().isEmpty() ||
            studentname == null || studentname.trim().isEmpty()) {

            request.setAttribute("message", "Roll Number and Student Name are required");

        } else {

            if (sub1 > 40 && sub2 > 40 && sub3 > 40 &&
                sub4 > 40 && sub5 > 40) {
                result = "PASS";
            } else {
                result = "FAIL";
            }

            average = (sub1 + sub2 + sub3 + sub4 + sub5) / 5.0;

            request.setAttribute("rollno", rollno);
            request.setAttribute("studentname", studentname);
            request.setAttribute("sub1", sub1);
            request.setAttribute("sub2", sub2);
            request.setAttribute("sub3", sub3);
            request.setAttribute("sub4", sub4);
            request.setAttribute("sub5", sub5);
            request.setAttribute("result", result);
            request.setAttribute("average", average);
            request.setAttribute("message", "Student Result Processed Successfully");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/result.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("index.jsp");
    }
}