package com.test;

import java.sql.Connection;
import com.db.DBConnection;

public class testDB {
    public static void main(String[] args) {
        Connection con = DBConnection.getConnection();

        if(con != null) {
            System.out.println("CONNECTED SUCCESSFULLY");
        } else {
            System.out.println("CONNECTION FAILED");
        }
    }
}