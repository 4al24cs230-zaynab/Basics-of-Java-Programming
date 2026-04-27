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

/* STUDENT + FEE */
PreparedStatement ps1 = con.prepareStatement(
    "SELECT * FROM students WHERE id=?"
);
ps1.setInt(1, id);
ResultSet rs1 = ps1.executeQuery();
rs1.next();

/* PAID TOTAL */
PreparedStatement ps2 = con.prepareStatement(
    "SELECT IFNULL(SUM(amount),0) FROM payments WHERE student_id=?"
);
ps2.setInt(1, id);
ResultSet rs2 = ps2.executeQuery();
rs2.next();

double paid = rs2.getDouble(1);
double total = rs1.getDouble("fees");
double due = total - paid;
%>

<html>
<head>
<title>Fee Payment</title>

<style>
body {
    margin: 0;
    font-family: Arial;
    background: linear-gradient(135deg, #141e30, #243b55);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.box {
    background: white;
    padding: 30px;
    width: 380px;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.3);
    text-align: center;
}

h2 {
    color: #243b55;
}

.info {
    text-align: left;
    margin-top: 15px;
    font-size: 14px;
}

.info p {
    margin: 6px 0;
}

.due {
    color: red;
    font-weight: bold;
}

.paid {
    color: green;
    font-weight: bold;
}

input {
    width: 100%;
    padding: 10px;
    margin-top: 15px;
    border: 1px solid #ccc;
    border-radius: 8px;
}

button {
    width: 100%;
    padding: 10px;
    margin-top: 15px;
    background: #243b55;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
}

button:hover {
    background: #141e30;
}
</style>

</head>

<body>

<div class="box">

<h2>💳 Fee Payment</h2>

<div class="info">
    <p><b>Name:</b> <%= rs1.getString("name") %></p>
    <p><b>Total Fees:</b> ₹ <%= total %></p>
    <p><b>Paid:</b> <span class="paid">₹ <%= paid %></span></p>
    <p><b>Due:</b> <span class="due">₹ <%= due %></span></p>
</div>

<form action="PaymentServlet" method="post">

    <input type="number" name="amount"
           placeholder="Enter payment amount (₹)" required>

    <button type="submit">Pay Now</button>

</form>

</div>

</body>
</html>