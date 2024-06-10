package vn.fpt.controller;

import vn.fpt.edu.dao.ServiceDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import vn.fpt.edu.model.Service;

@WebServlet(name = "DeleteServiceController", urlPatterns = {"/DeleteServiceController"})
public class DeleteServiceController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ServiceDAO serviceDAO;

    @Override
    public void init() {
        serviceDAO = new ServiceDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET request
        String idString = request.getParameter("id");
        if (idString != null && !idString.isEmpty()) {
            int serviceID = Integer.parseInt(idString);
            boolean deleted = serviceDAO.deleteService(serviceID);
            if (deleted) {
                // Retrieve updated list of services
                List<Service> listService = serviceDAO.getAllServices();
                request.setAttribute("listService", listService);
                // Redirect to viewService.jsp
                request.getRequestDispatcher("/viewService.jsp").forward(request, response);
            } else {
                // Handle deletion failure
                // You can redirect to an error page or display an error message
            }
        } else {
            // Handle invalid or missing ID parameter
            // You can redirect to an error page or display an error message
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST request
        doGet(request, response); // Delegate to doGet method for processing
    }
}
