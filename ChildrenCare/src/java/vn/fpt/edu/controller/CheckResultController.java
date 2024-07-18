
package vn.fpt.edu.controller;

import vn.fpt.edu.Database.CategoryServiceDAO;
import vn.fpt.edu.Database.ChildrenDAO;
import vn.fpt.edu.Database.ReservationDAO;
import vn.fpt.edu.Database.ServiceDAO;
import vn.fpt.edu.Database.StaffDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import vn.fpt.edu.model.CategoryService;
import vn.fpt.edu.model.Children;
import vn.fpt.edu.model.Mail;
import vn.fpt.edu.model.Reservation;
import vn.fpt.edu.model.Service;
import vn.fpt.edu.model.Staff;
import vn.fpt.edu.model.User;

public class CheckResultController extends HttpServlet {

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
        //Begin process return from VNPAY
        /* Payment Notify
     * IPN URL: Ghi nhận kết quả thanh toán từ VNPAY
     * Các bước thực hiện:
     * Kiểm tra checksum 
     * Tìm giao dịch trong database
     * Kiểm tra số tiền giữa hai hệ thống
     * Kiểm tra tình trạng của giao dịch trước khi cập nhật
     * Cập nhật kết quả vào Database
     * Trả kết quả ghi nhận lại cho VNPAY
         */
        HttpSession session = request.getSession();
        if (request.getParameter("method") != null && !request.getParameter("method").isEmpty()) {
            String reservationIDStr = request.getParameter("reservation");
            int reservationID = Integer.parseInt(reservationIDStr);
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
            User users = (User) session.getAttribute("user");
            reservation.setStatus("waiting for examination");
            reservationDAO.update(reservation);
            request.getSession().setAttribute("message", "Payment successfully");
            Thread emailThread = new Thread(() -> {
                Mail.sendEmail(users.getEmail(), "Information about your reservations ", Mail.setInfo(reservation,service,doctor,children,cate));
            });
            emailThread.start();
            request.getRequestDispatcher("./view/reservationstatus.jsp").forward(request, response);
        } else {

            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }
         
         
        
                request.getSession().setAttribute("message", "Invalid Checksum error");
            
            request.getRequestDispatcher("./view/reservationstatus.jsp").forward(request, response);
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
