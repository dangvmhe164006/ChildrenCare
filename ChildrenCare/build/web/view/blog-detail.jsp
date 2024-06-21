
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "vn.fpt.edu.model.*" %>
<%@page import = "vn.fpt.edu.Database.*" %>
<%@page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="./resources/css/post-style.css">
        <title>Childrencare</title>
    </head>
    <body>
        <jsp:include page="./layout/Header.jsp" />
        <!-- Blog Start -->
        <div class="container py-5" id="blog-list">
            <div class="row g-5" >
                <div class="col-lg-8">
                    <!-- Blog Detail Start -->
                    <h1>${notFound}</h1>
                    <div class="mb-5">
                        <img class="img-fluid w-100 rounded mb-5" src="${thumbnail}" alt="thumbnail">
                        <h1 class="mb-4">${title}</h1>
                        <h2>${categoryOfPost}</h2>
                        <p>
                            ${postdetail}
                        </p>
                        <div class="d-flex justify-content-between bg-light rounded p-4 mt-4 mb-4">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle me-2 avatar" src="${avatar}" alt="">
                                <span>${author}</span>
                            </div>
                            <div class="d-flex align-items-center">

                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sidebar Start -->
                <div class="col-lg-4">
                    <div class="mb-5">
                        <jsp:include page="recentBlog.jsp"/>
                    </div>
                </div>
                <!-- Sidebar End -->
            </div>
        </div>
        <!-- Blog End -->
        <jsp:include page="layout/footer.jsp" />
    </body>
</html>

