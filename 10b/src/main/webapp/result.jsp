<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Result</title>

    <style>
        .result-container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
        }

        .message {
            color: green;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="result-container">

    <h2>Student Result</h2>

    <div class="message">
        <%= request.getAttribute("message") %>
    </div>

    <% if(request.getAttribute("rollno") != null) { %>

        <p><b>Roll No :</b> <%= request.getAttribute("rollno") %></p>

        <p><b>Student Name :</b> <%= request.getAttribute("studentname") %></p>

        <p><b>Subject 1 :</b> <%= request.getAttribute("sub1") %></p>

        <p><b>Subject 2 :</b> <%= request.getAttribute("sub2") %></p>

        <p><b>Subject 3 :</b> <%= request.getAttribute("sub3") %></p>

        <p><b>Subject 4 :</b> <%= request.getAttribute("sub4") %></p>

        <p><b>Subject 5 :</b> <%= request.getAttribute("sub5") %></p>

        <p><b>Result :</b> <%= request.getAttribute("result") %></p>

        <p><b>Average Marks :</b> <%= request.getAttribute("average") %></p>

    <% } %>

    <br>
    <a href="index.jsp">Back to Form</a>

</div>

</body>
</html>