package vn.fpt.edu.dao;

import vn.fpt.edu.model.Service;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ServiceDAO extends DBConnect {

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

public void addService(Service service) {
        String query = "INSERT INTO Services (Name, Description, Price, DateCreated) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, service.getName());
            ps.setString(2, service.getDescription());
            ps.setDouble(3, service.getPrice());
            ps.setDate(4, new java.sql.Date(service.getDateCreated().getTime()));
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

public void updateService(Service service) {
        String query = "UPDATE Services SET Name = ?, Description = ?, Price = ? WHERE ServiceID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, service.getName());
            ps.setString(2, service.getDescription());
            ps.setDouble(3, service.getPrice());
            ps.setInt(4, service.getServiceID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

public void deleteService(int id) {
        String query = "DELETE FROM Services WHERE ServiceID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}