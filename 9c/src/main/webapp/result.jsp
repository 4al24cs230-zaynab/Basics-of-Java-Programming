<%
    String name = request.getParameter("username");
    String timeStr = request.getParameter("time");

    if (name != null && timeStr != null) {
        int time = Integer.parseInt(timeStr);

        session.setAttribute("user", name);
        session.setMaxInactiveInterval(time);
    }

    String user = (String) session.getAttribute("user");
%>

<html>
<body>

<%
    if (user != null) {
%>
        <h2>Hello, <%= user %>!</h2>
        <p>Session active. Click below link before expiry.</p>
        <a href="check.jsp">Check Session</a>
<%
    } else {
%>
        <h2>Session expired!</h2>
        <a href="input.jsp">Start again</a>
<%
    }
%>

</body>
</html>