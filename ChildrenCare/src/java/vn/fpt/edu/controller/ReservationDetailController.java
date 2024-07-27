package vn.fpt.edu.controller;

import vn.fpt.edu.Database.ReservationDAO;
import vn.fpt.edu.Database.ServiceDAO;
import vn.fpt.edu.Database.ServiceStaffDAO;
import vn.fpt.edu.Database.UserDAO;
import vn.fpt.edu.Database.ChildrenDAO;
import vn.fpt.edu.model.Children;
import vn.fpt.edu.model.Reservation;
import vn.fpt.edu.model.Service;
import vn.fpt.edu.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import vn.fpt.edu.Database.StaffDAO;
import vn.fpt.edu.model.Staff;

public class ReservationDetailController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(true);
        String email = (String) session.getAttribute("email");
        // Check if user has logged in
        if (email == null) {
            response.sendRedirect("home");
            return; // Exit method after redirect
        }

        UserDAO userDAO = new UserDAO();
        ReservationDAO reservationDAO = new ReservationDAO();
        reservationDAO.updateDatabase();
        String action = request.getParameter("action");

        switch (action) {
            case "save": {
                String selectedDate = request.getParameter("selectDate");
                String staffID = request.getParameter("staffID");
                String serviceID = request.getParameter("serviceID");
                String slot = request.getParameter("slot");
                String childID = request.getParameter("childID");

                saveData(selectedDate, staffID, slot, serviceID, userDAO.getUser(email), childID, request, response);
                break;
            }
            case "update": {
                String staffID = request.getParameter("staffID");
                String selectedDate = request.getParameter("selectDate");
                String slot = request.getParameter("slot");
                String reservationID = request.getParameter("reservationID");

                updateData(staffID, selectedDate, slot, reservationID, request, response);
                break;
            }
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                break;
        }
    }

    synchronized private void updateData(String staffID, String selectedDate, String slot, String reservationID, HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Implement update logic here
    }

    synchronized private void saveData(String selectedDate, String staffID, String slot, String serviceID, User user, String childID, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        try {
            // Convert IDs from String to Integer
            int serviceIDInt = Integer.parseInt(serviceID);
            int staffIDInt = Integer.parseInt(staffID);
            int childIDInt = Integer.parseInt(childID);
            int slotInt = Integer.parseInt(slot);
            ReservationDAO reservationDAO = new ReservationDAO();
            ServiceDAO serviceDAO = new ServiceDAO();
            ServiceStaffDAO serviceStaffDAO = new ServiceStaffDAO();
            Service service = serviceDAO.getServiceByID(serviceID);

            LocalDateTime currentDateTime = LocalDateTime.now();
            Timestamp sqlTimestamp = Timestamp.valueOf(currentDateTime);

            // Create a new Reservation object
            Reservation reservation = new Reservation();
            reservation.setServiceID(serviceIDInt);
            reservation.setStaffID(staffIDInt);
            reservation.setReservationSlot(slotInt);
            reservation.setUserID(user.getUserID());
            reservation.setChildID(childIDInt);
            reservation.setReservationDate(Date.valueOf(selectedDate));
            reservation.setCreatedDate(sqlTimestamp);
            reservation.setStatus("Pending");
            reservation.setCost((float) service.getSalePrice());
            reservation.setPayment("");
            reservationDAO.insert(reservation);

            ChildrenDAO daoC = new ChildrenDAO();
            StaffDAO staffDAO = new StaffDAO();
            Staff doc = staffDAO.getDocByStaffId(staffIDInt);
            Children child = daoC.getChildrenByChildrenId(childID);
            request.setAttribute("children", child);
            request.setAttribute("service", service);
            request.setAttribute("doc", doc);
            request.setAttribute("user", user);
            
            int id =  reservationDAO.findReservationID(user.getUserID(), childID, serviceID, selectedDate, slotInt);
            request.setAttribute("id", id);
            request.setAttribute("reservation", reservation);

            request.getRequestDispatcher("/view/confirm-reservation.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            // Log error and send an error response
            e.printStackTrace(); // Optional: log the error for debugging
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format for parameters.");
        } catch (Exception e) {
            // Handle any other exceptions that may occur
            e.printStackTrace(); // Optional: log the error for debugging
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
    }
}
