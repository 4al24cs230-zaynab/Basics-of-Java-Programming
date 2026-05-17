package com.mysql;

import java.sql.*;
import java.util.Properties;

public class Mysql_Select_Insert
{
    public static void main(String[] args)
    {
        Connection dbConnection = null;

        try
        {
            // JDBC URL
            String url = "jdbc:mysql://localhost:3306/test";

            // Database credentials
            Properties info = new Properties();
            info.put("user", "root");
            info.put("password", "password"); // replace with your MySQL password

            // Establish connection
            dbConnection = DriverManager.getConnection(url, info);

            if (dbConnection != null)
            {
                System.out.println("Successfully connected to MySQL database test");
            }

            // SELECT QUERY
            String query = "SELECT * FROM coffee";

            // Create statement
            Statement st = dbConnection.createStatement();

            // Execute query
            ResultSet rs = st.executeQuery(query);

            // Display records
            System.out.println("\nExisting Records:\n");

            while (rs.next())
            {
                int id = rs.getInt("id");
                String coffee_name = rs.getString("coffee_name");
                int price = rs.getInt("price");

                System.out.println(id + ", " + coffee_name + ", " + price);
            }

            // Close ResultSet
            rs.close();

            // INSERT QUERY
            String query1 =
                "INSERT INTO coffee(coffee_name, price) VALUES (?, ?)";

            // Prepare statement
            PreparedStatement stmt =
                dbConnection.prepareStatement(query1);

            // Set values
            stmt.setString(1, "Tajmahal");
            stmt.setInt(2, 950);

            // Execute insert
            int rows = stmt.executeUpdate();

            if (rows > 0)
            {
                System.out.println("\nNew coffee product inserted successfully.");
            }

            // Display updated records
            System.out.println("\nUpdated Records:\n");

            ResultSet rs2 = st.executeQuery("SELECT * FROM coffee");

            while (rs2.next())
            {
                System.out.println(
                    rs2.getInt("id") + ", " +
                    rs2.getString("coffee_name") + ", " +
                    rs2.getInt("price")
                );
            }

            // Close resources
            rs2.close();
            stmt.close();
            st.close();
            dbConnection.close();
        }
        catch (SQLException e)
        {
            System.out.println("Database Error:");
            e.printStackTrace();
        }
        catch (Exception e)
        {
            System.out.println("Error:");
            e.printStackTrace();
        }
    }
}