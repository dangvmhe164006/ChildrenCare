<%-- 
    Document   : ChangePassword
    Created on : Jun 2, 2024, 8:41:24 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Change password</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="https://shreethemes.in" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
    </head>
    <body>
        <!-- Hero Start -->
        <section class="bg-half-150 d-table w-100 bg-light" style="background: url('assets/images/bg/bg-lines-one.png') center;">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5 col-md-8">
                        <img src="assets/images/logo-dark.png" height="24" class="mx-auto d-block" alt="">
                        <div class="card login-page bg-white shadow mt-4 rounded border-0">
                            <div class="card-body">
                                <h4 class="text-center">Change Password</h4> 
                                <form action="changepasswors" method="post">
                                    <div class="row">
                                        <c:if test="${requestScope.err != null}">
                                            <div class="alert alert-danger" role="alert">
                                                ${requestScope.err}
                                            </div>
                                        </c:if>

                                        <div class="col-lg-12" style="display: none">
                                            <div class="mb-3">
                                                <label class="form-label">ID</label>
                                                <input type="password" name="id" class="form-control" value="${sessionScope.acc.user_id}" >
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label class="form-label">Old password :</label>
                                                <input type="password" name="old" class="form-control" placeholder="Old password" required="">
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label class="form-label">New password :</label>
                                                <input type="password" name="new" class="form-control" placeholder="New password" required="">
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label class="form-label">Re-type New password :</label>
                                                <input type="password" name="new2" class="form-control" placeholder="Re-type New password" required="">
                                            </div>
                                        </div><!--end col-->
                                        
                                        <div class="col-md-6">
                                            <div class="d-grid" style="width: 200px">
                                                <button class="btn btn-primary">Save password</button>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="d-grid" style="width: 200px">
                                                <a href="profile" class="btn btn-primary">CANCEL</a>
                                            </div>
                                        </div>
                                        
                                    </div><!--end row-->
                                </form>

                            </div>
                        </div><!---->
                    </div> <!--end col-->
                </div><!--end row-->
            </div> <!--end container-->
        </section><!--end section-->
        <!-- Hero End -->

        <!-- javascript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>
    </body>
</html>
