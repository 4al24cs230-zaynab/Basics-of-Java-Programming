<%@ page import="java.sql.*" %>

<html>
<head>
<title>Salary Report</title>
</head>

<body>

<%
try
{
    String ch = request.getParameter("ch");

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/Employee",
    "root",
    "password");

    // Create Table
    Statement st = con.createStatement();

    String createTable =
    "CREATE TABLE IF NOT EXISTS Emp(" +
    "Emp_No INT PRIMARY KEY," +
    "Emp_Name VARCHAR(50)," +
    "Basicsalary INT)";

    st.execute(createTable);

    // Insert Records
    st.executeUpdate(
    "INSERT IGNORE INTO Emp VALUES(21,'Ramesh',25000)");

    st.executeUpdate(
    "INSERT IGNORE INTO Emp VALUES(22,'Ravi',20000)");

    st.executeUpdate(
    "INSERT IGNORE INTO Emp VALUES(23,'Rahul',30000)");

    st.executeUpdate(
    "INSERT IGNORE INTO Emp VALUES(24,'Suresh',18000)");

    st.executeUpdate(
    "INSERT IGNORE INTO Emp VALUES(25,'Raghu',27000)");

    // Query
    PreparedStatement ps = con.prepareStatement(
    "SELECT * FROM Emp WHERE Emp_Name LIKE ?");

    ps.setString(1, ch + "%");

    ResultSet rs = ps.executeQuery();
%>

<h2>Salary Report</h2>
<hr>

<%
while(rs.next())
{
%>

Emp_No :
<%= rs.getInt("Emp_No") %>
<br><br>

Emp_Name :
<%= rs.getString("Emp_Name") %>
<br><br>

Basic Salary :
<%= rs.getInt("Basicsalary") %>

<hr>

<%
}

rs.close();
ps.close();
con.close();

}
catch(Exception e)
{
    out.println(e);
}
%>

</body>
</html>