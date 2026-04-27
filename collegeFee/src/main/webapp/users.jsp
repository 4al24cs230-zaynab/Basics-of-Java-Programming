<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="navbar.jsp" %>
<html>
<head>
<title>All Students</title>

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
    color: white;
}

/* TABLE */
table {
    width: 80%;
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
    background: #243b55;
    color: white;
    padding: 12px;
}

/* CELLS */
td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* ROW HOVER */
tr:hover {
    background: #f2f2f2;
}

/* DELETE LINK */
a {
    text-decoration: none;
    color: white;
    background: #e74c3c;
    padding: 6px 12px;
    border-radius: 6px;
    font-size: 13px;
}

a:hover {
    background: #c0392b;
}
</style>

</head>

<body>

<h2>All Students</h2>

<%
Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement("SELECT * FROM students");
ResultSet rs = ps.executeQuery();
%>

<table>
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Action</th>
</tr>

<%
while(rs.next()){
%>

<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("email") %></td>

<td>
<a href="DeleteUserServlet?id=<%= rs.getInt("id") %>"
   onclick="return confirm('Delete this student?');">
   Delete
</a>
</td>

</tr>

<%
}
%>

</table>

</body>
</html>