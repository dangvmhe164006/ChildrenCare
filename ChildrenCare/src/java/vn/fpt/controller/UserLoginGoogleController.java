///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//
//package vn.fpt.controller;
//
//import java.io.IOException;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import vn.fpt.edu.dao.UserDao;
//import vn.fpt.edu.model.GoogleAccount;
//
///**
// *
// * @author ACER
// */
//public class UserLoginGoogleController extends HttpServlet {
//   
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String code = request.getParameter("code");
//        String accesToken = UserLoginTonkenController.getToken(code);
//        GoogleAccount account = UserRegisterTokenController.getUserInfo(accesToken);
//        UserDao d = new UserDao();
//        if (d.getCustomerByEmail(account.getEmail()) != null && account.isVerified_email()) {
//            HttpSession session = request.getSession();
//            session.setAttribute("acc", d.getCustomerByEmail(account.getEmail()));
//            request.getRequestDispatcher("Home.jsp").forward(request, response);
//        }else{
//            request.setAttribute("error", "Tài khoản không tồn tại. Vui lòng đăng kí tài khoản!!!");
//            request.getRequestDispatcher("Signup.jsp").forward(request, response);
//        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//    }
//}
