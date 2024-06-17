package vn.fpt.edu.controller;

import vn.fpt.edu.Database.FeedBackDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "FeedbackController", urlPatterns = {"/FeedbackController"})
public class FeedBackController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String content = request.getParameter("content");
        int rating = Integer.parseInt(request.getParameter("rating"));

        // Assuming userID and medicalID are retrieved from session or other methods
        int userID = 1; // Dummy value, replace with actual retrieval method
        int medicalID = 1; // Dummy value, replace with actual retrieval method

        // Insert feedback into the database
        FeedBackDAO feedbackDAO = new FeedBackDAO();
        feedbackDAO.InsertFeedBack(userID, medicalID, content, rating);

        // Redirect to a success page or display a success message
        response.sendRedirect("feedback-success.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
