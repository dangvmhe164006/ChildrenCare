<%-- 
    Document   : listBlog
    Created on : May 26, 2024, 10:37:54 PM
    Author     : dangv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Doctor</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/global.css" rel="stylesheet">
        <link href="css/blog.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Alata&display=swap" rel="stylesheet">
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
  <div style="padding-bottom:40px">
    <%@ include file="/Header.jsp" %>
  </div>

        <section id="blog"> 
            <div class="container">
                <div class="row">
                    <div class="blog_1 clearfix">
                        <div class="col-sm-8">

                            <c:forEach var="blog" items="${listBlog}">

                                <div class="blog_1l clearfix">
                                    <div class="col-sm-2 space_left">
                                        <div class="blog_1ll text-center clearfix"> 
                                            <a href=""><img src="img/43.jpg" class="iw img-circle" alt="abc"></a>
                                            <h5><a class="col_1" href=""><i class="fa fa-user"></i> Name</a></h5>
                                            <h6 class="col_2 normal"><i class="fa fa-clock-o"></i> ${blog.create_at}</h6>
                                        </div>
                                    </div>
                                    <div class="col-sm-10 space_all">
                                        <div class="blog_1lr clearfix">
                                            <a href="/ChildrenCare/BlogController?id=${blog.blog_id}"><img src="${blog.image_url}" class="iw" alt="abc"></a>
                                            <h5><a href="/BlogController"> <a href=""><i class="fa fa-comments"></i> 2</a></h5>
                                            <h1><a href="/ChildrenCare/BlogController?id=${blog.blog_id}"> ${blog.title} </a></h1>
                                            <p>${blog.content}</p>
                                            <div class="blog_1lri clearfix">
                                                <div class="col-sm-6 space_left">
                                                </div>
                                                <div class="col-sm-6 space_left">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>


                            <div class="product_1_last text-center clearfix">
                                <div class="col-sm-12">
                                    <ul>
                                        <c:set var="page" value="${requestScope.page}"/> 
                                        
                                        <div class="pagination-"> 
                                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                        <li class="act"><a href="/ChildrenCare/BlogController?page=${i}">${i}</a></li>

                                                
                                            </c:forEach>
                                        </div>
                                       
                                       
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="blog_1r clearfix">
                                        <jsp:include page="../User/RecentPosts.jsp"></jsp:include>

                                
                                
                                <div class="blog_1r2 clearfix">
                                    <h4 class="mgt">BLOG ARCHIVE</h4><br><br>
                                  
                                </div>
                                <div class="blog_1r2 clearfix">
                                    <h4 class="mgt">SomeThing</h4><br><br>
                                    <ul class="nav_m mgt">
                                        <li class="dropdown">
                                            <a class="tag_m" href="blog_detail.html" data-toggle="dropdown" role="button" aria-expanded="false">Select Category <i class="fa fa-chevron-down pull-right"></i></a>
                                            <ul class="dropdown-menu drop_m" role="menu">
                                                <li><a href="blog_detail.html">Announcements  (5)</a></li>
                                   
                                                <li><a class="border_none" href="blog_detail.html">News (5)</a></li>
                                            </ul>
                                        </li>

                                    </ul>
                                </div>
                                <div class="blog_1r3 clearfix">
                                    <h4 class="mgt">SomeThing</h4><br><br>
                                    <ul class="mgt">
                                        <li><a href="blog_detail.html">AUDIO</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>





    </body>
</html>
