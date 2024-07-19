<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "vn.fpt.edu.model.*" %>
<%@page import = "vn.fpt.edu.Database.*" %>
<%@page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <%
    String email = (String) session.getAttribute("email");
    UserDAO dao = new UserDAO();
    User curUser = dao.getUser(email);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/profile.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="container">
            <div class="main-body">

                <!-- Breadcrumb -->
                <nav aria-label="breadcrumb" class="main-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home">Home</a></li>
                    </ol>
                </nav>
                <!-- /Breadcrumb -->

                <div class="row gutters-sm">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
<!--                                    <img src="<%=curUser.getProfileImage()%>" alt="Admin" class="rounded-circle" width="150">-->
                                    <label for="file"><img id="img-preview" style="height: 160px;width: 160px;" 
                                                           class="rounded-circle mx-auto d-block" 
                                                           src="<%=curUser.getProfileImage()%>"  />
                                        <i class="bi bi-pencil-square "></i>
                                    </label>
                                    <div class="mt-3">
                                        <h4><%=curUser.getLastName()%></h4>
                                        <p class="text-secondary mb-1"><%=curUser.getEmail()%></p>
                                        <p class="text-muted font-size-sm"><%=curUser.getPhoneNumber()%></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">First name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%=curUser.getFirstName()%>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Last name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%=curUser.getLastName()%>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%=curUser.getEmail()%>
                                    </div>
                                </div>
                                <hr>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Phone</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%=curUser.getPhoneNumber()%>
                                    </div>
                                </div>
                                <hr>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Address</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%=curUser.getAddress()%>
                                    </div>
                                </div>
                                <hr>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </body>

</html>
