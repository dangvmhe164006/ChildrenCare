
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

