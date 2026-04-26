<%
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
        <p>Session expires in 1 minute</p>
<%
    } else {
%>
        <h2>Session expired!</h2>
        <a href="index.jsp">Enter again</a>
<%
    }
%>
</body>
</html>