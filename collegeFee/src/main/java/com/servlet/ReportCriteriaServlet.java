package com.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.db.DBConnection;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String from = req.getParameter("from");
            String to = req.getParameter("to");

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT IFNULL(SUM(amount),0) FROM payments WHERE date BETWEEN ? AND ?"
            );

            ps.setString(1, from);
            ps.setString(2, to);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                req.setAttribute("total", rs.getDouble(1));
            }

            req.getRequestDispatcher("report_result.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}