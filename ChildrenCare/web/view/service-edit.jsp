<%@page import = "vn.fpt.edu.model.*" %>
<%@page import = "vn.fpt.edu.Database.*" %>
<%@page import = "java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
                        <a href="service?event=manage" class="nav-item nav-link active"
                           ><i class="fas fa-stethoscope"></i>Services</a
                        >
                    </div>
                    <div class="navbar-nav w-100 text-light">
                        <a href="postManage" class="nav-item nav-link"
                           ><i class="bi bi-file-earmark-post"></i>Blog</a
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
                    <div
                        class="row bg-light rounded align-items-center justify-content-center mx-0"
                        >
                        <div class="mb-4 px-4 py-3 border-bottom d-flex justify-content-between align-items-center">
                            <h4>SERVICE EDIT</h4>
                            <a href="service?event=sent-to-add" class="ms-text-primary font-weight-bold">Add Service</a>
                        </div>
                        <div class="col-md-12">
                            <%ServiceDAO serviceDAO = new ServiceDAO();
                        CategoryServiceDAO categoryServiceDAO = new CategoryServiceDAO();%>
                            <div class="d-flex flex-column align-items-center justify-content-start">
                                <div class="container row mt-5 mb-4">

                                    <%  Service service = (Service) request.getAttribute("service");
                                            String titleErr = (request.getAttribute("titleErr") + "").equals("null") ? "" : (request.getAttribute("titleErr") + "");
                                            String originalPriceErr = (request.getAttribute("originalPriceErr") + "").equals("null") ? "" : (request.getAttribute("originalPriceErr") + "");
                                            String salePriceErr = (request.getAttribute("salePriceErr") + "").equals("null") ? "" : (request.getAttribute("salePriceErr") + "");
                                    %>
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <%String validate = request.getAttribute("validate")+"";
                    if(!validate.equals("null")&&validate.equals("false")){%>
                                                <h4  class="text-danger text-start fw-bold">Update Fail!!</h4>
                                                <%}%>
                                            </div>

                                        </div>
                                        <form action="service?event=edit-service&ServiceID=<%=service.getServiceID()%>" method="POST" enctype="multipart/form-data">
                                            <div class="row">    
                                                <div class="col-md-4">
                                                    <div>
                                                        <img src="<%=service.getThumbnail()%>" alt="ìmg" class="w-100 h-100 object-contain" /></div>
                                                    <div class="form-group mt-3">
                                                        <label for="serviceImage">Service Image:</label>
                                                        <input type="file" class="form-control-file" id="serviceImage" name="serviceImage">
                                                    </div>
                                                    <h5 class="d-flex justify-content-center mt-3">- Or -</h5>
                                                    <div class="form-group mt-3">
                                                        <label for="serviceURL">Service Image:</label>
                                                        <input type="text" class="form-control" id="serviceURL" name="serviceURL">
                                                    </div>
                                                </div>
                                                <div class="col-md-8 ps-5">
                                                    <div class="d-flex align-items-baseline">
                                                        <p class="text-muted me-2">ID: </p>
                                                        <input class="form-control text-muted" type="text"  value="<%=service.getServiceID()%>" readonly  />
                                                    </div>
                                                    <div>
                                                        <div class="d-flex align-items-baseline">
                                                            <p class="text-muted me-2">Title: </p>
                                                            <input class="form-control" type="text" name="Title" value="<%=service.getTitle()%>"  />
                                                        </div>
                                                        <%if(!titleErr.equals("null")){%>    <p class="text-danger"><%=titleErr%></p><%}%>
                                                    </div>
                                                    <div>
                                                        <p class="text-muted">Brief: </p>
                                                        <textarea class="form-control text-muted" rows="4" cols="50" name="Brief" value="<%=service.getBrief()%>"><%=service.getBrief()%></textarea>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <select class="form-select text-primary mt-3 mb-4 w-75" name="status" >
                                                                <%if(service.getStatus()){%>
                                                                <option value="active" selected>Active</option>
                                                                <option value="inactive">Inactive</option>
                                                                <%}else{%>
                                                                <option value="active">Active</option>
                                                                <option value="inactive" selected>Inactive</option>
                                                                <%}%>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <select class="form-select text-primary mt-3 mb-4 w-75" name="serviceType"  class="form-select">
                                                                <%List<CategoryService> categoryServiceList = categoryServiceDAO.getAllCategoryServices();
                                                for (CategoryService categoryService : categoryServiceList) {
                                                if(service.getCategoryID() == categoryService.getCategoryID()){ %>
                                                                <option value="<%=categoryService.getCategoryID()%>" selected><%=categoryService.getCategoryName()%></option>
                                                                <%}else{%>
                                                                <option value="<%=categoryService.getCategoryID()%>"><%=categoryService.getCategoryName()%></option>
                                                                <%}%>
                                                                <%}%>

                                                            </select>
                                                        </div>   
                                                    </div>
                                                    <div class="d-flex">
                                                        <div class="col-md-6"><p class="text-muted">Price: </p>
                                                            <input class="form-control w-50" type="number" value="<%=service.getOriginalPrice()%>" name="OriginalPrice" />
                                                            <%if(!originalPriceErr.equals("null")){%>    <p class="text-danger"><%=originalPriceErr%></p><%}%>
                                                        </div>
                                                        <div class="col-md-6"><p class="text-muted">Sale price: </p>
                                                            <input class="form-control w-50" type="number" value="<%=service.getSalePrice()%>" name="SalePrice" />
                                                            <%if(!salePriceErr.equals("null")){%>    <p class="text-danger"><%=salePriceErr%></p><%}%>
                                                        </div>
                                                    </div>

                                                    <div>
                                                        <p class="text-muted">Description: </p>
                                                        <textarea class="form-control text-muted" rows="6" cols="50" value="<%=service.getServiceDetail()%>" name="Description"><%=service.getServiceDetail()%></textarea>
                                                    </div>

                                                    <div class="d-flex justify-content-center">
                                                        <input class="btn btn-primary mt-3 w-25" type="submit" value="Update" />
                                                    </div>
                                                </div>
                                        </form>
                                    </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        
        </div>
        <!-- Content End -->

    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="./resources/js/services-manage-script.js"></script>
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

    <!-- Template Javascript -->
    <script>
        document.querySelector('.sidebar-toggler').addEventListener('click', function () {
            var sidebar = document.querySelector('.sidebar');
            var content = document.querySelector('.content');

            sidebar.classList.toggle('open');
            content.classList.toggle('open');

            return false;
        });
    </script>
</body>
</html>

