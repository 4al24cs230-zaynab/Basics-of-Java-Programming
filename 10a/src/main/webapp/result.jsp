<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Result Page</title>

    <style>
        .result-container {
            width: 350px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
        }

        .message {
            color: green;
            margin-bottom: 20px;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>

<div class="result-container">

    <h2>Processing Result</h2>

    <div class="message">
        <%= request.getAttribute("message") %>
    </div>

    <% if(request.getAttribute("username") != null) { %>

        <h3>Submitted Data:</h3>

        <p>
            Username :
            <%= request.getAttribute("username") %>
        </p>

        <p>
            Email :
            <%= request.getAttribute("email") %>
        </p>

        <p>
            Designation :
            <%= request.getAttribute("designation") %>
        </p>

    <% } %>

    <br>

    <a href="index.jsp">Back to Form</a>

</div>

</body>
</html>