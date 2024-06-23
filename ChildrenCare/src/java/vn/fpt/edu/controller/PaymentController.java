/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import vn.fpt.edu.Database.CategoryServiceDAO;
import vn.fpt.edu.Database.ChildrenDAO;
import vn.fpt.edu.Database.ReservationDAO;
import vn.fpt.edu.Database.ServiceDAO;
import vn.fpt.edu.Database.StaffDAO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.fpt.edu.model.CategoryService;
import vn.fpt.edu.model.Children;
import vn.fpt.edu.model.Reservation;
import vn.fpt.edu.model.Service;
import vn.fpt.edu.model.Staff;
import vn.fpt.edu.model.User;

public class PaymentController extends HttpServlet {

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
        HttpSession session = request.getSession();
        User users = (User) session.getAttribute("user");
        String payment = request.getParameter("payment");
        int reservationID = Integer.parseInt(request.getParameter("reservation"));
        ReservationDAO reservationDAO = new ReservationDAO();
        reservationDAO.updateDatabase();
        Reservation reservation = reservationDAO.getReservationByID(reservationID);
        ServiceDAO serviceDAO = new ServiceDAO();
        Service service = serviceDAO.getServiceByID(String.valueOf(reservation.getServiceID()));
        StaffDAO staffDAO = new StaffDAO();
        Staff doctor = staffDAO.getStaffByStaffId(reservation.getStaffID());
        ChildrenDAO childrenDAO = new ChildrenDAO();
        Children children = childrenDAO.getChildrenByChildrenId(String.valueOf(reservation.getChildID()));
        CategoryServiceDAO cateDAO = new CategoryServiceDAO();
        CategoryService cate = cateDAO.getCategoryServiceByID(String.valueOf(service.getServiceID()));
        request.setAttribute("reservation", reservation);
        request.setAttribute("service", service);
        request.setAttribute("doctor", doctor);
        request.setAttribute("children", children);
        request.setAttribute("cate", cate);
        if (payment.equals("offline")) {
            com.google.gson.JsonObject job = new JsonObject();
            if (reservation.getStatus().equals("pending")) {
                job.addProperty("code", "00");
                job.addProperty("message", "success");
                reservation.setPayment("Pay at Center");
                reservationDAO.update(reservation);
                String paymentUrl = getServletContext().getContextPath() + "/check?method=off&reservation=" + reservationID;
                job.addProperty("data", paymentUrl);
                Gson gson = new Gson();
                try {
                    response.getWriter().write(gson.toJson(job));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else {
                job.addProperty("code", "01");
                job.addProperty("message", "You have the same examinaton!");
                String paymentUrl = getServletContext().getContextPath() + "/check?method=off&reservation=" + reservationID;
                job.addProperty("data", paymentUrl);
                Gson gson = new Gson();
                try {
                    response.getWriter().write(gson.toJson(job));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

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
