
package vn.fpt.edu.controller;

import vn.fpt.edu.Database.PostDAO;
import vn.fpt.edu.Database.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import vn.fpt.edu.model.Post;
import vn.fpt.edu.model.Staff;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 2, // 2 MB
        maxRequestSize = 1024 * 1024 * 2 // 1 MB 
)

public class PostDetailManage extends HttpServlet {

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
            out.println("<title>Servlet postDetailManage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet postDetailManage " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);
        String email = (String) session.getAttribute("email");
        StaffDAO staffDAO = new StaffDAO();
        Staff curStaff = staffDAO.getStaffByStaffEmail(email);

        boolean isManager = false;
        if (curStaff != null) {
            if (curStaff.getRole().equals("manager")) {
                isManager = true;
            }
        }
        if (!isManager) {
            request.getRequestDispatcher("./view/403-forbidden.jsp").forward(request, response);
        } else {
            String event = request.getParameter("event");
            request.setAttribute("event", event);

            PostDAO postDAO = new PostDAO();
            int ID;
            Post post = new Post();
            switch (event) {
                case "update":
                    ID = Integer.parseInt(request.getParameter("postID"));
                    post = postDAO.getPostByID(ID);
                    break;

                case "add":
                    ID = postDAO.getLastPostID() + 1;
                    post = new Post(ID, "", "", "", "", 0, /*curStaff.getStaffID() */ 1, 1, Date.valueOf(LocalDate.now()), "", true);
                    break;

               
                default:
                    throw new AssertionError();
            }
            loadPostDetail(request, response, post, event);
            request.getRequestDispatcher("/view/post-detail-manage.jsp").forward(request, response);
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
        String event = request.getParameter("event");
        PostDAO postDAO = new PostDAO();
        int ID;
        Post post = new Post();
        switch (event) {
            case "update":
                ID = Integer.parseInt(request.getParameter("postID"));
                post = postDAO.getPostByID(ID);
                post = newPost(request, response, post, event);
                loadPostDetail(request, response, post, event);
                request.getRequestDispatcher("/view/post-detail-manage.jsp").forward(request, response);
                break;
            case "add":
                ID = postDAO.getLastPostID() + 1;
                post = new Post(ID, "", "", "", "", 0, /*curStaff.getStaffID() */ 1, 1, Date.valueOf(LocalDate.now()), "", true);
                post = newPost(request, response, post, event);
                loadPostDetail(request, response, post, event);
                request.getRequestDispatcher("/view/post-detail-manage.jsp").forward(request, response);
                break;
         

            default:
                throw new AssertionError();
        }

    }

    protected void loadPostDetail(HttpServletRequest request, HttpServletResponse response, Post post, String event) {
        PostDAO postDAO = new PostDAO();

        request.setAttribute("author", postDAO.getNameByUserID(post.getAuthorID()));
        request.setAttribute("avatar", postDAO.getAvatarByUserID(post.getAuthorID()));
        request.setAttribute("post", post);
        request.setAttribute("event", event);
    }

    protected Post newPost(HttpServletRequest request, HttpServletResponse response, Post post, String event) throws ServletException, IOException {

        PostDAO postDAO = new PostDAO();
        String title = request.getParameter("Title");
        String content = request.getParameter("Content");
        String briefInfo = request.getParameter("Brief");
        Part filePart = request.getPart("images");
        Date createdDate = Date.valueOf(LocalDate.now());
        String categoryPost = request.getParameter("postCategory");
        String status = request.getParameter("status");
        String contentType = filePart.getContentType();

        boolean validate = true;
        if (content.isEmpty()) {
            String errorMessage3 = "content can't be empty";
            request.setAttribute("errorMessage3", errorMessage3);
            validate = false;
        }
        if (title.isEmpty()) {
            String errorMessage1 = "title can't be empty";
            request.setAttribute("errorMessage1", errorMessage1);
            validate = false;

        }
        if (briefInfo.isEmpty()) {
            String errorMessage2 = "brief can't be empty";
            request.setAttribute("errorMessage2", errorMessage2);
            validate = false;

        }

        if (validate) {
            post.setTitle(title);
            post.setContent(content);
            post.setBriefInfo(briefInfo);

            if (contentType != null && contentType.startsWith("image")) {
                String realPath = request.getServletContext().getRealPath("/resources/img");
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                filePart.write(realPath + "/" + fileName);
                String newImg = "resources/img/" + fileName;
                post.setThumbnail(newImg);
            }

            post.setCreatedDate(createdDate);
            post.setCategoryPost(categoryPost);
            if (status.equals("true")) {
                post.setStatusPost(true);
            }
            if (status.equals("false")) {
                post.setStatusPost(false);
            }
            switch (event) {
                case "add":
                    postDAO.insert(post);
                    break;
                case "update":
                    postDAO.update(post.getPostID(), post);
                    break;

                default:
                    throw new AssertionError();
            }
        }
        return post;
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
