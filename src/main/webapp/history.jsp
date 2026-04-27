<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="navbar.jsp" %>
<%
Integer id = (Integer) session.getAttribute("user");

if(id == null){
    response.sendRedirect("login.html");
    return;
}

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
    "SELECT * FROM payments WHERE student_id=?"
);

ps.setInt(1, id);

ResultSet rs = ps.executeQuery();

boolean found = false;
%>

<html>
<head>
<title>Payment History</title>
<meta charset="UTF-8">

<style>
body {
    margin: 0;
    font-family: Arial;
    background: linear-gradient(135deg, #141e30, #243b55);
    color: white;
}

/* TITLE */
h2 {
    text-align: center;
    padding: 20px;
}

/* TABLE */
table {
    width: 85%;
    margin: auto;
    border-collapse: collapse;
    background: white;
    color: black;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 10px 25px rgba(0,0,0,0.3);
}

/* HEADER */
th {
    background: linear-gradient(90deg, #243b55, #141e30);
    color: white;
    padding: 12px;
}

/* ROWS */
td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* HOVER */
tr:hover {
    background: #f2f2f2;
}

/* LINKS */
a {
    text-decoration: none;
    font-weight: bold;
    color: #243b55;
}

a:hover {
    color: #0d6efd;
}

/* EMPTY */
.empty {
    text-align: center;
    padding: 20px;
    color: gray;
}
</style>
</head>

<body>

<h2>💳 Payment History</h2>

<table>
<tr>
<th>ID</th>
<th>Amount</th>
<th>Status</th>
<th>Date</th>
<th>Actions</th>
</tr>

<%
while(rs.next()){
    found = true;
%>

<tr>
<td><%= rs.getInt("payment_id") %></td>

<!-- ✅ FIXED RUPEE SYMBOL -->
<td>&#8377; <%= rs.getDouble("amount") %></td>

<td><%= rs.getString("status") %></td>
<td><%= rs.getString("date") %></td>

<td>
    <a href="editPayment.jsp?id=<%= rs.getInt("payment_id") %>">Edit</a>
    |
    <a href="DeletePaymentServlet?id=<%= rs.getInt("payment_id") %>">Delete</a>
</td>

</tr>

<%
}

if(!found){
%>

<tr>
<td colspan="5" class="empty">No payments found</td>
</tr>

<%
}
%>

</table>

</body>
</html>