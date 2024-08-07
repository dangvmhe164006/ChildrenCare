<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin dashboard</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script>
        <!--<script rel="stylesheet" href="./resources/css/admin-dashboard.css"></script>-->
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
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
    </head>
    <body>
        <%@ page import="jakarta.servlet.http.HttpSession" %>
        <%@page import= "vn.fpt.edu.model.*" %>
        <%@page import= "vn.fpt.edu.Database.*" %>
        <%@page import= "java.util.*" %>
        <%
        UserDAO userDAO = new UserDAO();
        Staff admin = (Staff) request.getAttribute("admin");
        
        int maximumDayDiff = 7;
        %>
        <nav class="navbar navbar-light bg-light p-3">
            <div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
                <a class="navbar-brand" href="#">
                    Simple Dashboard
                </a>
                <button class="navbar-toggler d-md-none collapsed mb-3" type="button" data-toggle="collapse" data-target="#sidebar" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
            <div class="col-12 col-md-4 col-lg-2">
                <input class="form-control form-control-dark" type="text" placeholder="Search" aria-label="Search">
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
                        <h5>User Manage</h5>
                        <a href="user?action=send-to-adduser" class="ms-text-primary text-decoration-none"><i class="fas fa-pencil-alt ms-text-primary"></i> Add New User</a>
                    </div>
                    <div class="col-md-12 row justify-content-between mb-3">
                        <div class="col-md-3">
                            <input type="text" name="name" class="form-control" placeholder="Search By Name" id="nameUser">
                            <input type="text" name="email" class="form-control mt-2" placeholder="Search By Email" id="emailUser">
                            <input type="text" name="mobile" class="form-control mt-2" placeholder="Search By Mobile" id="mobileUser">
                        </div>
                        <div class="col-md-3">
                            <select class="form-select" id="gender">
                                <option selected value="">Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">FeMale</option>
                            </select>

                            <select class="form-select mt-3" id="status">
                                <option selected value="">Status</option>
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>

                        </div>
                        <div class="col-md-3">
                            <select class="form-select" id="role">
                                <option selected value="">Role</option>
                                <option value="user">Customer</option>
                                <option value="doctor">Doctor</option>
                                <option value="manager">Manager</option>
                            </select>

                            <select class="form-select mt-3" id="sort">
                                <option selected value="">Sort By</option>
                                <option value="ID">Sort By ID</option>
                                <option value="Name">Sort By Name</option>
                                <option value="Gender">Sort By Gender</option>
                                <option value="Email">Sort By Email</option>
                                <option value="PhoneNumber">Sort By Mobile</option> 
                                <option value="Role">Sort By Role</option>
                                <option value="Status">Sort By status</option>
                            </select>

                        </div>
                    </div>
                    <div class="col-md-12">
                        <table class="table table-striped table-hover">
                            <thead class="text-light" style="background: #1977cc;">
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Mobile</th>
                                    <th scope="col">Role</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Detail</th>
                                </tr>
                            </thead>
                            <tbody id="user-list">
                                <%List<User> users = userDAO.getAllUsersByAdmin(1, 10, "", "", "", "", "", "", 1);
                                for (User user : users) {%>
                                <tr>
                                    <td><%=user.getUserID()%></td>
                                    <td>
                                        <div class="d-flex">
                                            <img src="<%=user.getProfileImage()%>" alt="avt" width="27px" height="27px" class="rounded-circle me-2"/>
                                            <span><%=user.getFirstName()%></span>
                                        </div>
                                    </td>
                                    <td><%=user.getGender()%></td>
                                    <td><%=user.getEmail()%></td>
                                    <td><%=user.getPhoneNumber()%></td>
                                    <td><%=user.getRole()%></td>
                                    <td><%=user.isStatus()?"Active":"Inactive"%></td>
                                    <td>
                                        <form action="user?action=send-to-userdetail-admin" method="POST">
                                            <input type="hidden" name="role" value="<%=user.getRole()%>">
                                            <input type="hidden" name="id" value="<%=user.getUserID()%>">
                                            <button type="submit" class="btn py-0"><img src="resources/img/icon/detail.png" alt="alt" width="25px"/></button>
                                        </form>
                                    </td>    
                                </tr>
                                <%}%>
                            </tbody>
                        </table>

                        <ul id="pagination-container">
                            <%int totalRecord = userDAO.countTotalUserByAdmin("", "", "", "", "", 3);
                                    if(totalRecord<=40){%>
                            <%if(totalRecord>0){%>
                            <li class="pagination-btn active"><span>1</span></li>
                                <%for (int i = 2; i <= (totalRecord+9)/10; i++) {%>
                            <li class="pagination-btn inactive"><a data-page="<%=i%>" href="#"><%=i%></a></li>
                                <%}%>
                                <%}%>
                                <%}else{%>
                            <li class="pagination-btn active"><span>1</span></li>
                            <li class="pagination-btn inactive"><a href="#" data-page="2">2</a></li>
                            <li class="pagination-btn inactive"><a href="#" data-page="3">3</a></li>
                            <span>...</span>
                            <li class="pagination-btn inactive"><a href="#" data-page="<%=(totalRecord+9)/10%>"><%=(totalRecord+9)/10%></a></li>
                            <li class="pagination-btn inactive"><a href="#">&gt;</a></li>
                                <%}%>

                        </ul>

                    </div>

                </main>
            </div>
        </div>
        <script src="./resources/js/user-list-admin.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js" integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>
