/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.dao.DBConnect;
import vn.fpt.model.Users;

/**
 *
 * @author ACER
 */
public class UserDao extends DBConnect {

    public void registerUsers(String user_name, String password, String email, String full_name, String phone_number,
            String address, String gender) {
        String image_url = "assets/images/macdinh.jpg";
        String role = "customer";
        String spl = "INSERT INTO [dbo].[User]\n"
                + "           ([user_name]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[full_name]\n"
                + "           ,[phone_number]\n"
                + "           ,[address]\n"
                + "           ,[gender]\n"
                + "           ,[image_url]\n"
                + "           ,[role]\n"
                + "           ,[created_at])\n"
                + "     VALUES\n"
                + "           (? \n"
                + "           ,? \n"
                + "           ,? \n"
                + "           ,? \n"
                + "           ,? \n"
                + "           ,? \n"
                + "           ,? \n"
                + "           ,? \n"
                + "           ,? \n"
                + "           ,GETDATE());";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, user_name);
            st.setString(2, password);
            st.setString(3, email);
            st.setString(4, full_name);
            st.setString(5, phone_number);
            st.setString(6, address);
            st.setString(7, gender);
            st.setString(8, image_url);
            st.setString(9, role);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Users loginUser(String email, String pass) {
        String spl = "select * from [dbo].[User]\n"
                + "where [email] = ? and [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users u = new Users(rs.getInt("user_id"), rs.getString("user_name"),
                        rs.getString("password"), rs.getString("email"),
                        rs.getString("full_name"), rs.getString("phone_number"),
                        rs.getString("address"), rs.getBoolean("gender"),
                        rs.getString("image_url"), rs.getString("role"),
                        rs.getString("created_at"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Users getCustomerByEmail(String email) {
        String spl = "select * from [dbo].[User]\n"
                + "where [email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users u = new Users(rs.getInt("user_id"), rs.getString("user_name"),
                        rs.getString("password"), rs.getString("email"),
                        rs.getString("full_name"), rs.getString("phone_number"),
                        rs.getString("address"), rs.getBoolean("gender"),
                        rs.getString("image_url"), rs.getString("role"),
                        rs.getString("created_at"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void chagePassword(String email, String pass) {
        String spl = "UPDATE [dbo].[User]\n"
                + "   SET [password] = ?\n"
                + " WHERE [email] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, pass);
            st.setString(2, email);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
