/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.dao.DBConnect;
import vn.fpt.edu.model.GoogleAccount;
import vn.fpt.edu.model.Users;

/**
 *
 * @author ACER
 */
public class UserDao extends DBConnect {
    
    public List<Users> getAllAcc() {
        List<Users> list = new ArrayList<>();
        String spl = "select * from [dbo].[User]";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getInt("user_id"), rs.getString("user_name"),
                        rs.getString("password"), rs.getString("email"),
                        rs.getString("full_name"), rs.getString("phone_number"),
                        rs.getString("address"), rs.getBoolean("gender"),
                        rs.getString("image_url"), rs.getString("role"),
                        rs.getString("created_at"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

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

    public void insertCustomerByGoogleAccount(GoogleAccount acc, String pass) {
        String image_url = "assets/images/macdinh.jpg";
        String role = "customer";
        String spl = "INSERT INTO [dbo].[User]\n"
                + "           ([user_name]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[image_url]\n"
                + "           ,[role]\n"
                + "           ,[created_at])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,GETDATE())";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, acc.getName());
            st.setString(2, pass);
            st.setString(3, acc.getEmail());
            st.setString(4, image_url);
            st.setString(5, role);

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

    public void changeImg(String id, String img) {
        String spl = "UPDATE [dbo].[User]\n"
                + "   SET [image_url] = ?\n"
                + " WHERE user_id =  ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, img);
            st.setString(2, id);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void chagePasswordById(String id, String newpass) {
        String spl = "UPDATE [dbo].[User]\n"
                + "   SET [password] = ?\n"
                + " WHERE USER_ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, newpass);
            st.setString(2, id);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Users getUsersById(int id) {
        String spl = " select * from [dbo].[User]\n"
                + "  where user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
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

    public Users getUsersByIdString(String id) {
        String spl = " select * from [dbo].[User]\n"
                + "  where user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, id);
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

    public void editProfile(String userName, String email, String fullName, String phone, String address, String gender, String id) {
        String spl = "UPDATE [dbo].[User]\n"
                + "   SET [user_name] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[full_name] = ?\n"
                + "      ,[phone_number] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[gender] = ?\n"
                + " WHERE user_id =  ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, userName);
            st.setString(2, email);
            st.setString(3, fullName);
            st.setString(4, phone);
            st.setString(5, address);
            st.setString(6, gender);
            st.setString(7, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean checkPassWord(String id, String pass) {
        String spl = "select * from [dbo].[User]\n"
                + "where USER_ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users u = new Users(rs.getInt("user_id"), rs.getString("user_name"),
                        rs.getString("password"), rs.getString("email"),
                        rs.getString("full_name"), rs.getString("phone_number"),
                        rs.getString("address"), rs.getBoolean("gender"),
                        rs.getString("image_url"), rs.getString("role"),
                        rs.getString("created_at"));
                if (u.getPassword().equals(pass)) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void removeImg(int id) {
        String spl = "UPDATE [dbo].[User]\n"
                + "   SET [image_url] = 'assets/images/macdinh.jpg'\n"
                + " WHERE user_id =  ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deleteAcount(String id) {
        String spl = "delete from [dbo].[User]\n"
                + "where user_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
