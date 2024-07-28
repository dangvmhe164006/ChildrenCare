<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin dashboard</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script>
        <style>
            /* Custom CSS for larger circular avatar and dropdown spacing */
            .admin-avatar {
                border-radius: 50%;
                width: 48px;
                height: 48px;
                object-fit: cover;
            }
            .sidebar {
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                z-index: 100;
                padding: 90px 0 0;
                box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
                z-index: 99;
            }

            @media (max-width: 767.98px) {
                .sidebar {
                    top: 11.5rem;
                    padding: 0;
                }
            }

            .navbar {
                box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .1);
            }

            @media (min-width: 767.98px) {
                .navbar {
                    top: 0;
                    position: sticky;
                    z-index: 999;
                }
            }

            .sidebar .nav-link {
                color: #333;
            }

            .sidebar .nav-link.active {
                color: #0d6efd;
            }

            #pagination-container{
                display: flex;
                justify-content: center;
                align-items: center;
                list-style: none;
            }
            #pagination-container li{
                width: 25px;
                height: 25px;
                border-radius: 50%;
                margin-left: 0.5rem;
                margin-right: 0.5rem;
                text-align: center;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            #pagination-container a{
                text-decoration: none;
                font-weight: 500;
            }

            #pagination-container .active{
                background-color: #1977cc !important;
            }

            #pagination-container .inactive{
                background-color: #fff;
            }

            #pagination-container .active span {
                color: #fff;
                font-weight: 500;
            }
            #pagination-container .inactive a{
                color: #8f8f8f;
            }
            #pagination-container button{
                border-radius: 50%;
                border: 0px;
                background-color: white
            }

        </style>
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
            rel="stylesheet"
            />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
    </head>
    <body>
        <%@ page import="jakarta.servlet.http.HttpSession" %>
        <%@page import = "vn.fpt.edu.model.*" %>
        <%@page import = "vn.fpt.edu.Database.*" %>
        <%@page import = "java.util.*" %>
        <%
        UserDAO userDAO = new UserDAO();
        Staff admin = (Staff) request.getAttribute("admin");
        User user = (User) request.getAttribute("user");
        int maximumDayDiff = 7;
        String validate = request.getAttribute("validate")+"";
        
        %>
        <nav class="navbar navbar-light bg-light p-3">
            <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
                <a class="navbar-brand" href="#">
                   ChildrenCare
                </a>
                <button class="navbar-toggler d-md-none collapsed mb-3" type="button" data-toggle="collapse" data-target="#sidebar" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
            <div class="col-12 col-md-4 col-lg-2">
            </div>
            <div class="col-12 col-md-5 col-lg-8 d-flex align-items-center justify-content-md-end mt-3 mt-md-0">
                <div class="dropdown">

                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
                        Hello, <%=admin.getStaffName()%>
                        <img src="<%=admin.getProfileImage()%>" alt="Admin Avatar" class="admin-avatar">
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <li><a class="dropdown-item" href="admin?action=logout">Sign out</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
              <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                    <div class="position-sticky">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="admin">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                                    <span class="ml-2">Home</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="#">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                                    <span class="ml-2">Users</span>
                                </a>
                            </li>
                        
                        </ul>
                    </div>
                </nav>
                
                
                <main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
                    <div class="mb-4 py-3 border-bottom d-flex justify-content-between align-items-center">
                        <h5>User Detail</h5>
                        <a href="user?action=send-to-adduser" class="ms-text-primary text-decoration-none"><i class="fas fa-pencil-alt ms-text-primary"></i> Add New User</a>
                    </div>

                    <div class="container">
                        <div class="main-body">
                            <div class="row gutters-sm">
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="d-flex flex-column align-items-center text-center">
                                                <img src="<%=user.getProfileImage()%>" alt="User" class="rounded-circle"style="object-fit: cover;object-position: top;" width="150px" height="150px">
                                                <div class="mt-3 d-flex flex-column align-items-center">
                                                    <h4><%=user.getFirstName() + " " + user.getLastName()%></h4>
                                                    <p class="text-secondary mb-1"><%=user.getGender()%></p>
                                                    <p class="text-muted font-size-sm"><%=user.getAddress()%></p>
                                                    <div class="form-check form-switch d-flex align-items-center">
                                                        <input class="form-check-input me-2" type="checkbox" id="flexSwitchCheckDefault" <%=user.isStatus()?"checked":""%> onchange="toggleStatusUser(<%=user.getUserID()%>)" style="height: 24px;width: 47px;">
                                                        <%if(user.isStatus()){%><p class="status bg-success text-white m-0 p-1 fit-content-width rounded-1 text-center">Active</p> 
                                                        <%}else{%> 
                                                        <p class="status bg-danger text-light m-0 p-1 fit-content-width rounded-1 text-center">Inactive</p><%}%>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="col-md-8">
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Full Name</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <%=user.getFirstName() + " " + user.getLastName()%>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Email</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <%=user.getEmail()%>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Phone</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <%=user.getPhoneNumber()%>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Role</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    User
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <h6 class="mb-0">Address</h6>
                                                </div>
                                                <div class="col-sm-9 text-secondary">
                                                    <%=user.getAddress()%>
                                                </div>
                                            </div>
                                            <hr>
                                        </div>
                                    </div>

                                    <div class="row gutters-sm">
                                        <div class="col-sm-6 mb-3">
                                            <div class="card h-100">
                                                <div class="card-body">
                                                    <h6 class="d-flex align-items-center mb-3">Reservation History</h6>
                                                    <table class="child-table" style="width: 100%;">
                                                        <tr>
                                                            <th>Reserved date</th>
                                                            <th>Service</th>
                                                            <th>Cost</th>
                                                            <th>Status</th>
                                                        </tr>
                                                        <%ReservationDAO reservationDAO = new ReservationDAO();
                                                        ServiceDAO serviceDAO = new ServiceDAO();
                                                        List<Reservation> reservations = reservationDAO.getReservationByUserID("1");
                                                        for (Reservation reservation : reservations) {%>
                                                        <tr>
                                                            <td><%=reservation.getReservationDate()%></td>
                                                            <td><%=serviceDAO.getServiceByID(reservation.getServiceID()+"").getTitle()%></td>
                                                            <td><%=reservation.getCost()%></td>
                                                            <td><%if(reservation.getStatus().equals("done")){%>
                                                                <p class="bg-success rounded-2 text-white m-0" style="width: fit-content;"><%=reservation.getStatus()%></p>
                                                                <%}else if(reservation.getStatus().equals("done")){%>
                                                                <p class="bg-danger rounded-2 text-white m-0" style="width: fit-content;"><%=reservation.getStatus()%></p>
                                                                <%}else{%>
                                                                <p class="bg-primary rounded-2 text-white m-0" style="width: fit-content;"><%=reservation.getStatus()%></p>
                                                                <%}%></td>
                                                        </tr>
                                                        <%}%>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mb-3">
                                            <div class="card h-100">
                                                <div class="card-body">
                                                    <h6 class="d-flex align-items-center mb-3">Children List</h6>
                                                    <table class="child-table" style="width: 100%;">
                                                        <tr>
                                                            <th>ChildID</th>
                                                            <th>Full Name</th>
                                                            <th>Date of Birth</th>
                                                            <th>Gender</th>
                                                        </tr>
                                                        <%ChildrenDAO childrenDAO = new ChildrenDAO();
                                                        List<Children> childrenList = childrenDAO.getListChildrenByUserId(user.getUserID()+"");
                                                        for (Children children : childrenList) {%>
                                                        <tr>
                                                            <td><%=children.getChildID()%></td>
                                                            <td><%=children.getChildName()%></td>
                                                            <td><%=children.getBirthday()%></td>
                                                            <td><%=children.getGender()%></td>
                                                        </tr>
                                                        <%}%>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
 
                </main>
            </div>
        </div>
        <script src="./resources/js/user-list-admin.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js" integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script>
            function  toggleStatusUser(userID){
      window.location.href = "user?action=onoff-status&id="+userID;
  }
        </script>
    </body>
</html>
