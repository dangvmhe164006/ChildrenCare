<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "vn.fpt.edu.model.*" %>
<%@ page import = "vn.fpt.edu.Database.*" %>
<%@ page import = "java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="./resources/css/post-style.css">
        <title>Childrencare</title>
    </head>
    <body>
        <jsp:include page="./layout/Header.jsp" />
        <div class="d-flex justify-content-center mt-5">
            <div class="col-md-9" id="blog-list">
                <div class="container py-5">
                    <div class="row g-5">
                        <h1>${notFound}</h1>
                        <c:forEach var="l" items="${list}">
                            <div class="col-xl-4 col-lg-6 d-flex">
                                <div class="bg-light rounded overflow-hidden">
                                    <img class="img-fluid w-100 thumbnail-image" src="${l.getThumbnail()}" alt="">
                                    <div class="p-4">
                                        <a class="h3 d-block mb-3" href="/ChildrenCare/blogDetail?ID=${l.getPostID()}">${l.getTitle()}</a>
                                        <p class="m-0">${l.getBriefInfo()}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="container row mt-5 mb-4">
                <div class="mb-5">
                    <form action="blogPage">
                        <input type="text" name="postTitle" placeholder="Search" class="form-select text-primary mt-3 search" value="${postTitle}"/>
                        <br>
                        <jsp:include page="recentBlog.jsp"/>
                    </form>
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-center" id="pagination-container">
            <c:forEach var="p" begin="1" end="${numOfPage}">
                <form action="blogPage" method="get">
                    <input type="hidden" name="postTitle" value="${postTitle}">
                    <input type="submit" class="btn btn-primary" name="page" value="${p}" />
                </form>
            </c:forEach>
        </div>
        <jsp:include page="layout/footer.jsp" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
