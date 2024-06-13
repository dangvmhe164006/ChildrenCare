//package vn.fpt.edu.dao;
//
//import vn.fpt.edu.model.Feedback;
//
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//public class FeedbackDAO {
//
//    // Method to get all feedbacks
//    public List<Feedback> getAllFeedbacks() {
//        List<Feedback> feedbacks = new ArrayList<>();
//        String sql = "SELECT * FROM Feedback";
//
//        try (Connection conn = new DBContext().getConnection();
//             PreparedStatement ps = conn.prepareStatement(sql);
//             ResultSet rs = ps.executeQuery()) {
//
//            while (rs.next()) {
//                Feedback feedback = new Feedback();
//                feedback.setFeedbackID(rs.getInt("FeedbackID"));
//                feedback.setCustomerID(rs.getInt("CustomerID"));
//                feedback.setServiceID(rs.getInt("ServiceID"));
//                feedback.setContent(rs.getString("Content"));
//                feedback.setRating(rs.getInt("Rating"));
//                feedback.setDateCreated(rs.getDate("DateCreated"));
//                feedbacks.add(feedback);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return feedbacks;
//    }
//
//    // Method to add a new feedback
//    public boolean addFeedback(Feedback feedback) {
//        String sql = "INSERT INTO Feedback (CustomerID, ServiceID, Content, Rating, DateCreated) VALUES (?, ?, ?, ?, ?)";
//
//        try (Connection conn = new DBContext().getConnection();
//             PreparedStatement ps = conn.prepareStatement(sql)) {
//
//            ps.setInt(1, feedback.getCustomerID());
//            ps.setInt(2, feedback.getServiceID());
//            ps.setString(3, feedback.getContent());
//            ps.setInt(4, feedback.getRating());
//            ps.setDate(5, new java.sql.Date(feedback.getDateCreated().getTime()));
//            ps.executeUpdate();
//            return true;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return false;
//    }
//
//    // Method to update an existing feedback
//    public boolean updateFeedback(Feedback feedback) {
//        String sql = "UPDATE Feedback SET CustomerID = ?, ServiceID = ?, Content = ?, Rating = ?, DateCreated = ? WHERE FeedbackID = ?";
//
//        try (Connection conn = new DBContext().getConnection();
//             PreparedStatement ps = conn.prepareStatement(sql)) {
//
//            ps.setInt(1, feedback.getCustomerID());
//            ps.setInt(2, feedback.getServiceID());
//            ps.setString(3, feedback.getContent());
//            ps.setInt(4, feedback.getRating());
//            ps.setDate(5, new java.sql.Date(feedback.getDateCreated().getTime()));
//            ps.setInt(6, feedback.getFeedbackID());
//            ps.executeUpdate();
//            return true;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return false;
//    }
//
//    // Method to delete a feedback
//    public boolean deleteFeedback(int feedbackID) {
//        String sql = "DELETE FROM Feedback WHERE FeedbackID = ?";
//
//        try (Connection conn = new DBContext().getConnection();
//             PreparedStatement ps = conn.prepareStatement(sql)) {
//
//            ps.setInt(1, feedbackID);
//            ps.executeUpdate();
//            return true;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return false;
//    }
//
//    // Method to get a feedback by ID
//    public Feedback getFeedbackById(int feedbackID) {
//        Feedback feedback = null;
//        String sql = "SELECT * FROM Feedback WHERE FeedbackID = ?";
//
//        try (Connection conn = new DBContext().getConnection();
//             PreparedStatement ps = conn.prepareStatement(sql)) {
//
//            ps.setInt(1, feedbackID);
//            try (ResultSet rs = ps.executeQuery()) {
//                if (rs.next()) {
//                    feedback = new Feedback();
//                    feedback.setFeedbackID(rs.getInt("FeedbackID"));
//                    feedback.setCustomerID(rs.getInt("CustomerID"));
//                    feedback.setServiceID(rs.getInt("ServiceID"));
//                    feedback.setContent(rs.getString("Content"));
//                    feedback.setRating(rs.getInt("Rating"));
//                    feedback.setDateCreated(rs.getDate("DateCreated"));
//                }
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return feedback;
//    }
//}
