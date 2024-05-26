package vn.fpt.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import vn.fpt.model.Blog;


public class BlogDAO extends DBConnect {
    
    public int createBlog(Blog blog) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Blog] " +
                     "([title], [content], [image_url], [created_at],"
                      + " [created_by]) " +
                     "VALUES (?, ?, ?, ?, ?)";

        try {
            
         PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, blog.getTitle());
            preparedStatement.setString(2, blog.getContent());
            preparedStatement.setString(3, blog.getImage_url());
            preparedStatement.setString(4, blog.getCreate_at());
            preparedStatement.setInt(5, blog.getCreate_by());
            n = preparedStatement.executeUpdate();
             preparedStatement.close();

            
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
 
}
