<%-- 
    Document   : ListAccAdmin
    Created on : Jun 2, 2024, 9:54:22 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="assets/images/favicon.ico.png">
        <title>Manager Account</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 100px;
            }
        </style>
        <script>
            function confirmDelete(aid) {
                if (confirm('Are you sure you want to delete this account?')) {
                    window.location.href = 'deleteacc?aid=' + aid;
                }
            }
        </script>
    </head>
    <body style="margin: auto">
        <div>
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Account</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="home"  class="btn btn-success"> <span>Home</span></a>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>User Name</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>Full Name</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Gender</th>
                            <th>Image</th>
                            <th>Role</th>
                            <th>Date Create</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${allacc}" var="o">
                            <tr>
                                <td>${o.user_id}</td>
                                <td>${o.user_name}</td>
                                <td>${o.password}</td>
                                <td>${o.email}</td>
                                <td>${o.full_name}</td>
                                <td>${o.phone}</td>
                                <td>${o.address}</td>
                                <td>${(o.gender)?'Male':'Female'}</td>
                                <td>
                                    <img src="${o.image_url}">
                                </td>
                                <td>${o.role}</td>
                                <td>${o.date_created}</td>
                                <td>
                                    <a href="loadacc?aid=${o.user_id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="javascript:void(0);" onclick="confirmDelete(${o.user_id})" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="row text-center">
                    <!-- PAGINATION START -->
                    <div class="col-12" >
                        <div class="d-md-flex align-items-center text-center justify-content-between">
                            <ul class="pagination justify-content-center" style="float: none">
                                <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Previous">Prev</a></li>
                                

                                <c:forEach begin="1" end="${requestScope.total}" var="a">
                                    <c:set var="isActivePage" value="${a == page}" />
                                    <li class="page-item ${isActivePage ? 'active' : ''}">
                                        <a class="page-link" href="home?page=${a}" style="${isActivePage ? 'background-color: blue;' : ''}">
                                            ${a}
                                        </a>
                                    </li>
                                </c:forEach>
                                    
                                <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Next">Next</a></li>    
                            </ul>
                        </div>
                    </div><!--end col-->
                    <!-- PAGINATION END -->
                </div><!--end row-->
                <div class="clearfix">
                    <div class="hint-text"><h3><a href="#">Back to top</a></h3></div>
                    <ul class="pagination">
                        <div class="hint-text"><h3><a href="home">Back to home</a></h3></div>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
