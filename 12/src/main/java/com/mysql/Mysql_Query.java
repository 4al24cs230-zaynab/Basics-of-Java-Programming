package com.mysql;

import java.sql.*;
import java.util.Properties;

public class Mysql_Query
{
    public static void main(String[] args)
    {
        try
        {
            Connection dbConnection = null;

            String url = "jdbc:mysql://localhost/test";

            Properties info = new Properties();
            info.put("user", "root");
            info.put("password", "password");

            dbConnection = DriverManager.getConnection(url, info);

            if (dbConnection != null)
            {
                System.out.println("Successfully connected to MySQL database test");
            }

            // SQL Query
            String query =
                    "SELECT * FROM coffee WHERE coffee_name LIKE 'D%'";

            Statement st = dbConnection.createStatement();

            ResultSet rs = st.executeQuery(query);

            // Display Records
            while (rs.next())
            {
                int id = rs.getInt("id");
                String coffee_name = rs.getString("coffee_name");
                int price = rs.getInt("price");

                System.out.format("\n%d %s %d",
                        id, coffee_name, price);
            }

            rs.close();
            st.close();
            dbConnection.close();
        }

        catch (Exception e)
        {
            System.err.println("Got an exception!");
            System.err.println(e.getMessage());
        }
    }
}