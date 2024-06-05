
package Control.medical;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AddMedicine extends AccountAuthentication {

    String add = "/frontend/jsp/medicine/add.jsp";
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession hs = request.getSession();
        User acc = (User)hs.getAttribute("account");
        UserDAO o = new UserDAO();
        try {
            User user = o.getUser(acc.getEmail());
            if (user.isStatus() != false && user.getRole().getId()<=2) {
                request.setAttribute("account", user);
                request.getRequestDispatcher(add).forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(AddMedicine.class.getName()).log(Level.SEVERE, null, ex);
        }
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
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id").trim();
        String name = request.getParameter("name").trim();
        String producer = request.getParameter("producer").trim();
        String element = request.getParameter("element").trim();
        String quantityy = request.getParameter("quantity").trim();
        String pricee = request.getParameter("price").trim();
        String inUse = request.getParameter("inUse").trim();
        String unit = request.getParameter("unit").trim();
        
        int quantity = Integer.parseInt(quantityy);
        double price = Double.parseDouble(pricee);
        boolean inuse = inUse.equals("true");
        Medicine m = new Medicine();
        m.setId(id);
        m.setName(name);
        m.setProducer(producer);
        m.setElement(element);
        m.setPrice(price);
        m.setQuantity(quantity);
        m.setInUse(inuse);
        m.setUnit(unit);
        MedicineDAO mdao = new MedicineDAO();
        mdao.add(m);
        response.sendRedirect("list");
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
