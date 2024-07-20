
package vn.fpt.edu.controller;

import vn.fpt.edu.Database.PostDAO;
import vn.fpt.edu.Database.StaffDAO;
import vn.fpt.edu.Database.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.model.Post;
import vn.fpt.edu.model.Staff;
import vn.fpt.edu.model.User;


public class PostManageController extends HttpServlet {

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
            out.println("<title>Servlet PostManageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostManageController at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String email = (String) session.getAttribute("email");
        StaffDAO staffDAO = new StaffDAO();
        Staff curStaff = staffDAO.getStaffByStaffEmail(email);
        PostDAO postDAO = new PostDAO();

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
            if (event == null || event.isEmpty()) {
                loadPageWithChoice(request, response);
                request.getRequestDispatcher("./view/post-list-manage.jsp").forward(request, response);
            } else {
                switch (event) {
                    case "hide":
                        hidePost(request, response);
                        loadPageWithChoice(request, response);
                        request.getRequestDispatcher("./view/post-list-manage.jsp").forward(request, response);
                        break;
                    case "show":
                        showPost(request, response);
                        loadPageWithChoice(request, response);
                        request.getRequestDispatcher("./view/post-list-manage.jsp").forward(request, response);
                        break;

                
                    default:
                        break;
                }
            }
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

    }

    protected void hidePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PostDAO postDAO = new PostDAO();
        int ID = Integer.parseInt(request.getParameter("postId"));
        Post post = postDAO.getPostByID(ID);
        post.setStatusPost(false);
        postDAO.update(ID, post);
        PrintWriter out = response.getWriter();
        out.print(post.isStatusPost() + " " + post.getPostID());
        out.print(postDAO.getPostByID(ID).isStatusPost());
    }

    protected void showPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PostDAO postDAO = new PostDAO();
        int ID = Integer.parseInt(request.getParameter("postId"));
        Post post = postDAO.getPostByID(ID);
        post.setStatusPost(true);
        postDAO.update(ID, post);

    }

    protected void loadPageWithChoice(HttpServletRequest request, HttpServletResponse response) {
    // get page
    int page;
    try {
        page = Integer.parseInt(request.getParameter("page"));
    } catch (Exception e) {
        page = 1;
    }

    PostDAO postDao = new PostDAO();
    
    // get number of pages
    int numOfPage = (postDao.getCountOfPosts() + 5) / 6;
    
    // get list of posts
    List<Post> list = postDao.getPagedPosts((page - 1) * 6, 6);

    request.setAttribute("numOfPage", numOfPage);
    request.setAttribute("list", list);
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
