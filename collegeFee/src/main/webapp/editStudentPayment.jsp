<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="navbar.jsp" %>
<%
String idParam = request.getParameter("id");

if (idParam == null || idParam.trim().isEmpty()) {
    out.println("<h3 style='color:red;text-align:center;'>ID missing</h3>");
    return;
}

int id = Integer.parseInt(idParam);

Connection con = DBConnection.getConnection();

// STUDENT
PreparedStatement ps1 = con.prepareStatement(
    "SELECT * FROM students WHERE id=?"
);
ps1.setInt(1, id);
ResultSet rs1 = ps1.executeQuery();

if(!rs1.next()){
    out.println("<h3 style='color:red;text-align:center;'>Student not found</h3>");
    return;
}

// PAYMENT (latest)
PreparedStatement ps2 = con.prepareStatement(
    "SELECT * FROM payments WHERE student_id=? ORDER BY payment_id DESC LIMIT 1"
);
ps2.setInt(1, id);
ResultSet rs2 = ps2.executeQuery();

double amount = 0;
String status = "PENDING";

if(rs2.next()){
    amount = rs2.getDouble("amount");
    status = rs2.getString("status");
}
%>

<html>
<head>
<title>Edit Student Payment</title>
<meta charset="UTF-8">

<style>
body {
    margin: 0;
    font-family: Arial;
    background: linear-gradient(135deg, #0f0f0f, #3a3a3a, #1a1a1a);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* SHINY METAL CARD */
.card {
    background: linear-gradient(145deg, #e6e6e6, #bdbdbd);
    width: 430px;
    padding: 25px;
    border-radius: 16px;
    box-shadow:
        10px 10px 25px rgba(0,0,0,0.5),
        -5px -5px 15px rgba(255,255,255,0.4);
    border: 1px solid rgba(255,255,255,0.6);
}

/* TITLE */
h2 {
    text-align: center;
    color: #2c2c2c;
    margin-bottom: 20px;
}

/* LABEL */
label {
    font-weight: bold;
    color: #333;
}

/* INPUTS */
input {
    width: 100%;
    padding: 10px;
    margin: 6px 0 15px 0;
    border-radius: 8px;
    border: 1px solid #aaa;
    background: rgba(255,255,255,0.8);
    box-shadow: inset 2px 2px 6px rgba(0,0,0,0.15);
}

/* BUTTON SHINY */
button {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 10px;
    font-size: 16px;
    color: white;
    cursor: pointer;

    background: linear-gradient(90deg, #c0c0c0, #ffffff, #a0a0a0);
    background-size: 200% auto;
    transition: 0.5s;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
}

button:hover {
    background-position: right center;
    transform: scale(1.05);
}

hr {
    margin: 15px 0;
    border: 1px solid #ddd;
}
</style>
</head>

<body>

<div class="card">

<h2>Update Student & Payment</h2>

<form action="UpdateStudentPaymentServlet" method="post">

<input type="hidden" name="id" value="<%= id %>">

<label>Name</label>
<input type="text" name="name" value="<%= rs1.getString("name") %>">

<label>Email</label>
<input type="text" name="email" value="<%= rs1.getString("email") %>">

<label>Course</label>
<input type="text" name="course" value="<%= rs1.getString("course") %>">

<hr>

<label>Payment Amount</label>
<input type="number" name="amount" value="<%= amount %>">

<label>Status</label>
<input type="text" name="status" value="<%= status %>">

<button type="submit">💾 Update Details</button>

</form>

</div>

</body>
</html>