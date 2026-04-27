package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.db.DBConnection;

@WebServlet("/UpdateStudentPaymentServlet")
public class UpdateStudentPaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));

            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String course = req.getParameter("course");

            double amount = Double.parseDouble(req.getParameter("amount"));
            String status = req.getParameter("status");

            Connection con = DBConnection.getConnection();

            // ✅ 1. UPDATE STUDENT ONLY
            PreparedStatement ps1 = con.prepareStatement(
                "UPDATE students SET name=?, email=?, course=? WHERE id=?"
            );
            ps1.setString(1, name);
            ps1.setString(2, email);
            ps1.setString(3, course);
            ps1.setInt(4, id);
            ps1.executeUpdate();

            // ✅ 2. INSERT NEW PAYMENT (IMPORTANT FIX)
            PreparedStatement ps2 = con.prepareStatement(
                "INSERT INTO payments(student_id, amount, status) VALUES (?, ?, ?)"
            );
            ps2.setInt(1, id);
            ps2.setDouble(2, amount);
            ps2.setString(3, status);
            ps2.executeUpdate();

            res.sendRedirect("admin.jsp?msg=updated");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}