
package vn.fpt.edu.controller;

import vn.fpt.edu.Database.CategoryServiceDAO;
import vn.fpt.edu.Database.ReservationDAO;
import vn.fpt.edu.Database.ServiceDAO;
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
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import vn.fpt.edu.model.CategoryService;
import vn.fpt.edu.model.Reservation;


public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String action = (String) request.getParameter("action");

        // Get the current date
        Date currentDate = new Date(System.currentTimeMillis());

        // Create a Calendar instance and set it to the current date
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);

        // Subtract 7 days
        calendar.add(Calendar.DAY_OF_MONTH, -7);

        // Get the date seven days ago as a java.sql.Date
        Date sevenDaysAgo = new Date(calendar.getTimeInMillis());

        // Update the database to cancel the pending reservation exceeds 5 minutes
        ReservationDAO reservationDAO = new ReservationDAO();
        reservationDAO.updateDatabase();

        if (session.getAttribute("adminEmail") == null) {
            request.getRequestDispatcher("/staff?event=sent-to-login").forward(request, response);
        } else {
            if (action != null) {
                switch (action) {
                    case "logout": {
                        logOut(session, request, response);
                        break;
                    }
                    case "changeDate": {
                        String startDay = (String) request.getParameter("startDay");
                        java.sql.Date startDate = java.sql.Date.valueOf(startDay);
                        String endDay = (String) request.getParameter("endDay");
                        java.sql.Date endDate = java.sql.Date.valueOf(endDay);
                        processData(true, startDate, endDate, calendar, session, request, response);
                        break;
                    }
                    case "send-to-customer-list": {
                        sendToCustomerList(session, request, response);
                        break;
                    }
                  
                }
            } else {
                processData(false, sevenDaysAgo, currentDate, calendar, session, request, response);
            }
        }
    }

    private void logOut(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        session.invalidate();
        response.sendRedirect("admin");
    }

    private void processData(Boolean isChangeDate, Date startDate, Date endDate, Calendar calendar, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        StaffDAO staffDAO = new StaffDAO();

        // Get the count of each reservation status
 
            // Admin avatar
            String adminEmail = (String) session.getAttribute("adminEmail");
            request.setAttribute("admin", staffDAO.getStaffByStaffEmail(adminEmail));

            request.getRequestDispatcher("./view/customer-list-admin.jsp").forward(request, response);
        
    }

    private void sendToCustomerList(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StaffDAO staffDAO = new StaffDAO();
        String adminEmail = (String) session.getAttribute("adminEmail");
        request.setAttribute("admin", staffDAO.getStaffByStaffEmail(adminEmail));

        request.getRequestDispatcher("./view/customer-list-admin.jsp").forward(request, response);
    }

}
