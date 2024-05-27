<%-- 
    Document   : home
    Created on : May 23, 2024, 8:16:09 PM
    Author     : ACER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>ChildrenCare - Home</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="../assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- SLIDER -->
        <link rel="stylesheet" href="../assets/css/tiny-slider.css"/>
        <!-- Css -->
        <link href="../assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
    </head>
    <body>

        <jsp:include page="../User/header.jsp"></jsp:include>

            <!-- Start Hero -->
            <section class="bg-half-260 d-table w-100" style="background: url('../assets/images/bg/01.jpg') center;">
                <div class="bg-overlay bg-overlay-dark"></div>
                <div class="container">
                    <div class="row mt-5 mt-lg-0">
                        <div class="col-12">
                            <div class="heading-title">
                                <div class="row mt-5 mt-sm-0 align-items-center" style="padding-bottom: 60px">
                                    <div class="col-md-6" style="width: 500px">
                                        <div class="heading-title">
                                            <h4 class="heading mb-3" style="color: white">Find Best Doctor</h4>
                                        </div>
                                        <div class="subcribe-form mt-4">
                                            <form class="ms-0" style="max-width: 550px;">
                                                <div class="mb-2">
                                                    <input type="text" id="name" name="name" class="border bg-white rounded-pill" required="" placeholder="Doctor name...">
                                                    <button type="submit" class="btn btn-pills btn-primary"><i class="ri-search-line align-middle me-1"></i> Search</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <h4 class="display-4 fw-bold text-white title-dark mt-3 mb-4">Meet The <br> Best Doctor</h4>
                                <p class="para-desc text-white-50 mb-0">Great doctor if you need your child to receive immediate effective help, emergency treatment or simple consultation.</p>

                                <div class="mt-4 pt-2">
                                    <a href="booking-appointment.html" class="btn btn-primary">Make Appointment</a>
                                </div>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end container-->
            </section><!--end section-->
            <!-- End Hero -->

            <!-- Start -->
            <section class="section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10">
                            <div class="features-absolute bg-white shadow rounded overflow-hidden card-group">
                                <div class="card border-0 bg-light p-4">
                                    <i class="ri-heart-pulse-fill text-primary h2 mb-0"></i>
                                    <h5 class="mt-1">Emergency Cases</h5>
                                    <p class="text-muted mt-2">This is required when, for example, the is not yet available. Dummy text is also known as 'fill text'.</p>
                                    <a href="departments.html" class="text-primary">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                                </div>

                                <div class="card border-0 p-4">
                                    <i class="ri-dossier-fill text-primary h2 mb-0"></i>
                                    <h5 class="mt-1">Doctors Timetable</h5>
                                    <p class="text-muted mt-2">This is required when, for example, the is not yet available. Dummy text is also known as 'fill text'.</p>
                                    <a href="departments.html" class="text-primary">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                                </div>

                                <div class="card border-0 bg-light p-4">
                                    <i class="ri-time-fill text-primary h2 mb-0"></i>
                                    <h5 class="mt-1">Opening Hours</h5>
                                    <ul class="list-unstyled mt-2">
                                        <li class="d-flex justify-content-between">
                                            <p class="text-muted mb-0">Monday - Friday</p>
                                            <p class="text-primary mb-0">8.00 - 20.00</p>
                                        </li>
                                        <li class="d-flex justify-content-between">
                                            <p class="text-muted mb-0">Saturday</p>
                                            <p class="text-primary mb-0">8.00 - 18.00</p>
                                        </li>
                                        <li class="d-flex justify-content-between">
                                            <p class="text-muted mb-0">Sunday</p>
                                            <p class="text-primary mb-0">8.00 - 14.00</p>
                                        </li>
                                    </ul>
                                    <a href="departments.html" class="text-primary">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                                </div>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end container-->

                <div class="container mt-100 mt-60">
                    <div class="row align-items-center">
                        <div class="col-lg-5 col-md-6">
                            <div class="position-relative">
                                <img src="../assets/images/about/about-2.png" class="img-fluid" alt="">
                                <div class="play-icon">
                                    <a href="#" data-bs-toggle="modal" data-bs-target="#watchvideomodal" class="play-btn video-play-icon">
                                        <i class="mdi mdi-play text-primary rounded-circle bg-white title-bg-dark shadow"></i>
                                    </a>
                                </div>
                            </div>
                        </div><!--end col-->

                        <div class="col-lg-7 col-md-6 mt-4 mt-lg-0 pt- pt-lg-0">
                            <div class="ms-lg-4">
                                <div class="section-title">
                                    <h4 class="title mb-4">About Our Treatments</h4>
                                    <p class="text-muted para-desc">Great doctor if you need your family member to get effective immediate assistance, examination, emergency treatment or a simple consultation. Thank you.</p>
                                    <p class="text-muted para-desc mb-0">The most well-known dummy text is the 'Lorem Ipsum', which is said to have originated in the 16th century. Lorem Ipsum is composed in a pseudo-Latin language which more or less corresponds to 'proper' Latin. It contains a series of real Latin words.</p>
                                </div>

                                <div class="mt-4">
                                    <a href="aboutus.html" class="btn btn-primary">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                                </div>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end container-->
            </section><!--end section-->
            <!-- End -->

            <!-- Start -->
            <section class="section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="section-title text-center mb-4 pb-2">
                                <h4 class="title mb-4">Doctors</h4>
                                <p class="text-muted mx-auto para-desc mb-0">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->

                    <div class="row align-items-center">
                        <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                            <div class="card team border-0 rounded shadow overflow-hidden">
                                <div class="team-img position-relative">
                                    <img src="../assets/images/doctors/01.jpg" class="img-fluid" alt="">
                                    <ul class="list-unstyled team-social mb-0">
                                        <li><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                                    </ul>
                                </div>
                                <div class="card-body content text-center">
                                    <a href="doctor-team-one.html" class="title text-dark h5 d-block mb-0">Calvin Carlo</a>
                                    <small class="text-muted speciality">Eye Care</small>
                                </div>
                            </div>
                        </div><!--end col-->

                        <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                            <div class="card team border-0 rounded shadow overflow-hidden">
                                <div class="team-img position-relative">
                                    <img src="../assets/images/doctors/02.jpg" class="img-fluid" alt="">
                                    <ul class="list-unstyled team-social mb-0">
                                        <li><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                                    </ul>
                                </div>
                                <div class="card-body content text-center">
                                    <a href="doctor-team-one.html" class="title text-dark h5 d-block mb-0">Cristino Murphy</a>
                                    <small class="text-muted speciality">Gynecology</small>
                                </div>
                            </div>
                        </div><!--end col-->

                        <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                            <div class="card team border-0 rounded shadow overflow-hidden">
                                <div class="team-img position-relative">
                                    <img src="../assets/images/doctors/03.jpg" class="img-fluid" alt="">
                                    <ul class="list-unstyled team-social mb-0">
                                        <li><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                                    </ul>
                                </div>
                                <div class="card-body content text-center">
                                    <a href="doctor-team-one.html" class="title text-dark h5 d-block mb-0">Alia Reddy</a>
                                    <small class="text-muted speciality">Psychotherapy</small>
                                </div>
                            </div>
                        </div><!--end col-->

                        <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                            <div class="card team border-0 rounded shadow overflow-hidden">
                                <div class="team-img position-relative">
                                    <img src="../assets/images/doctors/04.jpg" class="img-fluid" alt="">
                                    <ul class="list-unstyled team-social mb-0">
                                        <li><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                                    </ul>
                                </div>
                                <div class="card-body content text-center">
                                    <a href="doctor-team-one.html" class="title text-dark h5 d-block mb-0">Toni Kovar</a>
                                    <small class="text-muted speciality">Orthopedic</small>
                                </div>
                            </div>
                        </div><!--end col-->

                        <div class="col-12 mt-4 pt-2 text-center">
                            <a href="doctor-team-one.html" class="btn btn-primary">See More</a>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end container-->
            </section><!--end section-->
            <!-- End -->

            <div class="row mt-4 pt-2 justify-content-center">
                <div class="col-12 text-center">
                    <div class="section-title" style="padding-bottom: 80px">
                        <h4 class="title mb-4">Have Question ? Get in touch!</h4>
                        <p class="text-muted para-desc mx-auto">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
                        <a href="contact.html" class="btn btn-primary mt-4"><i class="mdi mdi-phone"></i> Contact us</a>
                    </div>
                </div>
            </div>

        <jsp:include page="../User/Footer.jsp"></jsp:include>


        <!-- javascript -->
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <!-- SLIDER -->
        <script src="../assets/js/tiny-slider.js"></script>
        <script src="../assets/js/tiny-slider-init.js"></script>
        <!-- Counter -->
        <script src="../assets/js/counter.init.js"></script>
        <!-- Icons -->
        <script src="../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../assets/js/app.js"></script>
    </body>
</html>
