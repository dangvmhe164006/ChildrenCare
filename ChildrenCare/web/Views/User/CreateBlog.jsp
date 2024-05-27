
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Create Blog</title>

    </head>
    <body>
        <section class="vh-100" style="background-color: #2779e2;">
            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-9">

                        <h1 class="text-white mb-4">Create Blog</h1>

                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body">

                                <form action="BlogController" method="post">
                                           <input type="hidden"  name="service" value="createBlog" >

                                    <div class="row align-items-center pt-4 pb-3">
                                        <div class="col-md-3 ps-5">
                                            <label for="title" class="form-label">Title</label>
                                        </div>
                                        <div class="col-md-9 pe-5">
                                            <input type="text" class="form-control form-control-lg" id="title" name="title" required />
                                        </div>
                                    </div>
                                    <hr class="mx-n3">
                                    <div class="row align-items-center py-3">
                                        <div class="col-md-3 ps-5">
                                            <label for="content" class="form-label">Content</label>
                                        </div>
                                        <div class="col-md-9 pe-5">
                                            <textarea class="form-control" rows="3" id="content" name="content" placeholder="Content of blog"></textarea>
                                        </div>
                                    </div>
                                    <hr class="mx-n3">
                                    <div class="row align-items-center py-3">
                                        <div class="col-md-3 ps-5">
                                            <label for="image" class="form-label">URL</label>
                                        </div>
                                        <div class="col-md-9 pe-5">
                                            <input type="text" class="form-control form-control-lg" id="image" name="image" />
                                        </div>
                                    </div>
                                    <hr class="mx-n3">
                                    <div class="px-5 py-4">
                                        <button type="submit" class="btn btn-primary btn-lg">Create Blog</button>
                                    </div>
                                </form>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
