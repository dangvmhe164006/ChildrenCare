
package vn.fpt.edu.controller;

import vn.fpt.edu.Database.ChildrenDAO;
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
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.model.Children;
import vn.fpt.edu.model.Mail;
import vn.fpt.edu.model.Reservation;
import vn.fpt.edu.model.Service;
import vn.fpt.edu.model.Staff;
import vn.fpt.edu.model.User;


public class ReservationContact extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        // Get the user's email from the session
        HttpSession session = request.getSession();

        String email = (String) session.getAttribute("email");
        // Create a UserDAO instance to interact with the user data
        StaffDAO staffdao = new StaffDAO();
        Staff staff = staffdao.getStaffByStaffEmail(email);
        boolean isManager = false;
        boolean isStaff = false;
        boolean isAdmin = false;
        String adminEmail = (String) session.getAttribute("adminEmail") + "";
        if (adminEmail.contains("@")) {
            isAdmin = true;
        }
        if (staff != null) {
            if (staff.getRole().equals("manager")) {
                isManager = true;
            }
            if (staff.getRole().equals("doctor") || staff.getRole().equals("nurse")) {
                isStaff = true;
            }
        }
        if (!isManager) {
            request.getRequestDispatcher("./view/403-forbidden.jsp").forward(request, response);
            return;
        }
        //get event
        String event = request.getParameter("event");
        ReservationDAO reservationdao = new ReservationDAO();
        if (event.equals("reservation-list")) {
            //get total page
            int endP = reservationdao.getTotalReservation();
            int endPage = endP / 10;
            //paging
            if (endP % 10 != 0) {
                endPage++; // if endP not divide by 10 so that endPage + 1
            }
            List<Reservation> listreservation = reservationdao.getReservationAllByPaging(1, null);
            request.setAttribute("endP", endPage);
            request.setAttribute("Reservation", listreservation);
            request.getRequestDispatcher("/view/reservation-manager-list.jsp").forward(request, response);
        } else if (event.equals("reservation-list-paging")) {
            //get parameter
            String page = request.getParameter("page");
            String sort = request.getParameter("sortstatus");
            System.out.println(sort);
            // get list reservation
            List<Reservation> listreservation = reservationdao.getReservationAllByPaging(Integer.parseInt(page), sort);
            //get information of user
            StaffDAO staffDAO = new StaffDAO();
            ServiceDAO serviceDAO = new ServiceDAO();
            UserDAO userdao = new UserDAO();
            ChildrenDAO childrenDAO = new ChildrenDAO();
            for (Reservation reservation : listreservation) {
                Service service = serviceDAO.getServiceByID(reservation.getServiceID() + "");
                User user = userdao.getUserByID(reservation.getUserID());
                Staff staffa = staffDAO.getStaffByStaffId(reservation.getStaffID());
                Children children = childrenDAO.getChildrenByChildrenId(reservation.getChildID() + "");
                List<Staff> stafflist = staffDAO.getStaffsBySlot(String.valueOf(reservation.getReservationDate()), reservation.getReservationSlot() + "");

                out.println("<tr>\n"
                        + "                                                    <td>" + reservation.getReservationID() + "</td>\n"
                        + "                                                    <td>" + service.getTitle() + "</td>\n"
                        + "                                                    <td>" + user.getFirstName() + user.getLastName() + "</td>\n"
                        + "                                                    <td>" + children.getChildName() + "</td>\n"
                        + "                                                    <td>" + reservation.getReservationDate() + "</td>\n"
                        + "                                                    <td>" + reservation.getReservationSlot() + "</td>\n"
                        + "<td>\n"
                        + "                                                    <div class=\"dropdown\">\n"
                        + "                                                        <button style=\"border: 0px; padding: 0px\" type=\"button\" id=\"dropdownMenuButton1\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n"
                        + "                                                            <span class=\"badge bg-primary\"  id=\"doctorBadge-" + reservation.getReservationID() + "\">" + staffa.getStaffName() + " </span>\n"
                        + "                                                        </button>\n"
                        + "                                                        <ul class=\"dropdown-menu\" aria-labelledby=\"dropdownMenuLink\">\n");
                for (Staff varstaff : stafflist) {
                    out.println(
                            "                                                                <li><a class=\"dropdown-item status-change\" href=\"#\" onclick=\"changeDoctor(this," + varstaff.getStaffID() + " , " + reservation.getReservationID() + ")\">" + varstaff.getStaffName() + "</a></li>\n");
                }
                out.println(
                        "                                                        </ul>\n"
                        + "\n"
                        + "                                                    </div>\n"
                        + "                                                </td>"
                        + "<td><div class=\"dropdown\">\n"
                        + "                                                        <button style=\"border: 0px ; padding: 0px;\" type=\"button\" id=\"dropdownMenuButton1\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n"
                        + "                                                            <span class=\"badge bg-primary\"  id=\"statusBadge-" + reservation.getReservationID() + "\">" + reservation.getStatus() + "</span>\n"
                        + "                                                        </button>\n"
                        + "                                                        <ul class=\"dropdown-menu\" aria-labelledby=\"dropdownMenuLink\">\n"
                        + "                                                            <li><a class=\"dropdown-item status-change\" href=\"#\" onclick=\"changestatus(this, " + reservation.getReservationID() + ")\">cancel</a></li>\n"
                        + "                                                            <li><a class=\"dropdown-item status-change\" href=\"#\" onclick=\"changestatus(this, " + reservation.getReservationID() + ")\">accept</a></li>\n"
                        + "                                                            <li><a class=\"dropdown-item status-change\" href=\"#\" onclick=\"changestatus(this, " + reservation.getReservationID() + ")\">waiting for examination</a></li>\n"
                        
                        + "                                                            <li><a class=\"dropdown-item status-change\" href=\"#\" onclick=\"changestatus(this, " + reservation.getReservationID() + ")\">done</a></li>\n"
                        + "                                                        </ul>\n"
                        + "                                                    </div> </td>"
                        + "                                                    <td>" + reservation.getCost() + "</td>\n"
                        + "                                                    <td><a href=\"staff?event=send-to-reservation-manager-detail&reserdid=" + reservation.getReservationID() + "\"><img src=\"resources/img/icon/detail.png\" alt=\"alt\" width=\"25px\"/></a></td>"
                        + " </tr>");

            }

        } else if (event.equals("updatestatus")) {
            //get information
            String status = request.getParameter("status");
            String reservationID = request.getParameter("reservationID");
            reservationdao.updateStatus(status, reservationID);
            
        } else if (event.equals("fillter")) {
            //get parameter
            String page = request.getParameter("page");
            System.out.println(page);
            String staffid = request.getParameter("staffId");
            System.out.println(staffid);
            String name = (request.getParameter("name") == null) ? "" : request.getParameter("name");
            //get action
            List<Reservation> listreservation = new ArrayList<>();
            String action = request.getParameter("action");
            if (action.equals("fillterdoctor")) {
                // get list reservation
                listreservation = reservationdao.getReservationAllByPagingFill(Integer.parseInt(page), staffid);
            } else {
                listreservation = reservationdao.getReservationAllBySearch(Integer.parseInt(page), name);
            }

            //get information of user
            StaffDAO staffDAO = new StaffDAO();
            ServiceDAO serviceDAO = new ServiceDAO();
            UserDAO userdao = new UserDAO();
            ChildrenDAO childrenDAO = new ChildrenDAO();
            out.print("<table class=\"table table-striped table-hover\">\n"
                    + "                                    <thead class=\"text-light\" style=\"background: #1977cc;\">\n"
                    + "                                        <tr>\n"
                    + "                                            <th scope=\"col\">ID</th>\n"
                    + "                                            <th scope=\"col\">Service Name</th>\n"
                    + "                                            <th scope=\"col\">Full name</th>\n"
                    + "                                            <th scope=\"col\">Children</th>\n"
                    + "                                            <th scope=\"col\">Reservation Date</th>\n"
                    + "                                            <th scope=\"col\">Slot</th>\n"
                    + "                                            <th scope=\"col\">Doctor</th>\n"
                    + "                                            <th scope=\"col\">Status</th>\n"
                    + "                                            <th scope=\"col\">Cost</th>\n"
                    + "                                            <th scope=\"col\">Detail</th>\n"
                    + "\n"
                    + "                                        </tr>\n"
                    + "                                    </thead>\n"
                    + "\n"
                    + "                                    <tbody>");
            for (Reservation reservation : listreservation) {
                Service service = serviceDAO.getServiceByID(reservation.getServiceID() + "");
                User user = userdao.getUserByID(reservation.getUserID());
                Staff staffa = staffDAO.getStaffByStaffId(reservation.getStaffID());
                Children children = childrenDAO.getChildrenByChildrenId(reservation.getChildID() + "");
                List<Staff> stafflist = staffDAO.getStaffsBySlot(String.valueOf(reservation.getReservationDate()), reservation.getReservationSlot() + "");

                out.println("<tr>\n"
                        + "                                                    <td>" + reservation.getReservationID() + "</td>\n"
                        + "                                                    <td>" + service.getTitle() + "</td>\n"
                        + "                                                    <td>" + user.getFirstName() + user.getLastName() + "</td>\n"
                        + "                                                    <td>" + children.getChildName() + "</td>\n"
                        + "                                                    <td>" + reservation.getReservationDate() + "</td>\n"
                        + "                                                    <td>" + reservation.getReservationSlot() + "</td>\n"
                        + "<td>\n"
                        + "                                                    <div class=\"dropdown\">\n"
                        + "                                                        <button style=\"border: 0px; padding: 0px\" type=\"button\" id=\"dropdownMenuButton1\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n"
                        + "                                                            <span class=\"badge bg-primary\"  id=\"doctorBadge-" + reservation.getReservationID() + "\">" + staffa.getStaffName() + " </span>\n"
                        + "                                                        </button>\n"
                        + "                                                        <ul class=\"dropdown-menu\" aria-labelledby=\"dropdownMenuLink\">\n");
                for (Staff varstaff : stafflist) {
                    out.println(
                            "                                                                <li><a class=\"dropdown-item status-change\" href=\"#\" onclick=\"changeDoctor(this," + varstaff.getStaffID() + " ," + reservation.getReservationID() + ")\">" + varstaff.getStaffName() + "</a></li>\n");
                }
                out.println(
                        "                                                        </ul>\n"
                        + "\n"
                        + "                                                    </div>\n"
                        + "                                                </td>"
                        + "<td><div class=\"dropdown\">\n"
                        + "                                                        <button style=\"border: 0px ; padding: 0px;\" type=\"button\" id=\"dropdownMenuButton1\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n"
                        + "                                                            <span class=\"badge bg-primary\"  id=\"statusBadge-" + reservation.getReservationID() + "\">" + reservation.getStatus() + "</span>\n"
                        + "                                                        </button>\n"
                        + "                                                        <ul class=\"dropdown-menu\" aria-labelledby=\"dropdownMenuLink\">\n"
                        + "                                                            <li><a class=\"dropdown-item status-change\" href=\"#\" onclick=\"changestatus(this, " + reservation.getReservationID() + ")\">cancel</a></li>\n"
                        + "                                                            <li><a class=\"dropdown-item status-change\" href=\"#\" onclick=\"changestatus(this, " + reservation.getReservationID() + ")\">pending</a></li>\n"
                        + "                                                            <li><a class=\"dropdown-item status-change\" href=\"#\" onclick=\"changestatus(this, " + reservation.getReservationID() + ")\">waiting for examination</a></li>\n"
                        + "                                                            <li><a class=\"dropdown-item status-change\" href=\"#\" onclick=\"changestatus(this, " + reservation.getReservationID() + ")\">done</a></li>\n"
                        + "                                                        </ul>\n"
                        + "                                                    </div> </td>"
                        + "                                                    <td>" + reservation.getCost() + "</td>\n"
                        + "                                                    <td><a href=\"staff?event=send-to-reservation-manager-detail&reserdid=" + reservation.getReservationID() + "\"><img src=\"resources/img/icon/detail.png\" alt=\"alt\" width=\"25px\"/></a></td>"
                        + " </tr>");

            }
            out.println(" </tbody> \n"
                    + "                                </table>");
            String pagehtml = "<div class=\"d-flex w-100 justify-content-center mb-5\">";
            int length = 0;
            String fillter = "";
            if (action.equals("fillterdoctor")) {
                // get list reservation
                length = reservationdao.getTotalReservationByFillter(staffid);
                fillter = action;
            } else {
                length = reservationdao.getTotalReservationBySearch(name);
                fillter = action;
            }

            for (int i = 1; i <= (length + 9) / 10; i++) {
                if (i == Integer.parseInt(page)) {
                    pagehtml += "<span style=\"width: 25px;height: 25px\" class=\"pagination-btn rounded-circle ms-2 inactive d-flex justify-content-center align-items-center\" data-page=\"" + i + "\" onclick=\"paging(" + i + ",'" + fillter + "')\">" + i + "</span>\n";
                } else {
                    pagehtml += "<button style=\"width: 25px;height: 25px\" class=\"pagination-btn btn btn-primary rounded-circle ms-2 inactive d-flex justify-content-center align-items-center\" data-page=\"" + i + "\" onclick=\"paging(" + i + ",'" + fillter + "')\">" + i + "</button>\n";
                }
            }
            pagehtml += "</div> ";
            out.println(pagehtml);
            response.addHeader("pagination", "");
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
        processRequest(request, response);
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
        processRequest(request, response);
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

}
