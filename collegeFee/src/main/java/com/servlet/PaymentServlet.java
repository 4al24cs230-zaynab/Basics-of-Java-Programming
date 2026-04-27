package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.db.DBConnection;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        try {

            HttpSession session = req.getSession(false);

            if(session == null || session.getAttribute("user") == null){
                res.sendRedirect("login.html");
                return;
            }

            int studentId = (int) session.getAttribute("user");
            double amount = Double.parseDouble(req.getParameter("amount"));

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO payments(student_id, amount, status) VALUES (?, ?, ?)"
            );

            ps.setInt(1, studentId);
            ps.setDouble(2, amount);
            ps.setString(3, "SUCCESS");

            ps.executeUpdate();

            res.sendRedirect("history.jsp");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}