<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Service List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Service List</h1>
    <table border="1">
        <tr>
            <th>Service ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Date Created</th>
        </tr>
        <c:forEach items="${services}" var="service" >
            <tr>
                <td>${service.serviceID}</td>
                <td>${service.name}</td>
                <td>${service.description}</td>
                <td>${service.price}</td>
                <td>${service.dateCreated}</td>
            </tr>
        </c:forEach>
    </table>
    <a href="addService.jsp">Add New Service</a>
</body>
</html>