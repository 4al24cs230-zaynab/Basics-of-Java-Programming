<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="navbar.jsp" %>
<%
String idParam = request.getParameter("id");

if(idParam == null || idParam.trim().isEmpty()){
    out.println("<h3 style='color:red;text-align:center;'>Payment ID missing</h3>");
    return;
}

int id = Integer.parseInt(idParam);

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
    "SELECT * FROM payments WHERE payment_id=?"
);

ps.setInt(1, id);

ResultSet rs = ps.executeQuery();

if(!rs.next()){
    out.println("<h3 style='color:red;text-align:center;'>Payment not found</h3>");
    return;
}
%>

<html>
<head>
<title>Edit Payment</title>

<style>
body{
    font-family: Arial;
    background: linear-gradient(135deg,#141e30,#243b55);
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
    margin:0;
}

.box{
    background:white;
    padding:25px;
    width:350px;
    border-radius:10px;
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

input{
    width:100%;
    padding:10px;
    margin:8px 0;
}

button{
    width:100%;
    padding:10px;
    background:#243b55;
    color:white;
    border:none;
}
</style>

</head>

<body>

<div class="box">

<h2>Edit Payment</h2>

<form action="UpdatePaymentServlet" method="post">

<input type="hidden" name="id" value="<%= rs.getInt("payment_id") %>">

Amount:
<input type="number" name="amount" value="<%= rs.getDouble("amount") %>">

Status:
<input type="text" name="status" value="<%= rs.getString("status") %>">

<button type="submit">Update</button>

</form>

</div>

</body>
</html>