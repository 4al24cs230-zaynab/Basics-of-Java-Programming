package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.db.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            Connection con = DBConnection.getConnection();
            System.out.println(DBConnection.getConnection());
            // 🔴 IMPORTANT CHECK
           
            System.out.println("Connection: " + con);

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM students WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                req.getSession().setAttribute("user", rs.getInt("id"));
                res.sendRedirect("history.jsp");
                return;
            } else {
                out.println("<h3>Invalid Login</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}