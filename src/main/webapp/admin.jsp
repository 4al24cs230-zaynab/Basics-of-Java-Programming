<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="navbar.jsp" %>
<html>
<head>
<title>Admin Dashboard</title>
<meta charset="UTF-8">

<style>
body {
    font-family: Arial;
    background: #1e1e2f;
    color: white;
    margin: 0;
}

.header {
    background: #0d6efd;
    padding: 15px;
    text-align: center;
    font-size: 22px;
}

.container {
    padding: 20px;
}

.card {
    display: inline-block;
    background: white;
    color: black;
    padding: 15px;
    margin: 10px;
    border-radius: 10px;
    width: 200px;
}

table {
    width: 100%;
    margin-top: 20px;
    background: white;
    color: black;
    border-collapse: collapse;
}

th, td {
    padding: 10px;
    border: 1px solid #ddd;
}

a {
    text-decoration: none;
    font-weight: bold;
}
</style>
</head>

<body>

<div class="header">
🏫 College Fee Admin Dashboard
</div>

<div class="container">

<%
Connection con = DBConnection.getConnection();

/* TOTAL STUDENTS */
PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(*) FROM students");
ResultSet rs1 = ps1.executeQuery();
rs1.next();
int studentCount = rs1.getInt(1);

/* TOTAL FEES */
PreparedStatement ps2 = con.prepareStatement("SELECT IFNULL(SUM(amount),0) FROM payments");
ResultSet rs2 = ps2.executeQuery();
rs2.next();
double totalFee = rs2.getDouble(1);
%>

<div class="card">
<h3>Total Students</h3>
<h2><%= studentCount %></h2>
</div>

<div class="card">
<h3>Total Fees Collected</h3>
<h2>₹ <%= totalFee %></h2>
</div>

<hr>

<h2>👨‍🎓 Students List (Fee Balance)</h2>

<%
PreparedStatement ps3 = con.prepareStatement(
    "SELECT s.id, s.name, s.email, s.course, s.fees, " +
    "IFNULL(SUM(p.amount),0) AS paid " +
    "FROM students s LEFT JOIN payments p ON s.id = p.student_id " +
    "GROUP BY s.id"
);

ResultSet rs3 = ps3.executeQuery();
%>

<table>
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Course</th>
<th>Total Fees</th>
<th>Paid</th>
<th>Due</th>
<th>Action</th>
</tr>

<%
while(rs3.next()){

double fees = rs3.getDouble("fees");
double paid = rs3.getDouble("paid");
double due = fees - paid;
%>

<tr>
<td><%= rs3.getInt("id") %></td>
<td><%= rs3.getString("name") %></td>
<td><%= rs3.getString("email") %></td>
<td><%= rs3.getString("course") %></td>

<td>₹ <%= fees %></td>
<td>₹ <%= paid %></td>

<td style="color:<%= (due > 0 ? "red" : "green") %>;">
    ₹ <%= due %>
</td>

<!-- ✅ FIXED ACTION COLUMN -->
<td>
    <a href="editStudentPayment.jsp?id=<%= rs3.getInt("id") %>"
       style="color:green;">
       Edit
    </a>

    |

    <a href="DeleteUserServlet?id=<%= rs3.getInt("id") %>"
       style="color:red;"
       onclick="return confirm('Are you sure you want to delete this student?');">
       Delete
    </a>
</td>

</tr>

<%
}
%>

</table>

</div>

</body>
</html>