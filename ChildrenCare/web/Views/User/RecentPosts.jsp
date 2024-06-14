<%-- 
    Document   : RecentPosts
    Created on : May 27, 2024, 9:24:14 PM
    Author     : dangv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .blog_1r1 {
                margin: 20px;
            }
            .blog_1r1 h4 {
                text-align: center;
                margin-bottom: 20px;
            }
            .blog_1r1i {
                display: flex;
                margin-bottom: 20px;
                border-bottom: 1px solid #ccc;
                padding-bottom: 10px;
            }
            .blog_1r1il {
                display: flex;
                flex-direction: column;
            }
            .blog_1r1il img {
                width: 100%;
                height: auto;
            }
            .blog_1r1il h6 {
                color: #555;
                font-size: 0.9em;
                margin: 0;
            }
            .blog_1r1il h5 {
                margin: 10px 0 0 0;
            }
            .blog_1r1il h5 a {
                color: #000;
                text-decoration: none;
            }
            .blog_1r1il h5 a:hover {
                text-decoration: underline;
            }
            .clearfix::after {
                content: "";
                display: table;
                clear: both;
            }
            .col-sm-4, .col-sm-8 {
                box-sizing: border-box;
            }
            .col-sm-4 {
                flex: 0 0 33.3333%;
                max-width: 33.3333%;
                padding: 0 15px;
            }
            .col-sm-8 {
                flex: 0 0 66.6667%;
                max-width: 66.6667%;
                padding: 0 15px;
            }
            .space_left {
                padding-left: 0;
            }
            .mgt {
                margin-top: 0;
            }
            .col_2 {
                color: #888;
            }
            .col_1 {
                color: #000;
            }
            .normal {
                font-weight: normal;
            }
        </style>
    </head>
    <body>
        <div class="blog_1r1 clearfix">
            <h4 class="mgt">RECENT POSTS</h4>

            <c:forEach var="blog" items="${recent}">
                <div class="blog_1r1i clearfix">
                    <div class="col-sm-4 space_left">
                        <div class="blog_1r1il clearfix">
                            <a href="/ChildrenCare/BlogController?id=${blog.blog_id}"><img src="${blog.image_url}" class="iw" alt="abc"></a>
                        </div>
                    </div>
                    <div class="col-sm-8 space_left">
                        <div class="blog_1r1il clearfix">
                            <h6 class="col_2 mgt normal">${blog.create_at}</h6>
                            <h5><a class="col_1" href="/ChildrenCare/BlogController?id=${blog.blog_id}">${blog.title}</a></h5>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
