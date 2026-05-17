<%@ page import="java.sql.*" %>

<html>
<head>
<title>Delete Report</title>
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

    // Delete Records
    PreparedStatement ps = con.prepareStatement(
    "DELETE FROM Emp WHERE Emp_Name LIKE ?");

    ps.setString(1, ch + "%");

    ps.executeUpdate();

    // Display Remaining Records
    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery(
    "SELECT * FROM Emp");

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