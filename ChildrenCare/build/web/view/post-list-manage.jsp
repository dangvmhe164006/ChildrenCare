<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import = "vn.fpt.edu.model.*" %>
<%@page import = "vn.fpt.edu.Database.*" %>
<%@page import = "vn.fpt.edu.java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Staff dashboard</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta content="" name="keywords" />
        <meta content="" name="description" />

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon" />

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
            rel="stylesheet"
            />

        <!-- Icon Font Stylesheet -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
            rel="stylesheet"
            />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
            rel="stylesheet"
            />

        <!-- Libraries Stylesheet -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="./resources/css/staff-dashboard.css">
        <link rel="stylesheet" href="./resources/css/services-style.css">
    </head>
    <body>
        <%
String email = (String) session.getAttribute("email");
StaffDAO staffDAO = new StaffDAO();
Staff curStaff = staffDAO.getStaffByStaffEmail(email);
boolean isManager = false;
        %>
        <div class="container-fluid position-relative bg-white d-flex p-0">
            <%if(curStaff!=null){
            if(curStaff.getRole().equals("manager")) isManager=true;%>
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
                    <%if(isManager){%>
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
                        <a href="user?action=search" class="nav-item nav-link"
                           ><i class="bi bi-people-fill"></i>User</a
                        >
                    </div>
                    <div class="navbar-nav w-100 text-light">
                        <a href="service?event=manage" class="nav-item nav-link"
                           ><i class="fas fa-stethoscope"></i>Services</a
                        >
                    </div>
                    <div class="navbar-nav w-100 text-light">
                        <a href="postManage" class="nav-item nav-link active"
                           ><i class="bi bi-file-earmark-post"></i>Post</a
                        >
                    </div>
                    <%}%>
                </nav>
            </div>
            <!-- Sidebar End -->
            <%}%>
            <div class="content <%if(curStaff==null){%>ms-0 w-100<%}%>">
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand navbar-light sticky-top px-4 py-0" style="background-color: #1977cc;">

                    <a href="#" class="sidebar-toggler flex-shrink-0 text-decoration-none text-light">
                        <i class="fa fa-bars"></i>
                    </a>
                    <form class="d-none d-md-flex ms-4">
                        <input
                            class="form-control border-0"
                            type="search"
                            placeholder="Search"
                            />
                    </form>
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
                    <div
                        class="row bg-light rounded align-items-center justify-content-center mx-0"
                        >
                        <div class="mb-4 px-4 py-3 border-bottom d-flex justify-content-between align-items-center">
                            <h4>POST MANAGEMENT</h4>
                            <a href="postDetailManage?event=add" class="ms-text-primary font-weight-bold">Add Post</a>
                        </div>

                        <div class="col-md-12">
                            <div class="d-flex flex-column align-items-center justify-content-center mt-2">
                                <div class="container row mt-5 mb-4">
                                    <div class="col-md-12">
                                        <!-- Services List -->
                                        <table class="table">
                                            <thead class="text-light" style="background: #1977cc;">
                                                <tr>
                                                
                                                    <th scope="col">Thumbnail</th>
                                                    <th scope="col">Title</th>
                                                    <th scope="col">Category</th>
                                                    <th scope="col">Brief</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="service-list">
                                                <c:forEach var="l" items="${list}">

                                                    <tr id="${l.getPostID()}" class="service p-3 " ${l.isStatusPost()}>
                                                        <td><img src="${l.getThumbnail()}" alt="ìmg" style="width: 12rem;height: 8rem;object-fit: cover;" /></td>
                                                        <td>${l.getTitle()}</td>
                                                        <td>${l.getCategoryPost()}</td>
                                                        <td>${l.getBriefInfo()} </td>
                                                        <c:if test="${l.isStatusPost()}"><td><p class="status text-success mt-2">Active</p></td></c:if>
                                                        <c:if test="${!l.isStatusPost()}"><td><p class="status text-black-50 mt-2">Inactive</p></td></c:if>
                                                            <td>
                                                                <div class="d-flex h-50 align-content-center flex-wrap" >
                                                                    <div class="d-flex">
                                                                    <c:if test="${l.isStatusPost()}"> <a href="postManage?event=hide&postId=${l.getPostID()}"><button class="button-icon me-2 showhide hide-service-button"><img src="resources/img/icon/hide.png" alt="alt"/></button></a> </c:if>
                                                                    <c:if test="${!l.isStatusPost()}"> <a href="postManage?event=show&postId=${l.getPostID()}"><button class="button-icon me-2 showhide show-service-button"><img src="resources/img/icon/visual.png" alt="alt"/></button> </c:if>
                                                                        <button class="button-icon"><a href="postDetailManage?event=update&postID=${l.getPostID()}"><img src="resources/img/icon/pen.png" alt="alt"/></a></button>
                                                                </div></div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                        <form action="postManage">
                                           
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center mb-5" id="pagination-container">
                                <c:forEach var="p" begin="1" end="${numOfPage}">
                                    <input class="pagination-btn ms-2 active" type="submit" name="page" value="${p}" /> 
                                </c:forEach>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>

                <!-- Blank End -->

                <!-- Footer Start -->
                <div class="mt-4">
                    <jsp:include page="layout/footer.jsp" />
                </div>
                <!-- Footer End -->
            </div>
            <!-- Content End -->
        </div>
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"
        ></script>

        
       
    </body>
</html>
