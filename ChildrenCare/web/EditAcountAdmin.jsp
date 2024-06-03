<%-- 
    Document   : EditAcountAdmin
    Created on : Jun 3, 2024, 8:57:24 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Account </title>

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
                        <div class="card login-page bg-white shadow mt-4 rounded border-0">
                            <div class="card-body">
                                <h3 class="text-center">Edit Account By Admin</h3>  
                                <h5 class="text-center">You can only change role</h5>  
                                <form action="editaccount" method="post" class="login-form mt-4">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">ID<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" value="${requestScope.acc1.user_id}" name="id" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">User Name <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" value="${requestScope.acc1.user_name}" name="userName" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Password <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" value="${requestScope.acc1.password}" name="password" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Your Email <span class="text-danger">*</span></label>
                                                <input type="email" class="form-control" value="${requestScope.acc1.email}" name="email" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Full Name <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" value="${requestScope.acc1.full_name}" name="fullName" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Your Phone Number <span class="text-danger">*</span></label>
                                                <input type="number" class="form-control" value="${requestScope.acc1.phone}" name="phone" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Your address <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" value="${requestScope.acc1.address}" name="address" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Your Gender<span class="text-danger">*</span></label>
                                                &nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="gender" value="1" disabled ${(requestScope.acc1.gender) ? "checked" : ""}> Male
                                                <input type="radio" name="gender" value="0" disabled ${(requestScope.acc1.gender) ? "" : "checked"}> Female

                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Image <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" value="${requestScope.acc1.image_url}" name="img" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Role <span class="text-danger">*</span></label>
                                                <select class="form-control" name="role" required>
                                                    <option value="Admin" ${requestScope.acc1.role == 'Admin' ? 'selected' : ''}>Admin</option>
                                                    <option value="Customer" ${requestScope.acc1.role == 'Customer' ? 'selected' : ''}>Customer</option>
                                                    <option value="Doctor" ${requestScope.acc1.role == 'Doctor' ? 'selected' : ''}>Doctor</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Date Create <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" value="${requestScope.acc1.date_created}" name="date" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="d-grid" style="width: 200px">
                                                <button class="btn btn-primary">SUBMIT</button>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="d-grid" style="width: 200px">
                                                <a href="manageacc" class="btn btn-primary">CANCEL</a>
                                            </div>
                                        </div>
                                    </div>
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
