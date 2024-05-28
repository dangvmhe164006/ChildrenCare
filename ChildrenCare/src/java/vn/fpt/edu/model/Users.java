/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.model;

/**
 *
 * @author ACER
 */
public class Users {
//    user_id INT PRIMARY KEY IDENTITY,
//    user_name NVARCHAR(50) NOT NULL UNIQUE,
//    [password] NVARCHAR(100) NOT NULL,
//    email NVARCHAR(255) NOT NULL UNIQUE,
//    full_name NVARCHAR(100),
//    phone_number NVARCHAR(20),
//    address NVARCHAR(255),
//    gender BIT CHECK (gender IN (0, 1)), -- 1 là male, 0 là fmale 
//    image_url NVARCHAR(MAX),
//    [role] NVARCHAR(50) DEFAULT 'customer' CHECK ([role] IN ('customer', 'admin', 'doctor', 'manager', 'marketer')),
//    created_at DATETIME DEFAULT GETDATE()
    
    private int user_id;
    private String user_name;
    private String password;
    private String email;
    private String full_name;
    private String phone;
    private String address;
    private boolean gender;
    private String image_url;
    private String role;
    private String date_created;

    public Users() {
    }

    public Users(int user_id, String user_name, String password, String email, String full_name, String phone, String address, boolean gender, String image_url, String role, String date_created) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.password = password;
        this.email = email;
        this.full_name = full_name;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
        this.image_url = image_url;
        this.role = role;
        this.date_created = date_created;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDate_created() {
        return date_created;
    }

    public void setDate_created(String date_created) {
        this.date_created = date_created;
    }
    
    
    
    
}
