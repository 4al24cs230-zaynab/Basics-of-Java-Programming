package com.servlet;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.db.DBConnection;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));

            Connection con = DBConnection.getConnection();

            // delete user payments first (IMPORTANT)
            PreparedStatement ps1 = con.prepareStatement(
                "DELETE FROM payments WHERE student_id=?"
            );
            ps1.setInt(1, id);
            ps1.executeUpdate();

            // delete user
            PreparedStatement ps2 = con.prepareStatement(
                "DELETE FROM students WHERE id=?"
            );
            ps2.setInt(1, id);
            ps2.executeUpdate();

            res.sendRedirect("users.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}