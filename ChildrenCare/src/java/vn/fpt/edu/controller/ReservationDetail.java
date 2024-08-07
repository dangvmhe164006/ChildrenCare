package vn.fpt.edu.controller;

import vn.fpt.edu.Database.ChildrenDAO;
import vn.fpt.edu.Database.ReservationDAO;
import vn.fpt.edu.Database.ServiceDAO;
import vn.fpt.edu.Database.StaffDAO;
import vn.fpt.edu.Database.StaffScheduleDAO;
import vn.fpt.edu.Database.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import vn.fpt.edu.model.Reservation;
import vn.fpt.edu.model.Service;
import vn.fpt.edu.model.Staff;
import vn.fpt.edu.model.StaffSchedule;

public class ReservationDetail extends HttpServlet {

    // Helper method to check if a string is numeric
    private boolean isNumeric(String str) {
        if (str == null || str.isEmpty()) {
            return false;
        }
        try {
            Integer.parseInt(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(true);
            if (session.getAttribute("email") == null) {
                response.sendRedirect("home");
                return;
            }

            // Update the database to cancel the pending reservation exceeds 5 minutes
            ReservationDAO reservationDAO = new ReservationDAO();
            reservationDAO.updateDatabase();

            // Receive serviceID, staffID, childID, action
            String serviceID = request.getParameter("serviceID");
            String staffID = request.getParameter("staffID");
            String childID = request.getParameter("childID");
            String action = request.getParameter("action");

            // Check if serviceID is null or empty
            if (serviceID == null || serviceID.isEmpty()) {
                response.sendRedirect("404");
                return;
            }

            UserDAO userDAO = new UserDAO();
            ChildrenDAO childrenDAO = new ChildrenDAO();
            String email = (String) session.getAttribute("email");

            // Validate children id
            if (!childrenDAO.validateChildren(childID, Integer.toString(userDAO.getUser(email).getUserID()))) {
                response.sendRedirect("404");
                return;
            }

            // Get the current date
            StaffDAO staffDAO = new StaffDAO();
            StaffScheduleDAO staffscheduleDAO = new StaffScheduleDAO();
            ServiceDAO serviceDAO = new ServiceDAO();

            // Check if staffID is provided and valid
            if (staffID != null && !staffID.isEmpty() && isNumeric(staffID)) {
                int staffIdInt = Integer.parseInt(staffID);

                // Check the existence of the staff and services
                if (staffDAO.getStaffByStaffId(staffIdInt) != null && serviceDAO.getServiceByID(serviceID) != null) {

                    // Get the staff
                    Staff staff = staffDAO.getStaffByStaffId(staffIdInt);

                    // Set attribute to send to the page
                    Service service = serviceDAO.getServiceByID(serviceID);
                    request.setAttribute("service", service);
                    request.setAttribute("Staff", staff);
                    request.setAttribute("ChildID", childID);
                    List<StaffSchedule> list = staffscheduleDAO.getAvailableStaffSchedules(staffID);
                    request.setAttribute("list", list);
                    request.getRequestDispatcher("/view/reservationdetail.jsp").include(request, response);

                } else {
                    response.sendRedirect("404");
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
