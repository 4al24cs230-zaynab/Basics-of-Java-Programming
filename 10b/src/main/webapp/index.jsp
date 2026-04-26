<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Result Form</title>

    <style>
        .form-container {
            width: 400px;
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
    <h2>Enter Student Details</h2>

    <form action="processResult" method="post">

        <div class="form-field">
            Roll No :
            <input type="text" name="rollno" required>
        </div>

        <div class="form-field">
            Student Name :
            <input type="text" name="studentname" required>
        </div>

        <div class="form-field">
            Subject 1 :
            <input type="number" name="sub1" min="0" max="100" required>
        </div>

        <div class="form-field">
            Subject 2 :
            <input type="number" name="sub2" min="0" max="100" required>
        </div>

        <div class="form-field">
            Subject 3 :
            <input type="number" name="sub3" min="0" max="100" required>
        </div>

        <div class="form-field">
            Subject 4 :
            <input type="number" name="sub4" min="0" max="100" required>
        </div>

        <div class="form-field">
            Subject 5 :
            <input type="number" name="sub5" min="0" max="100" required>
        </div>

        <div class="form-field">
            <input type="submit" value="Submit">
        </div>

    </form>
</div>

</body>
</html>