
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
       StaffScheduleDAO staffScheduleDAO = new StaffScheduleDAO();
       StaffDAO staffDAO = new StaffDAO();
       String email = (String) session.getAttribute("email");
       String action = (String) request.getAttribute("action");
       String scheduleID = (String) request.getAttribute("scheduleID");
       String errorMessage = (String) request.getAttribute("errorMessage");
       Staff curStaff = staffDAO.getStaffByStaffEmail(email);
       StaffSchedule staffSchedule = staffScheduleDAO.getSchedule(scheduleID);
       
       boolean isStaff = false;
        %>
        <div class="container-fluid position-relative bg-white d-flex p-0">
            <%if(curStaff!=null){        
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
                        <a href="staff?event=send-to-schedules" class="nav-item nav-link active">
                            <i class="bi bi-calendar3"></i>Schedules
                        </a>
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

                <div class="container-fluid pt-4 px-4">
                    <div class="row bg-light rounded align-items-center justify-content-center mx-0">
                        <div class="mb-4 px-4 py-3 border-bottom d-flex justify-content-between align-items-center">
                            <% if (action.equals("add")) { %>
                            <h4>Add new schedule</h4>
                            <% } else { %>
                            <h4>Edit schedule</h4>
                            <% } %>
                        </div>
                        <form class="needs-validation" action="sms?event=<%=action%>" method="POST">
                            <% if (action.equals("edit")) { %>
                            <input type="text" name="scheduleID" value="<%=staffSchedule.getScheduleID()%>" hidden="">
                            <% } %>
                            <input type="hidden" name="staffID" value="<%=curStaff.getStaffID()%>">
                            <div class="form-row">
                                <div class="col-md-6 mb-3">
                                    <label for="validationCustom007">Workday</label>
                                    <div class="input-group">
                                        <input type="date" class="form-control" name="workDay" value="<%=(action.equals("add")) ? "" : staffSchedule.getWorkday() %>" placeholder="Enter Working Date" required="">
                                    </div>
                                    <label style="color:orange;">The entered date cannot be a date in the past and must be at least 1 day in advance.</label>
                                </div>
                                <div class="col-md-6 mb-3 px-3">
                                    <label for="validationCustom008">Working slots</label>
                                    <div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" name="workSlot" value="1" <% if (action.equals("edit") && staffSchedule.getSlot() == 1) out.print("checked"); %> >
                                            <label class="form-check-label">Slot 1</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" name="workSlot" value="2" <% if (action.equals("edit") && staffSchedule.getSlot() == 2) out.print("checked"); %> >
                                            <label class="form-check-label">Slot 2</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" name="workSlot" value="3" <% if (action.equals("edit") && staffSchedule.getSlot() == 3) out.print("checked"); %> >
                                            <label class="form-check-label">Slot 3</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" name="workSlot" value="4" <% if (action.equals("edit") && staffSchedule.getSlot() == 4) out.print("checked"); %> >
                                            <label class="form-check-label">Slot 4</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" name="workSlot" value="5" <% if (action.equals("edit") && staffSchedule.getSlot() == 5) out.print("checked"); %> >
                                            <label class="form-check-label">Slot 5</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" name="workSlot" value="6" <% if (action.equals("edit") && staffSchedule.getSlot() == 6) out.print("checked"); %> >
                                            <label class="form-check-label">Slot 6</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-warning mt-4 ms-3 me-2 d-inline w-20" type="reset">Reset</button>
                            <button class="btn btn-primary mt-4 d-inline w-20" type="submit">Save</button>
                            <% if (errorMessage != null) { %>
                            <h5 style="color: red;"><%=errorMessage%></h5>
                            <% } %>
                        </form>
                    </div>
                </div>




            </div>

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

