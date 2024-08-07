<%@page import = "vn.fpt.edu.model.*" %>
<%@page import = "vn.fpt.edu.Database.*" %>
<%@page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>User manager list</title>

        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="76x76" href="./resources/favicon/apple-touch-icon.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="./resources/favicon/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="./resources/favicon/favicon-16x16.png" />
        <link rel="manifest" href="./resources/favicon/site.webmanifest" />
        <meta name="msapplication-TileColor" content="#da532c" />
        <meta name="theme-color" content="#ffffff" />
        <link rel="stylesheet" href="./resources/css/staff-dashboard.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>User manage</title>
        <style>
            #example_filter {
                margin-right: 1rem!important;
                margin-left: 1rem!important;
            }
        </style>
    </head>

    <body>        <%
String email = (String) session.getAttribute("email");
StaffDAO staffDAO = new StaffDAO();
Staff curStaff = staffDAO.getStaffByStaffEmail(email);
UserDAO userDAO = new UserDAO();
boolean isManager = false;
boolean isStaff = false;
        %>
        <div class="container-fluid position-relative bg-white d-flex p-0">
            <%if(curStaff!=null){
            if(curStaff.getRole().equals("manager")) isManager=true;
            if(curStaff.getRole().equals("doctor")||curStaff.getRole().equals("nurse")) isStaff=true;%>
            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar navbar-light">
                   <h3 class="text-light">
                            <i class="fa fa-hashtag me-2"></i>ChildrenCare
                        </h3>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img
                                class="rounded-circle"
                                src="<%=curStaff.getProfileImage()%>"
                                alt=""
                                style="width: 40px; height: 40px"
                                />
                            <div
                                class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"
                                ></div>
                        </div>
                        <div class="ms-3 text-light">
                            <h6 class="mb-0"><%=curStaff.getStaffName()%></h6>
                            <span><%=curStaff.getRole()%></span>
                        </div>
                    </div>
                     <%if(isStaff){%>    
                    <div class="navbar-nav w-100  text-light">
                        <a href="staff?event=send-to-reservations-list" class="nav-item nav-link"
                           ><i class="fas fa-list-alt"></i>Reservations List</a
                        >
                    </div>  
                    <div class="navbar-nav w-100  text-light">
                        <a href="staff?event=send-to-medical-examination" class="nav-item nav-link"
                           ><i class="far fa-check-square"></i>Medical examination</a
                        >
                    </div>
                    <div class="navbar-nav w-100  text-light">
                        <a href="staff?event=send-to-schedules" class="nav-item nav-link">
                          <i class="bi bi-calendar3"></i>Schedules
                        </a>
                    </div>
                    <%}%>
                    <%if(isManager){%>
                    <div class="navbar-nav w-100 text-light">
                        <a href="user?action=search" class="nav-item nav-link active"
                           ><i class="bi bi-people-fill"></i>User</a
                        >
                    </div>
                    <div class="navbar-nav w-100 text-light">
                        <a href="staffschedule?action=send-to-manage" class="nav-item nav-link"
                           ><i class="bi bi-calendar-check"></i>Staff Schedule</a
                        >
                    </div>
                    <div class="navbar-nav w-100  text-light">
                        <a href="staff?event=send-to-medical-examination-manage" class="nav-item nav-link"
                           ><i class="far fa-check-square"></i>Medical examination</a
                        >
                    </div>
                    <div class="navbar-nav w-100  text-light">
                        <a href="reservationcontactmanager?event=reservation-list" class="nav-item nav-link"
                           ><i class="fas fa-list-alt"></i>Reservations Manager</a
                        >
                    </div>
                    <div class="navbar-nav w-100 text-light">
                        <a href="service?event=manage" class="nav-item nav-link"
                           ><i class="fas fa-stethoscope"></i>Services</a
                        >
                    </div>
                    <div class="navbar-nav w-100 text-light">
                        <a href="postManage" class="nav-item nav-link"
                           ><i class="bi bi-file-earmark-post"></i>Post</a
                        >
                    </div>
                    <div class="navbar-nav w-100 text-light">
                        <a href="slider?action=all" class="nav-item nav-link"
                           ><i class="bi bi-image-fill"></i>Slider</a
                        >
                    </div>
                    <%}%>
                </nav>
            </div>
            <!-- Sidebar End -->
            <%}%>
            <!-- Content Start -->
            <div class="content <%if(curStaff==null){%>ms-0 w-100<%}%>">
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand navbar-light sticky-top px-4 py-0" style="background-color: #1977cc;">

                  
                    <div class="navbar-nav align-items-center ms-auto">
                        <div class="nav-item dropdown">
                           
                        </div>
                        <div class="nav-item dropdown">
                           
                        </div>
                        <%if(curStaff!=null){%>
                        <div class="nav-item dropdown">
                            <a
                                href="#"
                                class="nav-link dropdown-toggle"
                                data-bs-toggle="dropdown"
                                >
                                <img
                                    class="rounded-circle me-lg-2"
                                    src="<%=curStaff.getProfileImage()%>"
                                    alt=""
                                    style="width: 40px; height: 40px"
                                    />
                                <span class="d-none d-lg-inline-flex"><%=curStaff.getStaffName()%></span>
                            </a>
                            <div
                                class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0"
                                >
                                <a href="#" class="dropdown-item">My Profile</a>
                                <a href="logout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                        <%}else{%>
                        <a href="staff?event=sent-to-login" id="login" class="btn btn-outline-primary ms-3 bg-light rounded-pill text-decoration-none"><span class="d-none d-md-inline">Login</a>
                        <%}%>
                    </div>
                </nav>
                <!-- Navbar End -->

                <!-- Blank Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row bg-light rounded align-items-center justify-content-center mx-0">
                        <div class="container-fluid">
                            <div class="layout-specing">
                                <form action="user" method="GET" id="searchform">
                                    <input type="hidden" name="action" value="search">

                                    <div class="d-flex gap-5">
                                        <input type="text" value="${searchValue}" class="form-control border rounded-pill" name="searchValue" id="searchValue" placeholder="Search...">
                                        <select name="status" class="form-select" aria-label="Default select example">
                                            <option <c:if test="${status == ''}">selected</c:if> value="">All</option>
                                            <option <c:if test="${status == '1'}">selected</c:if> value="1">Active</option>
                                            <option <c:if test="${status == '0'}">selected</c:if> value="0">Disable</option>
                                            </select>
                                            <select name="sortBy" class="form-select" aria-label="Default select example">
                                            <option value="FirstName" ${sortBy == 'FirstName' ? 'selected' : ''}>First Name</option>
                                            <option value="LastName" ${sortBy == 'LastName' ? 'selected' : ''}>Last Name</option>
                                            <option value="Status" ${sortBy == 'Status' ? 'selected' : ''}>Status</option>
                                        </select>
                                        <select name="sortOrder" class="form-select" aria-label="Default select example">
                                            <option value="asc" ${sortOrder == 'asc' ? 'selected' : ''}>Ascending</option>
                                            <option value="desc" ${sortOrder == 'desc' ? 'selected' : ''}>Descending</option>
                                        </select>
                         
                                        <button class="btn btn-block btn-primary mx-3" type="submit">Search</button>
                                    </div>
                                </form>



                                <div class="row">
                                    <div class="col-12 mt-4">
                                        <div class="table-responsive bg-white shadow rounded">
                                            <div class="col-md-4 mx-3 mt-3 d-flex">

                                            </div>
                                            <table id="example" class="table table-striped nowrap" style="width:100%">
                                                <thead>
                                                    <tr>
                                                        <th class="border-bottom p-3" >ID</th>
                                                        <th class="border-bottom p-3" >Full name</th>
                                                        <th class="border-bottom p-3" >Gender</th>
                                                        <th class="border-bottom p-3" >Email</th>
                                                        <th class="border-bottom p-3" >Phone number</th>
                                                        <th class="border-bottom p-3" >Status</th>
                                                        <th class="border-bottom p-3" ></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${userList}" var="a">
                                                        <tr>
                                                            <td class="p-3">${a.userID}</td>
                                                            <td class="p-3">${a.lastName} ${a.firstName}</td>
                                                            <c:if test="${a.gender eq 'Male'}">
                                                                <td class="p-3">Male</td>
                                                            </c:if>
                                                            <c:if test="${a.gender eq 'Female'}">
                                                                <td class="p-3">Female</td>
                                                            </c:if>
                                                            <td class="p-3">${a.email}</td>
                                                            <td class="p-3">${a.phoneNumber}</td>
                                                            <td class="p-3">
                                                                <div class="form-check form-switch">
                                                                    <input class="form-check-input" type="checkbox" role="switch" disabled
                                                                           data-userid="${a.userID}"
                                                                           <c:if test="${a.status == true}">checked value="1"</c:if>
                                                                               />
                                                                           <span class="badge <c:if test="${a.status == true}">bg-success</c:if><c:if test="${a.status != true}">bg-danger</c:if>"> 
                                                                        <c:if test="${a.status == true}">Active</c:if><c:if test="${a.status != true}">Inactive</c:if>
                                                                        </span>
                                                                    </div>

                                                                </td>


                                                                <td class="text-end p-3">
                                                                    <form action="user?action=details" method="POST">
                                                                            <input type="hidden" name="userID" value="${a.userID}">
                                                                    <button type="submit" class="btn btn-info">Details</button>
                                                                </form>

                                                            </td>


                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <c:set var="page" value="${page}"/>

                                            <nav aria-label="Page navigation">
                                                <ul class="pagination pagination-sm flex-sm-wrap justify-content-center mt-4">
                                                    <c:if test="${page > 1}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="${url}&page=${page - 1}" tabindex="-1">Previous</a>
                                                        </li>
                                                    </c:if>

                                                    <c:choose>
                                                        <c:when test="${num <= 7}">
                                                            <c:forEach begin="1" end="${num}" var="i">
                                                                <li class="page-item ${i==page?'active':''}">
                                                                    <a class="page-link" href="${url}&page=${i}">${i}</a>
                                                                </li>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:when test="${page < 5}">
                                                            <c:forEach begin="1" end="5" var="i">
                                                                <li class="page-item ${i==page?'active':''}">
                                                                    <a class="page-link" href="${url}&page=${i}">${i}</a>
                                                                </li>
                                                            </c:forEach>
                                                            <li class="page-item disabled"><a class="page-link" href="#">...</a></li>
                                                                <c:forEach begin="${num - 1}" end="${num}" var="i">
                                                                <li class="page-item">
                                                                    <a class="page-link" href="${url}&page=${i}">${i}</a>
                                                                </li>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:when test="${page >= num - 5}">
                                                            <c:forEach begin="1" end="2" var="i">
                                                                <li class="page-item">
                                                                    <a class="page-link" href="${url}&page=${i}">${i}</a>
                                                                </li>
                                                            </c:forEach>
                                                            <li class="page-item disabled"><a class="page-link" href="#">...</a></li>
                                                                <c:forEach begin="${num - 6}" end="${num}" var="i">
                                                                <li class="page-item ${i==page?'active':''}">
                                                                    <a class="page-link" href="${url}&page=${i}">${i}</a>
                                                                </li>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach begin="1" end="2" var="i">
                                                                <li class="page-item">
                                                                    <a class="page-link" href="${url}&page=${i}">${i}</a>
                                                                </li>
                                                            </c:forEach>
                                                            <li class="page-item disabled"><a class="page-link" href="#">...</a></li>
                                                                <c:forEach begin="${page - 2}" end="${page + 2}" var="i">
                                                                <li class="page-item ${i==page?'active':''}">
                                                                    <a class="page-link" href="${url}&page=${i}">${i}</a>
                                                                </li>
                                                            </c:forEach>
                                                            <li class="page-item disabled"><a class="page-link" href="#">...</a></li>
                                                                <c:forEach begin="${num - 1}" end="${num}" var="i">
                                                                <li class="page-item">
                                                                    <a class="page-link" href="${url}&page=${i}">${i}</a>
                                                                </li>
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <c:if test="${page < num}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="${url}&page=${page + 1}">Next</a>
                                                        </li>
                                                    </c:if>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               
            </div>
            <!-- Content End -->
        </div>
        <!-- Include Bootstrap JavaScript and jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>