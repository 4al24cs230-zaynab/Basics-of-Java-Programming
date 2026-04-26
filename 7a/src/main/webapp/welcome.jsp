<%@ page language="java" %>
<%
    // Set session timeout = 1 minute (60 seconds)
    session.setMaxInactiveInterval(60);

    String name = request.getParameter("username");

    if (name != null) {
        session.setAttribute("user", name);
    }

    String user = (String) session.getAttribute("user");
%>

<html>
<body>
<%
    if (user != null) {
%>
        <h2>Hello, <%= user %>!</h2>
        <p>Session will expire in 1 minute.</p>
<%
    } else {
%>
        <h2>Session expired! Please enter your name again.</h2>
        <a href="index.jsp">Go Back</a>
<%
    }
%>
</body>
</html>