<%@ include file="navbar.jsp" %>

<html>
<head>
<title>Reports</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(135deg, #141e30, #243b55);
    color: white;
    text-align: center;
}

.container {
    margin-top: 100px;
}

a {
    display: block;
    width: 250px;
    margin: 15px auto;
    padding: 12px;
    background: white;
    color: black;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
}

a:hover {
    background: #ddd;
}
</style>
</head>

<body>

<div class="container">

<h2>Reports</h2>

<a href="ReportServlet?type=overdue">Overdue Payments</a>

<a href="report_form.jsp">Total Collection Report</a>

</div>

</body>
</html>