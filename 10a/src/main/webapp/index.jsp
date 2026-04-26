<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>User Data Form</title>

    <style>
        .form-container {
            width: 350px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
        }

        .form-field {
            margin: 10px 0;
        }
    </style>
</head>
<body>

<div class="form-container">

    <h2>Enter User Details</h2>

    <form action="processUser" method="post">

        <div class="form-field">
            Username :
            <input type="text" name="username" required>
        </div>

        <div class="form-field">
            Email :
            <input type="email" name="email" required>
        </div>

        <div class="form-field">
            Designation :
            <input type="text" name="designation" required>
        </div>

        <div class="form-field">
            <input type="submit" value="Submit">
        </div>

    </form>

</div>

</body>
</html>