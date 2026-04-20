<%@ page language="java" import="javax.servlet.http.*" %>
<%
    String name = request.getParameter("name");
    String domain = request.getParameter("domain");
    int age = Integer.parseInt(request.getParameter("age"));

    Cookie cookie = new Cookie(name, domain);
    cookie.setMaxAge(age);

    response.addCookie(cookie);
%>

<html>
<body>
    <h2>Cookie Added Successfully!</h2>
    <p>Name: <%= name %></p>
    <p>Domain: <%= domain %></p>
    <p>Expiry: <%= age %> seconds</p>

    <a href="showCookies.jsp">Go to Active Cookie List</a>
</body>
</html>