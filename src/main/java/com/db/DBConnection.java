package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
            		"jdbc:mysql://127.0.0.1:3306/college_fee?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
                "root",
                "password"   
            );

            return con;

        } catch (Exception e) {
            
            throw new RuntimeException("DB ERROR: " + e.getMessage());
        }
    }
}