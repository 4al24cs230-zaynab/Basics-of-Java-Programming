<%@ page import="java.util.*,com.model.FeePayment" %>
<%@ include file="navbar.jsp" %>

<html>
<head>
<title>Report Result</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(135deg, #141e30, #243b55);
    color: white;
    text-align: center;
}

table {
    margin: auto;
    width: 80%;
    background: white;
    color: black;
    border-collapse: collapse;
}

th, td {
    padding: 10px;
    border: 1px solid #ddd;
}
</style>
</head>

<body>

<h2>Report Result</h2>

<%
List<FeePayment> list = (List<FeePayment>) request.getAttribute("list");

if(list != null){
%>

<table>
<tr>
<th>Name</th>
<th>Amount</th>
<th>Status</th>
</tr>

<%
for(FeePayment f : list){
%>

<tr>
<td><%= f.getStudentName() %></td>
<td><%= f.getAmount() %></td>
<td><%= f.getStatus() %></td>
</tr>

<%
}
%>

</table>

<%
}

if(request.getAttribute("total") != null){
%>

<h3>Total Collection: <%= request.getAttribute("total") %></h3>

<%
}
%>

</body>
</html>