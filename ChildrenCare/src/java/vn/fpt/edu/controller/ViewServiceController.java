package vn.fpt.edu.controller;

import vn.fpt.edu.dao.ServiceDAO;
import vn.fpt.edu.model.Service;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewServiceController")
public class ViewServiceController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ServiceDAO serviceDAO;

    public ViewServiceController() {
        super();
        serviceDAO = new ServiceDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "insert":
                insertService(request, response);
                break;
            case "delete":
                deleteService(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "update":
                updateService(request, response);
                break;
            default:
                listService(request, response);
                break;
        }
    }

    private void listService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Service> listService = serviceDAO.getAllServices();
        request.setAttribute("listService", listService);
        request.getRequestDispatcher("service-list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("service-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Service existingService = serviceDAO.getServiceById(id);
        request.setAttribute("service", existingService);
        request.getRequestDispatcher("service-form.jsp").forward(request, response);
    }

    private void insertService(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        Service newService = new Service(0, name, description, price, new java.util.Date());
        serviceDAO.addService(newService);
        response.sendRedirect("ViewServiceController");
    }

    private void updateService(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int serviceID = Integer.parseInt(request.getParameter("serviceID"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        Service service = new Service(serviceID, name, description, price, new java.util.Date());
        serviceDAO.updateService(service);
        response.sendRedirect("ViewServiceController");
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        serviceDAO.deleteService(id);
        response.sendRedirect("ViewServiceController");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}