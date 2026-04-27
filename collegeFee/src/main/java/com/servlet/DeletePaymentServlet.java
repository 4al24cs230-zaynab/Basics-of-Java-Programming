package com.servlet;



import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnection;

@WebServlet("/DeletePaymentServlet")
public class DeletePaymentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM payments WHERE payment_id=?"
            );

            ps.setInt(1, id);
            ps.executeUpdate();

            res.sendRedirect("history.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}