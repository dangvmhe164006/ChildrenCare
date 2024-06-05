<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Service</title>
    <style>
        form {
            width: 50%;
            margin: 0 auto;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .back-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #dcdcdc;
            color: #333;
            text-decoration: none;
            border-radius: 5px;
        }

        .back-link:hover {
            background-color: #bdbdbd;
        }
    </style>
</head>
<body>
    <h1>Add New Service</h1>
    <form action="AddServiceController" method="post">
        Name: <input type="text" name="name"><br>
        Description: <textarea name="description"></textarea><br>
        Price: <input type="text" name="price"><br>
        <input type="submit" value="Add Service">
    </form>
    <a href="viewServices.jsp" class="back-link">Back to Service List</a>
</body>
</html>