package vn.fpt.edu.controller;

import vn.fpt.edu.Database.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import org.apache.commons.codec.digest.DigestUtils;
import java.util.HashMap;
import java.util.Map;
import vn.fpt.edu.model.User;

public class RegisterController extends HttpServlet {

    protected static final Map<String, Long> activationLinks = new HashMap<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String email = request.getParameter("remail");
        String firstname = request.getParameter("rfirstname");
        String lastname = request.getParameter("rlastname");
        String phonenumber = request.getParameter("rphonenumber");
        String password = request.getParameter("rpassword");
        String gender = request.getParameter("rgender");
        String address = request.getParameter("raddress");
        UserDAO userDAO = new UserDAO();

        if (userDAO.getUser(email) != null) {
            response.getWriter().write("email existed");
            return;
        }
        // Get the current date and time
        java.util.Date utilDate = new java.util.Date();
        
        // Convert the java.util.Date to java.sql.Date
        Date sqlDate = new Date(utilDate.getTime());
        
        // Insert user into database
        User user = new User();
        user.setEmail(email);
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setPhoneNumber(phonenumber);
        user.setPassword(DigestUtils.md5Hex(password));
        user.setGender(gender);
        user.setAddress(address);
        user.setStatus(true);
        user.setProfileImage("resources/img/avatar.png");
        user.setCreatedDate(sqlDate);
        userDAO.insert(user);

    }
}
