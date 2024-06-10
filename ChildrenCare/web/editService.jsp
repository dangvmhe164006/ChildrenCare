<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Edit Service</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                margin-top: 20px;
                background-color: #f2f6fc;
                color: #69707a;
            }
            .img-account-profile {
                height: 10rem;
            }
            .rounded-circle {
                border-radius: 50% !important;
            }
            .card .card-header {
                font-weight: 500;
            }
            .card-header:first-child {
                border-radius: 0.35rem 0.35rem 0 0;
            }
            .card-header {
                padding: 1rem 1.35rem;
                margin-bottom: 0;
                background-color: rgba(33, 40, 50, 0.03);
                border-bottom: 1px solid rgba(33, 40, 50, 0.125);
            }
            .form-control, .dataTable-input {
                display: block;
                width: 100%;
                padding: 0.875rem 1.125rem;
                font-size: 0.875rem;
                font-weight: 400;
                line-height: 1;
                color: #69707a;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #c5ccd6;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 0.35rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }
            .nav-borders .nav-link.active {
                color: #0061f2;
                border-bottom-color: #0061f2;
            }
            .nav-borders .nav-link {
                color: #69707a;
                border-bottom-width: 0.125rem;
                border-bottom-style: solid;
                border-bottom-color: transparent;
                padding-top: 0.5rem;
                padding-bottom: 0.5rem;
                padding-left: 0;
                padding-right: 0;
                margin-left: 1rem;
                margin-right: 1rem;
            }
        </style>
    </head>
    <body>
        <div class="container-xl px-4 mt-4">
            <hr class="mt-0 mb-4">
            <div class="row">
                <div class="col-xl-4">
                    <!-- Service picture-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Service Picture</div>
                        <div class="card-body text-center">
                            <!-- Service picture image-->
                            <img class="img-account-profile rounded-circle mb-2" src="https://st3.depositphotos.com/13349494/17896/i/450/depositphotos_178964966-stock-photo-stethoscope-paper-cardiogram-scattered-pills.jpg" alt="">
                            <!-- Service picture help block-->
                            <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 3 MB</div>
                            <!-- Service picture upload button-->
                            <button class="btn btn-primary" type="button">Upload new image</button>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <!-- Service details-->
                    <div class="card mb-4">
                        <div class="card-header">Service Details</div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/EditServiceController" method="post">
                                <!-- Form Group (Service ID) -->
                                <div class="mb-3">
                                    <label class="small mb-1" for="serviceID">Service ID</label>
                                    <input class="form-control" id="serviceID" name="serviceID" type="text" value="${service.serviceID}" readonly>
                                </div>
                                <!-- Form Group (Service Name)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="serviceName">Service Name</label>
                                    <input class="form-control" id="serviceName" name="serviceName" type="text" value="${service.name}">
                                </div>
                                <!-- Form Group (Service Description)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="serviceDescription">Service Description</label>
                                    <input class="form-control" id="serviceDescription" name="serviceDescription" type="text" value="${service.description}">
                                </div>
                                <!-- Form Group (Service Price)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="servicePrice">Service Price</label>
                                    <input class="form-control" id="servicePrice" name="servicePrice" type="text" value="${service.price}">
                                </div>
                                <!-- Save changes button-->
                                <button class="btn btn-primary" type="submit">Save Changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
