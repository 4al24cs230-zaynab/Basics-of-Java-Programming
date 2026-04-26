<%@ page language="java" import="javax.servlet.http.*" %>
<html>
<body>

<h2>Active Cookies</h2>

<%
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie c : cookies) {
%>
            <p>Name: <%= c.getName() %> | Value: <%= c.getValue() %></p>
<%
        }
    } else {
%>
        <p>No cookies found</p>
<%
    }
%>

<br>
<a href="cookieForm.jsp">Back</a>

</body>
</html>