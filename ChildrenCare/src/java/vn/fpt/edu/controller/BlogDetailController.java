package vn.fpt.edu.controller;


import vn.fpt.edu.Database.PostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.model.Post;


public class BlogDetailController extends HttpServlet {

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
            out.println("<title>Servlet PostController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostController at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try {
                int ID = Integer.parseInt(request.getParameter("ID"));
                PostDAO postDAO = new PostDAO();
                Post post = postDAO.getPostByID(ID);

                List<Post> listPost = postDAO.getAllPosts();

                List<Post> latestPosts = new ArrayList<>();
                if (listPost.size() < 3) {
                    for (int i = listPost.size() - 1; i >= 0; i--) {
                        latestPosts.add(listPost.get(i));
                    }
                } else {
                    for (int i = listPost.size() - 1; i >= listPost.size() - 3; i--) {
                        latestPosts.add(listPost.get(i));
                    }
                }

                if (post == null) {
                    throw new Exception();
                } else {
                    request.setAttribute("title", post.getTitle());
                    request.setAttribute("author", postDAO.getNameByUserID(post.getAuthorID()));
                    request.setAttribute("avatar", postDAO.getAvatarByUserID(post.getAuthorID()));
                    request.setAttribute("thumbnail", post.getThumbnail());
                    request.setAttribute("update-date", post.getCreatedDate());
                    request.setAttribute("categoryOfPost", post.getCategoryPost());
                    request.setAttribute("postdetail", post.getContent());
                    request.setAttribute("last3post", latestPosts);

                    request.getRequestDispatcher("./view/blog-detail.jsp").forward(request, response);
                }
            } catch (Exception e) {
                request.setAttribute("notFound", "Post not found");
                request.setAttribute("thumbnail", "resources/img/not_found.jpg");
                request.getRequestDispatcher("./view/blog-detail.jsp").forward(request, response);
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public static void main(String[] args) {
    }
}
