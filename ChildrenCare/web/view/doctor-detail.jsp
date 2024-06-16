<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "vn.fpt.edu.model.*" %>
<%@page import = "vn.fpt.edu.Database.*" %>
<%@ page import = "java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Page</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="./resources/css/staff-style.css">
        <style>
            body {
                font-family: 'Open Sans', sans-serif;
                background-color: #f8f9fa;
            }
            .list-doctor {
                padding: 20px 0;
            }
            .single-content {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-bottom: 20px;
            }
            .page-title {
                font-size: 24px;
                font-weight: 700;
                margin-bottom: 20px;
            }
            .list-info table {
                width: 100%;
            }
            .list-info td {
                vertical-align: top;
                padding: 5px 0;
            }
            .list-info strong {
                display: inline-block;
                width: 150px;
                color: #007bff;
            }
            .list-info .detail {
                margin: 0;
                padding: 0;
            }
            .achievement {
                margin-top: 30px;
            }
            .achievement h3 {
                font-size: 20px;
                font-weight: 600;
                margin-bottom: 10px;
                color: #333;
            }
            .achievement .detail {
                padding: 10px;
                background-color: #f1f1f1;
                border-radius: 5px;
            }
            .more {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                text-transform: uppercase;
                font-weight: 600;
            }
            .more:hover {
                background-color: #0056b3;
            }
            .text-center {
                text-align: center;
            }
            .content-page img {
                width: 100%;
                height: auto;
                border-radius: 8px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="./layout/Header.jsp" />
        <% ServiceStaffDAO ssDao = new ServiceStaffDAO(); %>
        <% ServiceDAO sDao = new ServiceDAO(); %>
        <!--start doctor detail-->
        <div class="list-doctor">
            <div class="content-page single-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-4"> 
                                    <img src="${staff.getProfileImage()}" alt="Doctor Image">
                                    <div class="text-center">
                                        <a href="service?event=doc&staffID=${staff.getStaffID()}">
                                            <button class="more">Make an appointment</button>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <h1 class="page-title">${staff.getRank()} ${staff.getFullName()}</h1>
                                    <div class="list-info">
                                        <table cellpadding="10">
                                            <tbody>
                                                <tr>
                                                    <td><strong>Specialist</strong></td>
                                                    <td><p class="detail">${staff.getSpecialty()}</p></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Education</strong></td>
                                                    <td><p class="detail">${staff.getDepthStudy()}</p></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Specialized Activities</strong></td>
                                                    <td><p class="detail">${staff.getSpecializedActivities()}</p></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Introduction</strong></td>
                                                    <td><p class="detail">${staff.getIntroduction()}</p></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="achievement">
                                <h3>Professional Achievements</h3>
                                <div class="detail">
                                    <p>${staff.getProfessionalAchievements()}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--doctor detail end-->
        <jsp:include page="layout/footer.jsp" />
    </body>
</html>
