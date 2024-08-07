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
    </head>

    <body>
        <%
       String email = (String) session.getAttribute("email");
       StaffDAO staffDAO = new StaffDAO();
       ReservationDAO reservationDAO = new ReservationDAO();
       ChildrenDAO childrenDAO = new ChildrenDAO();
       ServiceDAO serviceDAO = new ServiceDAO();
       UserDAO userDAO = new UserDAO();
       String reserdId = request.getAttribute("reserdid") + "";
       Reservation reservation = reservationDAO.getReservationByID(Integer.parseInt(reserdId));
       CategoryServiceDAO categoryServiceDAO = new CategoryServiceDAO();
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
                        <a href="reservationcontactmanager?event=reservation-list" class="nav-item nav-link active"
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

                    <a href="#" class="sidebar-toggler flex-shrink-0 text-decoration-none text-light">
                        <i class="fa fa-bars"></i>
                    </a>
                
                    <div class="navbar-nav align-items-center ms-auto">
                     
                     
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
                <%Children thisChild = childrenDAO.getChildrenByChildrenId(reservation.getChildID()+"");
                User thisUser = userDAO.getUserByID(reservation.getUserID());%>
                <!-- Blank Start -->
                <div class="container-fluid pt-4 px-4">
                    <div
                        class="row bg-light rounded align-items-center justify-content-center mx-0"
                        >
                        <div class="col-md-12 p-0">
                            <div class="d-flex mb-4 px-4 py-3 border-bottom d-flex justify-content-between align-items-center">
                                <h4>RESERVATION DETAIL</h4>
                            </div>
                            <div class="row px-4 justify-content-between">
                                <div class="col-md-5 d-flex flex-column justify-content-center align-items-start">

                                    <div class="d-flex justify-content-center"><h3>Customer</h3></div>

                                    <div class="d-flex">
                                        <img src="<%=thisUser.getProfileImage()%>" alt="dr" class="rounded-3 object-cover me-3" width="100px" height="100px"/>
                                        <div>
                                            <h5><%=thisUser.getLastName()+" " +thisUser.getFirstName()%></h5>
                                            <p class="m-0 text-black-50"><i class="fas fa-envelope"></i>  <%=thisUser.getEmail()%></p>
                                            <p class="m-0 text-black-50"><i class="fas fa-phone"></i>  <%=thisUser.getPhoneNumber()%></p>
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-center"><h3 class="mt-3">Patient</h3></div>
                                    <div class="d-flex">
                                        <img src="<%=thisChild.getImage()%>" alt="dr" class="rounded-3 object-cover me-3" width="100px" height="100px"/>
                                        <div>
                                            <h5><%=thisChild.getChildName()%></h5>
                                            <p class="m-0 text-black-50"><%=thisChild.getAge()%> years old</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 d-flex justify-content-center align-items-start">
                                    <%Staff thisStaff = staffDAO.getStaffByStaffId(reservation.getStaffID());
                                    List<Staff> staffList = staffDAO.getStaffsBySlot((String) pageContext.getAttribute("ReservationDateString"), (String) pageContext.getAttribute("ReservationSlotString"));%>
                                    <div class="d-flex me-2"  id="doctorBadge-<%=reservation.getReservationID()%>">
                                        <img src="<%=thisStaff.getProfileImage()%>" alt="dr" class="rounded-circle object-cover me-3" width="70px" height="70px"/>
                                        <div>
                                            <h4>Dr: <%=thisStaff.getFullName()%></h4>
                                            <p class="m-0 text-black-50"><i class="fas fa-envelope"></i>  <%=thisStaff.getEmail()%></p>
                                            <p class="m-0 text-black-50"><i class="fas fa-phone"></i>  <%=thisStaff.getPhoneNumber()%></p>
                                            <p class="text-black-50"><%=thisStaff.getGender()%></p>
                                        </div>
                                    </div>
                                    <div class="dropdown">
                                        <button style="border: 0px; padding: 0px" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                            <span class="badge bg-light"><img src="resources/img/icon/edit-tool.png" alt="alt" width="50px"></span>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink" style="max-height: 300px;overflow-y: auto; ">
                                            <%for (Staff staff : staffList) {%>
                                            <li><a class="dropdown-item status-change" href="#" onclick="changeDoctor(this, <%=staff.getStaffID()%>,<%=reservation.getReservationID()%>)"style="height: 90px;overflow: hidden;">
                                                    <div class="d-flex me-2">
                                                        <img src="<%=staff.getProfileImage()%>" alt="dr" class="rounded-circle object-cover me-3" width=70px" height="70px"/>
                                                        <div>
                                                            <h4>Dr: <%=staff.getFullName()%></h4>
                                                            <p class="m-0 text-black-50"><i class="fas fa-envelope"></i>  <%=staff.getEmail()%></p>
                                                            <p class="m-0 text-black-50"><i class="fas fa-phone"></i>  <%=staff.getPhoneNumber()%></p>
                                                            <p class="text-black-50"><%=staff.getGender()%></p>
                                                        </div>
                                                    </div>
                                                </a></li>

                                            <%}%>
                                        </ul>

                                    </div>




                                </div>
                            </div>
                            <div class="row px-4 justify-content-between mt-4">
                                <div class="col-md-8">
                                    <p><strong>Service:</strong><%=serviceDAO.getServiceByID(reservation.getServiceID()+"").getTitle()%></p>
                                    <p><strong>Cost:</strong><%=serviceDAO.getServiceByID(reservation.getServiceID()+"").getSalePrice()>0 ? serviceDAO.getServiceByID(reservation.getServiceID()+"").getSalePrice() : serviceDAO.getServiceByID(reservation.getServiceID()+"").getOriginalPrice()%></p>
                                    <p><strong>Payment Method:</strong> COD</p>
                                </div>
                                <div class="col-md-4">
                                    <p><strong>Reservation ID:</strong> <%=reservation.getReservationID()%></p>
                                    <p><strong>Reservation date:</strong> <%=reservation.getCreatedDate()%></p>
                                    <p><strong>Confirm Date: </strong><%=reservation.getReservationDate()%></p>
                                    <div class="dropdown">
                                        <button style="border: 0px; padding: 0px" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                            <span class="badge bg-primary"  id="statusBadge-<%=reservation.getReservationID()%>"><%=reservation.getStatus()%></span>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                            <li><a class="dropdown-item status-change" href="#" onclick="changestatus(this, <%=reservation.getReservationID()%>)">cancel</a></li>
                                            <li><a class="dropdown-item status-change" href="#" onclick="changestatus(this, <%=reservation.getReservationID()%>)">pending</a></li>
                                            <li><a class="dropdown-item status-change" href="#" onclick="changestatus(this, <%=reservation.getReservationID()%>)">waiting for examination</a></li>
                                            <li><a class="dropdown-item status-change" href="#" onclick="changestatus(this, <%=reservation.getReservationID()%>)">done</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                          
                        </div>
                    </div>
                </div>
                <!-- Blank End -->

                <!-- Footer Start -->
                
                <!-- Footer End -->
            </div>
            <!-- Content End -->

        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
        
                                                function changestatus(a, uid) {
                                                                    var text = a.textContent;
                                                                    var textchange = document.getElementById("statusBadge-" + uid);
                                                                    textchange.textContent = text;

                                                                    // Gửi yêu cầu Ajax đến servlet
                                                                    var xhr = new XMLHttpRequest();
                                                                    xhr.open("POST", "reservationcontactmanager?event=updatestatus&status=" + text + "&reservationID=" + uid, true);

                                                                    xhr.onload = function () {

                                                                    };

                                                                    xhr.onerror = function () {

                                                                    };

                                                                    xhr.send();
                                                                }
                                                function changeDoctor(a, doctorId, reservationID) {
                                                    var text = a.innerHTML;
                                                    var textchange = document.getElementById("doctorBadge-" + reservationID);
                                                    textchange.innerHTML = text;

                                                    // Gửi yêu cầu Ajax đến servlet
                                                    var xhr = new XMLHttpRequest();
                                                    xhr.open("POST", "reservationcontactmanager?event=updatedoctor&doctorID=" + doctorId + "&reservationID=" + reservationID, true);

                                                    xhr.onload = function () {

                                                    };

                                                    xhr.onerror = function () {

                                                    };

                                                    xhr.send();
                                                }
        </script>
    </body>
</html>

