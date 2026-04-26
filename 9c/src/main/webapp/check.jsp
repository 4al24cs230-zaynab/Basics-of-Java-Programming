<%
    String user = (String) session.getAttribute("user");
%>

<html>
<body>

<%
    if (user != null) {
%>
        <h2>Session Active</h2>
        <p>Hello, <%= user %></p>
<%
    } else {
%>
        <h2>Session Expired!</h2>
        <a href="input.jsp">Restart</a>
<%
    }
%>

</body>
</html>