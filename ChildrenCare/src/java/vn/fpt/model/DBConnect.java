/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.model;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.SQLException;




/**
 *
 * @author dangv
 *  
 */

  
    
public class DBConnect {
    protected Connection connection;
    public DBConnect()
    {
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName=SWP391;encrypt=false";
            String username = "sa";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
}