package com.servlet;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnection;

@WebServlet("/UpdatePaymentServlet")
public class UpdatePaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            double amount = Double.parseDouble(req.getParameter("amount"));
            String status = req.getParameter("status");

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE payments SET amount=?, status=? WHERE payment_id=?"
            );

            ps.setDouble(1, amount);
            ps.setString(2, status);
            ps.setInt(3, id);

            ps.executeUpdate();

            res.sendRedirect("history.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}