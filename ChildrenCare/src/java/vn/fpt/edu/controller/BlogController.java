package vn.fpt.edu.controller;

import vn.fpt.edu.Database.PostDAO;
import vn.fpt.edu.Database.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.model.Post;
import vn.fpt.edu.model.Slider;

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
        try ( PrintWriter out = response.getWriter()) {
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
        String postTitle;
         SliderDAO sliderDAO = new SliderDAO();
        List<Slider> listSlide = sliderDAO.getAllSlideActive();
        request.setAttribute("slider", listSlide);

        PostDAO postDAO = new PostDAO();
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

        


        try {
            postTitle = request.getParameter("postTitle");
            if (postTitle == null) {
                throw new Exception();
            }
        } catch (Exception e) {
            postTitle = "";
        }
        String postCategory;
        try {
            postCategory = request.getParameter("postCategory");
            if (postCategory == null || postCategory.equals("Post Category")) {
                throw new Exception();
            }
        } catch (Exception e) {
            postCategory = "";
        }
        int page;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            page = 1;
        }
        PostDAO postDao = new PostDAO();
        List<String> categoryList = postDao.allCategoryPost();
        int numOfPage = (postDao.getCountOfPostsUserChoose(postTitle, postCategory) + 5) / 6;
        List<Post> list = postDao.getSortedPagedPostsByUserChoice((page - 1) * 6, 6, postTitle, postCategory);
        categoryList.add(0, "Post Category");
        if (!postCategory.isEmpty()) {
            categoryList.remove(postCategory);
            categoryList.add(0, postCategory);
        }
        if (list.isEmpty()) {
            request.setAttribute("notFound", "There are no matching posts");
            request.getRequestDispatcher("./view/blog-list.jsp").forward(request, response);
        } else {
            request.setAttribute("postTitle", postTitle);
            request.setAttribute("postCategory", postCategory);
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("numOfPage", numOfPage);
            request.setAttribute("list", list);
            request.setAttribute("last3post", latestPosts);

            request.getRequestDispatcher("./view/blog-list.jsp").forward(request, response);
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
