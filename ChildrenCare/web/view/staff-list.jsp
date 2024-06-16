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
            .search-group {
                margin: 20px 0;
            }
            .search-group .form-group {
                margin-right: 10px;
            }
            .search-group .more {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
            }
            .list-doctor {
                margin: 20px 0;
            }
            .item-doctor {
                background-color: white;
                border: 1px solid #ddd;
                padding: 15px;
                margin-bottom: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                max-width: 600px; /* Set a maximum width */
                margin: 10px auto; /* Center align the boxes */
            }
            .item-doctor .thumb {
                margin-right: 15px;
                flex-shrink: 0;
            }
            .item-doctor .thumb img {
                width: 150px;
                height: 150px;
                object-fit: cover;
                border-radius: 8px;
            }
            .item-doctor .info {
                flex-grow: 1;
                padding-left: 10px; /* Add some padding to the left */
                display: flex;
                flex-direction: column;
                justify-content: center;
            }
            .item-doctor .info h3 a {
                color: #007bff;
                text-decoration: none;
            }
            .item-doctor .info p {
                margin: 5px 0;
                display: flex;
                align-items: center;
            }
            .item-doctor .info img {
                margin-right: 5px;
            }
            #pagination-container input[type="submit"] {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 20px;
                margin: 5px;
                cursor: pointer;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="./layout/Header.jsp" />
        <% ServiceStaffDAO ssDao = new ServiceStaffDAO(); %>
        <% ServiceDAO sDao = new ServiceDAO(); %>
        <div class="container">
            <form action="staffList" method="get">
                <!--search bar start-->
                <div class="search-group d-flex">
                    <div class="form-group">
                        <input type="text" class="form-control" name="staffName" value="${staffName}" placeholder="Search by doctor name">
                    </div>
                    <div class="form-group">
                        <select class="form-select" name="serviceID">
                            <c:forEach var="s" items="${serviceList}">
                                <option value="${s.getServiceID()}">${s.getTitle()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button class="more btn btn-primary">
                        <span class="d-block">Search</span>
                    </button>
                </div>
                <!--search bar end-->
                <!--start doctor list-->
                <h1>${notFound}</h1>
                <div class="list-doctor">
                    <% List<Staff> staffList = (List<Staff>) request.getAttribute("staffList");
                    for (Staff staff : staffList) { %>
                    <div class="item-doctor d-flex">
                        <div class="thumb">
                            <a href="/ChildrenCare/docDetail?ID=<%= staff.getStaffID() %>">
                                <img src="<%= staff.getProfileImage() %>" alt="Doctor Image">
                            </a>
                        </div>
                        <div class="info">
                            <h3>
                                <a href="/ChildrenCare/docDetail?ID=<%= staff.getStaffID() %>"><%= staff.getRank() %> <%= staff.getFullName() %></a>
                            </h3>
                            <p>
                                <img src="https://hongngochospital.vn/wp-content/themes/hongngoc/images/icon-level.png" alt="">
                                <%= staff.getRank() %>
                            </p>
                            <p>
                                <img src="https://hongngochospital.vn/wp-content/themes/hongngoc/images/icon-park.png" alt="">
                                <% List<Integer> servicesList = ssDao.getServiceByDoc(staff.getStaffID());
                                for (int ser : servicesList) { %>
                                    <%= sDao.getServiceNameByID(ser) %> ,
                                <% } %>
                            </p>
                            <p>
                                <img src="https://hongngochospital.vn/wp-content/themes/hongngoc/images/icon-map.png" alt="">
                                Childrencare
                            </p>
                        </div>
                    </div>
                    <% } %>
                </div>
                <!--doctor list end-->
                <!--page-->
                <div class="d-flex justify-content-center" id="pagination-container">
                    <c:forEach var="p" begin="1" end="${numOfPage}">
                        <input type="submit" class="btn btn-primary" name="page" value="${p}" />
                    </c:forEach>
                </div>
            </form>
        </div>
        <jsp:include page="layout/footer.jsp" />
    </body>
</html>