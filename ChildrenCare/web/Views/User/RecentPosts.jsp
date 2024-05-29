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
