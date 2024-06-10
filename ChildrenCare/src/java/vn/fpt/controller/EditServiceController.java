package vn.fpt.controller;

import vn.fpt.edu.dao.ServiceDAO;
import vn.fpt.edu.model.Service;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "EditServiceController", urlPatterns = {"/EditServiceController"})
public class EditServiceController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ServiceDAO serviceDAO;

    @Override
    public void init() {
        serviceDAO = new ServiceDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idString = request.getParameter("id");
        if (idString != null && !idString.isEmpty()) {
            try {
                int serviceID = Integer.parseInt(idString);
                Service service = serviceDAO.getServiceById(serviceID);
                if (service != null) {
                    request.setAttribute("service", service);
                    request.getRequestDispatcher("editService.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
            }
        }
        response.sendRedirect("error.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idString = request.getParameter("serviceID");
        String name = request.getParameter("serviceName");
        String description = request.getParameter("serviceDescription");
        String priceStr = request.getParameter("servicePrice");

        int id;
        try {
            id = Integer.parseInt(idString.trim());
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
            return;
        }

        if (name == null || name.trim().isEmpty() ||
            description == null || description.trim().isEmpty() ||
            priceStr == null || priceStr.trim().isEmpty()) {
            response.sendRedirect("error.jsp");
            return;
        }

        double price;
        try {
            price = Double.parseDouble(priceStr.trim());
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
            return;
        }

        Service editedService = new Service(id, name, description, price, new Date(System.currentTimeMillis()));
        boolean updated = serviceDAO.updateService(editedService);
        if (updated) {
            // Retrieve updated list of services
                List<Service> listService = serviceDAO.getAllServices();
                request.setAttribute("listService", listService);
                // Redirect to viewService.jsp
                request.getRequestDispatcher("/viewService.jsp").forward(request, response);
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
