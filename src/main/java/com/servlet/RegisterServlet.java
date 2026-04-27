package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.db.DBConnection;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {

            // ---------------- GET DATA ----------------
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String course = req.getParameter("course");
            double fees = Double.parseDouble(req.getParameter("fees"));

            Connection con = DBConnection.getConnection();

            // ---------------- INSERT STUDENT ----------------
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO students(name, email, password, course, fees) VALUES (?, ?, ?, ?, ?)"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, course);
            ps.setDouble(5, fees);

            ps.executeUpdate();

            // ---------------- GET LAST STUDENT ID ----------------
            PreparedStatement ps2 = con.prepareStatement(
                "SELECT MAX(id) FROM students"
            );

            ResultSet rs = ps2.executeQuery();
            int studentId = 0;

            if(rs.next()){
                studentId = rs.getInt(1);
            }

            // ---------------- CREATE INITIAL PAYMENT (0 or pending) ----------------
            PreparedStatement ps3 = con.prepareStatement(
                "INSERT INTO payments(student_id, amount, status) VALUES (?, ?, ?)"
            );

            ps3.setInt(1, studentId);
            ps3.setDouble(2, 0);   // no payment yet
            ps3.setString(3, "PENDING");

            ps3.executeUpdate();

            // ---------------- REDIRECT ----------------
            res.sendRedirect("login.html");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}