<%@ include file="navbar.jsp" %>

<html>
<head>
<title>Select Date</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(135deg, #141e30, #243b55);
    color: white;
    text-align: center;
}

form {
    background: white;
    color: black;
    padding: 20px;
    width: 300px;
    margin: 100px auto;
    border-radius: 10px;
}

input {
    width: 90%;
    padding: 10px;
    margin: 10px;
}

button {
    background: #243b55;
    color: white;
    padding: 10px;
    border: none;
}
</style>
</head>

<body>

<h2>Total Collection Report</h2>

<form action="ReportCriteriaServlet" method="post">

From:
<input type="date" name="from" required>

To:
<input type="date" name="to" required>

<button type="submit">Generate</button>

</form>

</body>
</html>