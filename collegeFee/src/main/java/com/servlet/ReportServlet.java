package com.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.db.DBConnection;
import com.model.FeePayment;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String type = req.getParameter("type");

            Connection con = DBConnection.getConnection();

            List<FeePayment> list = new ArrayList<>();

            if ("overdue".equals(type)) {

                PreparedStatement ps = con.prepareStatement(
                    "SELECT s.name, IFNULL(SUM(p.amount),0) paid, s.fees " +
                    "FROM students s LEFT JOIN payments p ON s.id=p.student_id " +
                    "GROUP BY s.id HAVING paid < s.fees"
                );

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    FeePayment f = new FeePayment();
                    f.setStudentName(rs.getString("name"));
                    f.setAmount(rs.getDouble("paid"));
                    f.setStatus("OVERDUE");
                    list.add(f);
                }
            }

            req.setAttribute("list", list);
            req.getRequestDispatcher("report_result.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}