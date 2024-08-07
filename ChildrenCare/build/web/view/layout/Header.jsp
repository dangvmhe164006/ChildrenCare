
<%@page import = "vn.fpt.edu.model.*" %>
<%@page import = "vn.fpt.edu.Database.*" %>
<%@page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="./resources/css/style.css" rel="stylesheet">
    </head>
    <%
        String email = (String) session.getAttribute("email");
        UserDAO dao = new UserDAO();
        User curUser = dao.getUser(email);
    %>
    <!--Start Header-->
    <header id="header" class="fixed-top">
        <div class="container d-flex align-items-center">

            <h1 class="logo me-auto"><a href="/ChildrenCare/home">ChildrenCare</a>
                <a href="home" class="logo me-auto"><img src="" alt="" class="img-fluid"></a></h1>


            <nav id="navbar" class="navbar order-last order-lg-0">
                <ul>
                    <li><a class="nav-link scrollto" href="home">Home</a></li>
                    <li class="dropdown"><a href="/ChildrenCare/service?event=service-list"><span>Services</span></a>

                    </li>
                    <li><a class="nav-link scrollto" href="/ChildrenCare/staffList">Doctors</a></li>
                    <li class="dropdown"><a href="/ChildrenCare/blogPage"><span>Blog</span></a>
                    </li>

                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav><!-- .navbar -->
            <%if(curUser!=null){%>
            <div class="dropdown">
                <a href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                    <div class="appointment-btn scrollto d-flex align-items-center p-1 pe-2">
                        <img class="rounded-circle" style="object-fit: cover;object-position: top;overflow: hidden;width: 40px;height: 40px;" src="<%=curUser.getProfileImage()%>" alt=""/>
                        <p class="m-0 ms-1">Hi, <%=curUser.getFirstName()%></p>


                    </div>
                </a>

                <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <li><a class="dropdown-item" href="../ChildrenCare/view/profile2.jsp" >My profile</a></li>
                    <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#myProfile" >Changer profile</a></li>
                     <li><a onclick="changePassowrd()" class="dropdown-item">Change Password</a></li>
                    <li><a class="dropdown-item" href="myreservation">My reservation</a></li>
                    <li><a class="dropdown-item" href="logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </header>
    <!-- End Header -->
    <body>

        <jsp:include page="../login.jsp"/>
        <jsp:include page="../changePassword.jsp"/>
        <jsp:include page="../register.jsp"/>
        <jsp:include page="../profile.jsp"/>

    </body>

    <%}else{%>
    <a onclick="showRegisterPopup()" id="register"class="appointment-btn scrollto"><span class="d-none d-md-inline">Register Now</a>
    <a onclick="showLoginPopup()" id="login"class="appointment-btn scrollto"><span class="d-none d-md-inline">Login</a>

</div>
</header>
<!-- End Header -->
<body>

    <jsp:include page="../login.jsp"/>
    <jsp:include page="../changePassword.jsp"/>
    <jsp:include page="../register.jsp"/>


</body>
<%}%>
</html>
