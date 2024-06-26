
package vn.fpt.edu.controller;

import vn.fpt.edu.Database.ServiceDAO;
import vn.fpt.edu.Database.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import vn.fpt.edu.model.Service;
import vn.fpt.edu.model.Staff;

public class StaffListController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet StaffListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffListController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        PrintWriter out = response.getWriter();
        ServiceDAO serviceDao = new ServiceDAO();
        StaffDAO staffDao = new StaffDAO();
        String staffName;
        try {
            staffName = request.getParameter("staffName");
            if (staffName == null) {
                throw new Exception();
            }
        } catch (Exception e) {
            staffName = "";
        }
        String serviceID;
        List<Service> serviceList = serviceDao.getAllServices();
        Service service = new Service(0, "Choice Service");
        serviceList.add(0, service);
        try {
            serviceID = request.getParameter("serviceID");
            if (serviceID == null || serviceID.equals("0")) {
                throw new Exception();
            }
            out.print(serviceID);
            service = serviceDao.getServiceByID(serviceID);
            serviceList.remove(service);
            serviceList.add(0, service);
        } catch (Exception e) {
            serviceID = "";
        }
        int page;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            page = 1;
        }

        int numOfPage = staffDao.getNumOfStaffList(staffName, serviceID);
        numOfPage = (numOfPage + 4) / 5;

        List<Staff> staffList = staffDao.getStaffListPage((page - 1) * 5, 5, staffName, serviceID);

        if (staffList.isEmpty()) {
            request.setAttribute("notFound", "There no match Doctor");
        }
        request.setAttribute("staffName", staffName);
        request.setAttribute("serviceList", serviceList);
        request.setAttribute("staffList", staffList);
        request.setAttribute("numOfPage", numOfPage);
        request.getRequestDispatcher("./view/staff-list.jsp").forward(request, response);

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
