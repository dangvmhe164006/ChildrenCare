package vn.fpt.edu.model;

import java.util.Date;

public class Service {
    private int serviceID;
    private String name;
    private String description;
    private double price;
    private Date dateCreated;

    public Service() {}

    public Service(int serviceID, String name, String description, double price, Date dateCreated) {
        this.serviceID = serviceID;
        this.name = name;
        this.description = description;
        this.price = price;
        this.dateCreated = dateCreated;
    }

    // Getters and Setters
    public int getServiceID() { return serviceID; }
    public void setServiceID(int serviceID) { this.serviceID = serviceID; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public Date getDateCreated() { return dateCreated; }
    public void setDateCreated(Date dateCreated) { this.dateCreated = dateCreated; }

    @Override
    public String toString() {
        return "Service{" +
               "serviceID=" + serviceID +
               ", name='" + name + '\'' +
               ", description='" + description + '\'' +
               ", price=" + price +
               ", dateCreated=" + dateCreated +
               '}';
    }
}
