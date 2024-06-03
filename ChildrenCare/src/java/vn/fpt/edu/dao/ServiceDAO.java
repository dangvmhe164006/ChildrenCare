package vn.fpt.edu.dao;

import vn.fpt.edu.model.Service;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ServiceDAO extends DBContext {

    public List<Service> getAllServices() {
        List<Service> services = new ArrayList<>();
        String query = "SELECT * FROM Services";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Service service = new Service(
                    rs.getInt("ServiceID"),
                    rs.getString("Name"),
                    rs.getString("Description"),
                    rs.getDouble("Price"),
                    rs.getDate("DateCreated")
                );
                services.add(service);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return services;
    }
    
public Service getServiceById(int id) {
        Service service = null;
        String query = "SELECT * FROM Services WHERE ServiceID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                service = new Service(
                    rs.getInt("ServiceID"),
                    rs.getString("Name"),
                    rs.getString("Description"),
                    rs.getDouble("Price"),
                    rs.getDate("DateCreated")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return service;
    }