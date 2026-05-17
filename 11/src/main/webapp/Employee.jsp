<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Salary Report</title>
</head>

<body>

<%
Connection con = null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/Employee",
        "root",
        "password"
    );

    // Get values from form
    int empno = Integer.parseInt(request.getParameter("empno"));
    String empname = request.getParameter("empname");
    int salary = Integer.parseInt(request.getParameter("salary"));

    // Insert record
    PreparedStatement ps =
        con.prepareStatement("INSERT INTO Emp VALUES(?,?,?)");

    ps.setInt(1, empno);
    ps.setString(2, empname);
    ps.setInt(3, salary);

    ps.executeUpdate();

    // Fetch records
    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery("SELECT * FROM Emp");

    int grandTotal = 0;
%>

<h2>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</h2>
<h2>Salary Report</h2>
<h2>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</h2>

<%
while(rs.next())
{
    grandTotal += rs.getInt("BasicSalary");
%>

Emp_No : <%= rs.getInt("Emp_No") %><br>
Emp_Name : <%= rs.getString("Emp_Name") %><br>
Basic Salary : <%= rs.getInt("BasicSalary") %><br>

<h3>--------------------------------------</h3>

<%
}
%>

<h2>Grand Salary : <%= grandTotal %></h2>

<h2>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</h2>

<%
rs.close();
st.close();
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