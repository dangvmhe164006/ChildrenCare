package vn.fpt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import vn.fpt.model.Blog;
import vn.fpt.model.DBConnect;

public class BlogDAO extends DBConnect {
    
    public int createBlog(Blog blog) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Blog] " +
                     "([title], [content], [image_url], [created_at], [created_by]) " +
                     "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            
            preparedStatement.setString(1, blog.getTitle());
            preparedStatement.setString(2, blog.getContent());
            preparedStatement.setString(3, blog.getImage_url());
            preparedStatement.setString(4, blog.getCreate_at());

            preparedStatement.setInt(5, blog.getCreate_by());
            
            n = preparedStatement.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    private Connection getConnection() throws SQLException {
        // Your method to get a database connection
        // Example: return DriverManager.getConnection(DB_URL, USER, PASS);
        return super.connection;
    }
}
