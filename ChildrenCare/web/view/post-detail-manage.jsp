<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import = "vn.fpt.edu.model.*" %>
<%@page import = "vn.fpt.edu.Database.*" %>
<%@page import = "java.util.*" %>
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
        <link rel="stylesheet" href="./resources/css/post-style.css">
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
                      <div class="navbar-nav w-100 text-light">
                        <a href="user?action=search" class="nav-item nav-link"
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
                        <a href="postManage" class="nav-item nav-link active"
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
                                <a href="logout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                        <%}else{%>
                        <a href="staff?event=sent-to-login" id="login" class="btn btn-outline-primary ms-3 bg-light rounded-pill text-decoration-none"><span class="d-none d-md-inline">Login</a>
                        <%}%>
                    </div>
                </nav>
                <!-- Navbar End -->

                <!-- Blog Start -->
                <div class="container py-5" id="blog-list">
                    <div class="row g-5">
                        <div class="col-lg-8">
                            <!-- Blog Detail Start -->
                            <form action="postDetailManage" method="post" enctype="multipart/form-data" onsubmit="return handleFormSubmit(this);">
                                <div class="mb-5">
                                    <div class="form-group mt-3">
                                        <label for="Thumbnail">Post Image:</label>
                                        <input type="file" name="images" id="file" class="inputfile form-control" onchange="readURL(this)" accept="image/*"/>
                                        <img id="imagePreview" src="#" alt="Image Preview" style="display:none; max-width: 200px; margin-top: 10px;"/>
                                        <button type="button" onclick="clearImage()" class="btn btn-secondary mt-2">Clear Image</button>
                                    </div>
                                    
                                    <input class="form-control text-muted" type="hidden" name="postID" value="${post.getPostID()}" readonly  />
                                       
                                    <br>
                                    <div>
                                        <div class="d-flex align-items-baseline">
                                            <p class="text-muted me-2">Title:</p>
                                            <input class="form-control" type="text" name="Title" value="${post.getTitle()}" />
                                        </div>
                                        <c:if test="${! empty errorMessage1}">
                                            <h5 class="text-danger text-start fw-bold">${errorMessage1}</h5>
                                        </c:if>
                                        <div>
                                            <p class="text-muted">Brief:</p>
                                            <textarea class="form-control text-muted" rows="4" cols="50" name="Brief">${post.getBriefInfo()}</textarea>
                                        </div>
                                        <c:if test="${! empty errorMessage2}">
                                            <h5 class="text-danger text-start fw-bold">${errorMessage2}</h5>
                                        </c:if>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <p>Status</p>
                                            <select class="form-select text-primary mt-3 mb-4 w-75" name="status">
                                                <c:if test="${post.isStatusPost()}">
                                                    <option value="true" selected>Active</option>
                                                    <option value="false">Inactive</option>
                                                </c:if>
                                                <c:if test="${!post.isStatusPost()}">
                                                    <option value="false">Inactive</option>
                                                    <option value="true" selected>Active</option>
                                                </c:if>
                                            </select>
                                        </div>
                                        <div class="col-md-4">
                                            <p>Category</p>
                                            <select class="form-select text-primary mt-3 mb-4 w-75" name="postCategory">
                                                <c:forEach var="c" items="${categoryList}">
                                                    <option value="${c}">${c}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div>
                                        <p class="text-muted">Content:</p>
                                        <textarea class="form-control text-muted" rows="6" cols="50" name="Content">${post.getContent()}</textarea>
                                    </div>
                                    <c:if test="${! empty errorMessage3}">
                                        <h5 class="text-danger text-start fw-bold">${errorMessage3}</h5>
                                    </c:if>
                        
                                    <div class="d-flex justify-content-center">
                                        <input hidden="" name="event" value="${event}">
                                        <input class="btn btn-primary mt-3 w-25" type="submit" value="${event}" name="event" />
                                    </div>

                                </div>
                            </form>
                            <!-- Blog Detail End -->
                        </div>
                    </div>
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

           

            <script>
                function readURL(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            document.getElementById('imagePreview').src = e.target.result;
                            document.getElementById('imagePreview').style.display = 'block';
                        };
                        reader.readAsDataURL(input.files[0]);
                    }
                }

                function clearImage() {
                    var fileInput = document.getElementById('file');
                    var imagePreview = document.getElementById('imagePreview');
                    fileInput.value = '';
                    imagePreview.src = '#';
                    imagePreview.style.display = 'none';
                }
            </script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>


