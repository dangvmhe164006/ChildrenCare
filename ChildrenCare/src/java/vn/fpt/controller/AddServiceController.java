package vn.fpt.controller;

import vn.fpt.edu.dao.ServiceDAO;
import vn.fpt.edu.model.Service;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddServiceController", urlPatterns = {"/AddServiceController"})
public class AddServiceController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ServiceDAO serviceDAO;

    @Override
    public void init() {
        serviceDAO = new ServiceDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("addService.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("serviceID");
        String name = request.getParameter("serviceName");
        String description = request.getParameter("serviceDescription");
        String priceStr = request.getParameter("servicePrice");

        // Convert ID from String to int
        int id;
        try {
            id = Integer.parseInt(idStr.trim());
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid ID format!");
            request.getRequestDispatcher("addService.jsp").forward(request, response);
            return;
        }

        if (name == null || name.trim().isEmpty()
                || description == null || description.trim().isEmpty()
                || priceStr == null || priceStr.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required!");
            request.getRequestDispatcher("addService.jsp").forward(request, response);
            return;
        }

        double price;
        try {
            price = Double.parseDouble(priceStr.trim());
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid price format!");
            request.getRequestDispatcher("addService.jsp").forward(request, response);
            return;
        }

        java.sql.Date dateCreated = new java.sql.Date(System.currentTimeMillis());

        // Create a new Service object with specified ID
        Service newService = new Service(id, name, description, price, dateCreated);

        // Call the DAO method to add the service to the database
        serviceDAO.addService(newService);
        response.sendRedirect("viewService.jsp");
    }
}
