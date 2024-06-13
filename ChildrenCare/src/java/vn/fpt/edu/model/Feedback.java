
package vn.fpt.edu.model;

import java.util.Date;

public class Feedback {
     private int feedbackID;
    private int customerID;
    private int serviceID;
    private String content;
    private int rating;
    private Date dateCreated;

    public Feedback() {
    }

    public Feedback(int feedbackID, int customerID, int serviceID, String content, int rating, Date dateCreated) {
        this.feedbackID = feedbackID;
        this.customerID = customerID;
        this.serviceID = serviceID;
        this.content = content;
        this.rating = rating;
        this.dateCreated = dateCreated;
    }

    @Override
    public String toString() {
        return "Feedback{" + "feedbackID=" + feedbackID + ", customerID=" + customerID + ", serviceID=" + serviceID + ", content=" + content + ", rating=" + rating + ", dateCreated=" + dateCreated + '}';
    }
    
    
}
