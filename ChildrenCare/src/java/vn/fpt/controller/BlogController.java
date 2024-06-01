/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.dao.BlogDAO;
import vn.fpt.edu.dao.CommentDAO;
import vn.fpt.edu.model.Blog;
import vn.fpt.edu.model.Comment;
import vn.fpt.edu.model.CommentDTO;
import vn.fpt.edu.model.Users;

/**
 *
 * @author dangv
 */
public class BlogController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BlogController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String create = request.getParameter("views");
        if (create != null) {
            request.getRequestDispatcher("Views/User/CreateBlog.jsp").forward(request, response);

        }

        BlogDAO blogDAO = new BlogDAO();
        ArrayList<Blog> recentBlog = blogDAO.getLatestBlogs(5);
        request.setAttribute("recent", recentBlog);

        CommentDAO cDAO = new CommentDAO();
        if (id != null && !id.equals("")) {
            int blogId = Integer.parseInt(id);
            Blog blog = blogDAO.getBlogById(blogId);
            ArrayList<CommentDTO> listC = cDAO.getCommentsByBlogid(blogId);
            request.setAttribute("listComment", listC);
            request.setAttribute("blog", blog);
            request.getRequestDispatcher("Views/User/BlogDetail.jsp").forward(request, response);
        } else {
            ArrayList<Blog> listBlog = blogDAO.getAllBlogs();
            int size = listBlog.size();
            int num = (size % 5 == 0 ? (size / 6) : (size / 6) + 1);
            int page, numberPage = 5;
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);

            }
            int start, end;
            start = (page - 1) * numberPage;
            end = Math.min(page * numberPage, size);

            List<Blog> listB = blogDAO.getListByPage(listBlog, start, end);

            request.setAttribute("listBlog", listB);
            request.setAttribute("page", page);
            request.setAttribute("num", num);

            request.getRequestDispatcher("Views/User/listBlog.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogDAO blogDAO = new BlogDAO();
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        Users u = (Users) session.getAttribute("acc");
        if (service.equals("createBlog")) {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String image = request.getParameter("image");

            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");

            Blog blog = new Blog();
            blog.setTitle(title);
            blog.setContent(content);
            blog.setImage_url(image);
            blog.setCreate_at(now.format(formatter));
            blog.setCreate_by(u.getUser_id());

            int result = blogDAO.createBlog(blog);

            if (result > 0) {
                ArrayList<Blog> listBlog = blogDAO.getAllBlogs();

                request.getRequestDispatcher("Views/User/listBlog.jsp").forward(request, response);

            } else {
                response.getWriter().write("Failed to create blog.");
            }
        }

        if (service.equals("deleteBlog")) {

        }

        if (service.equals("updateBlog")) {

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
