<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="vn.fpt.edu.model.Blog" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    <body
 
    <%@ include file="/Header.jsp" %>
  
        <section id="blog" style="padding-top:150px"> 
        
            <div class="container">
                <div class="row">
                    <div class="blog_1 clearfix">
                        <div class="col-sm-8">
                            <div class="blog_1 clearfix">
                                <div class="col-sm-8">
                                    <div class="blog_1l mgt clearfix">
                                        <div class="col-sm-2 space_left">
                                            <div class="blog_1ll text-center clearfix"> 
                                                <a href="#"><img src="img/41.jpg" class="iw img-circle" alt="abc"></a>
                                                <h5><a class="col_1" href="#"><i class="fa fa-user"></i> <%= ((Blog)request.getAttribute("blog")).getCreate_by() %></a></h5>
                                                <h6 class="col_2 normal"><i class="fa fa-clock-o"></i> <%= ((Blog)request.getAttribute("blog")).getCreate_at() %></h6>
                                            </div>
                                        </div>
                                        <div class="col-sm-10 space_all">
                                            <div class="blog_1lr clearfix">
                                                <a href="#"><img src="<%= ((Blog)request.getAttribute("blog")).getImage_url() %>" class="iw" alt="<%= ((Blog)request.getAttribute("blog")).getTitle() %>"></a>
                                                <h5> <a href="#"><i class="fa fa-comments"></i> 2</a></h5>
                                                <h1><a href="#"><%= ((Blog)request.getAttribute("blog")).getTitle() %></a></h1>
                                                <p><%= ((Blog)request.getAttribute("blog")).getContent() %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="blog_detail_l2 clearfix">
                                <div class="blog_detail_l2i clearfix">
                                    <h3 class="mgt">Comments</h3>
                                </div>
                            <c:forEach var="comment" items="${listComment}">
                                <div class="blog_detail_l2i1 pdb border_none clearfix">
                                    <div class="col-sm-2 space_left">
                                        <img src="img/52.jpg" class="iw img-circle" alt="abc">
                                    </div>
                                    <div class="col-sm-10 space_left">
                                        <h4 class="mgt"> ${comment.username}</h4>
                                        <h6 class="col_1">${comment.createdAt}</h6>
                                        <p>
                                           ${comment.content}
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>

                            </div>

                            <form id="commentForm">
                                <div class="contact_1r blog_1ln clearfix">
                                    <textarea id="commentContent" name="commentContent" placeholder="Your Comments" class="form-control form_1"></textarea>                                   
                                    <button type="submit" class="button block">Comment</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-sm-4">
                            <div class="blog_1r clearfix">
                                <jsp:include page="../User/RecentPosts.jsp"></jsp:include>
                                </div>
                                <div class="blog_1r2 clearfix">
                                    <h4 class="mgt">BLOG ARCHIVE</h4><br><br>
                                  
                                </div>
                                <div class="blog_1r2 clearfix">
                                    <h4 class="mgt">SomeThing</h4><br><br>
                                    <ul class="nav_m mgt">
                                        <li class="dropdown">
                                            <a class="tag_m" href="#" data-toggle="dropdown" role="button" aria-expanded="false">Select Category <i class="fa fa-chevron-down pull-right"></i></a>
                                            <ul class="dropdown-menu drop_m" role="menu">
                                                <li><a href="#">Announcements  (5)</a></li>
                                                <li><a class="border_none" href="#">News (5)</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="blog_1r3 clearfix">
                                    <h4 class="mgt">SomeThing</h4><br><br>
                                    <ul class="mgt">
                                        <li><a href="#">VIDEO</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <script type="text/javascript">
                document.getElementById('commentForm').addEventListener('submit', function (event) {
                    event.preventDefault();

                    var commentContent = document.getElementById('commentContent').value;
                    var blogId = <%= ((Blog)request.getAttribute("blog")).getBlog_id() %>;

                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', '/ChildrenCare/comment', true);
                    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                         window.location.reload();                
                        }
                    };
                    xhr.send('blogId=' + blogId + '&commentContent=' + encodeURIComponent(commentContent));
                });
        </script>
    </body>
</html>
