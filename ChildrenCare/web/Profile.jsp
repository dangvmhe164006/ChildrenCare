<%-- 
    Document   : Profile
    Created on : May 27, 2024, 9:12:09 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Profile</title>
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
        <jsp:include page="Header.jsp"></jsp:include>

            <!-- Start -->
            <section class="bg-dashboard">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-4 col-lg-4 col-md-5 col-12">
                            <div class="rounded shadow overflow-hidden sticky-bar">
                                <div class="card border-0">
                                    <img src="assets/images/doctors/profile-bg.jpg" class="img-fluid" alt="">
                                </div>

                                <div class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                    <img src="${requestScope.users.image_url}" class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                <h5 class="mt-3 mb-1">${requestScope.users.full_name}</h5>
                                <p class="text-muted mb-0">${requestScope.users.email}</p>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-8 col-lg-8 col-md-7 mt-4 pt-2 mt-sm-0 pt-sm-0">
                        <div class="rounded shadow mt-4">
                            <div class="p-4 border-bottom">
                                <h5 class="mb-0">Profile</h5>
                            </div>

                            <div class="p-4 border-bottom">
                                <div class="row align-items-center">
                                    <div class="col-lg-2 col-md-4">
                                        <img src="${requestScope.users.image_url}" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt="">
                                    </div><!--end col-->

                                    <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                        <h5 class="">Upload your picture</h5>
                                        <p class="text-muted mb-0">For best results, use an image at least 256px by 256px in either .jpg or .png format</p>
                                    </div><!--end col-->

                                    <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">  
                                        <form action="changeimg" method="post" enctype="multipart/form-data" onsubmit="return checkFileExtension()" style="margin: -26px">
                                            <div>
                                                <input style="border: 0.2px #00000036 solid;margin: auto;" type="file" name="photo" id="imageMain">
                                                <input type="hidden" name="id" value="${requestScope.users.user_id}">
                                            </div>
                                            <div class="small font-italic text-muted mb-4">JPG hoặc PNG không lớn hơn 5 MB</div>
                                            <div class="row"> 
                                                <div style="margin-left: -55px;">
                                                    <button class="btn btn-primary" type="submit">Upload</button>
                                                    <a href="removeimg" class="btn btn-soft-primary ms-2">Remove</a>
                                                </div>   
                                            </div>
                                        </form>
                                    </div><!--end col-->
                                </div><!--end row-->
                            </div>

                            <div class="p-4">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">User Name</label>
                                            <p class="form-control">${requestScope.users.user_name}</p>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Full Name</label>
                                            <p class="form-control">${requestScope.users.full_name}</p>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Your Email</label>
                                            <p class="form-control">${requestScope.users.email}</p>
                                        </div> 
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Phone Number</label>
                                            <p class="form-control">${requestScope.users.phone}</p>
                                        </div>                                                                               
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Address</label>
                                            <p class="form-control">${requestScope.users.address}</p>
                                        </div>                                                                               
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Date Created</label>
                                            <p class="form-control">${requestScope.users.date_created}</p>
                                        </div>                                                                               
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Gender</label>
                                            <p class="form-control">${(requestScope.users.gender)?"Male":"Female"}</p>
                                        </div>                                                                               
                                    </div><!--end col-->

                                </div><!--end row-->

                                <div class="row">
                                    <div class="col-sm-12">
                                        <a class="btn btn-primary" href="editprofile" style="width: 178px">Edit</a>
                                    </div><!--end col-->
                                </div><!--end row-->

                                <div class="row" style="margin-top: 20px">
                                    <div class="col-sm-12">
                                        <a class="btn btn-primary" href="ChangePassword.jsp">Change Password</a>
                                    </div><!--end col-->
                                </div><!--end row-->
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- End -->

        <jsp:include page="Footer.jsp"></jsp:include>

        <!-- Back to top -->
        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
        <!-- Back to top -->

        <!-- javascript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>
    </body>
</html>
