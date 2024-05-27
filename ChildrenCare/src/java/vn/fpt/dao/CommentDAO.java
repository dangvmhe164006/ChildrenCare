package vn.fpt.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import vn.fpt.model.Comment;
import java.sql.ResultSet;
import vn.fpt.model.CommentDTO;

/**
 *
 * @author dangv
 */
public class CommentDAO extends DBConnect {

    public int insertComment(Comment comment) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Comment] ([blog_id], [comment_content], [created_at], [created_by]) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, comment.getBlog_id());
            preparedStatement.setString(2, comment.getContent());
            preparedStatement.setString(3, comment.getCreate_at());
            preparedStatement.setInt(4, comment.getCreate_by());
            n = preparedStatement.executeUpdate();
            preparedStatement.close();

        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteComment(int commentId) {
        int rowsDeleted = 0;
        String sql = "DELETE FROM [dbo].[Comment] WHERE comment_id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, commentId);
            rowsDeleted = preparedStatement.executeUpdate();
            preparedStatement.close();

        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowsDeleted;
    }

    public ArrayList<Comment> getAllComments() {
        ArrayList<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Comment]";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int commentId = resultSet.getInt("comment_id");
                int blogId = resultSet.getInt("blog_id");
                String content = resultSet.getString("comment_content");
                String createdAt = resultSet.getString("created_at");
                int createdBy = resultSet.getInt("created_by");

                Comment comment = new Comment(commentId, blogId, content, createdAt, createdBy);
                comments.add(comment);
            }

            preparedStatement.close();
            resultSet.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return comments;
    }
    
    
    public ArrayList<CommentDTO> getCommentsByBlogid(int blogID) {
    ArrayList<CommentDTO> comments = new ArrayList<>();
    String sql = "SELECT c.comment_id, c.blog_id, c.comment_content, c.created_at, c.created_by, u.user_name " +
                 "FROM [dbo].[Comment] c " +
                 "JOIN [dbo].[User] u ON c.created_by = u.user_id " +
                 "WHERE c.blog_id = ?";

    try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        preparedStatement.setInt(1, blogID);

        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int commentId = resultSet.getInt("comment_id");
                int blogId = resultSet.getInt("blog_id");
                String content = resultSet.getString("comment_content");
                String createdAt = resultSet.getString("created_at");
                int createdBy = resultSet.getInt("created_by");
                String username = resultSet.getString("user_name");

                CommentDTO commentDTO = new CommentDTO(commentId, blogId, content, createdAt, createdBy, username);
                comments.add(commentDTO);
            }
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return comments;
}

    

       public static void main(String[] args) {
       CommentDAO dao  = new CommentDAO();
       Comment c  = new Comment();
       c.setBlog_id(45);
       c.setContent("test");
       c.setCreate_by(1);
      
      int n=  dao.insertComment(c);
      if(n>0){
          System.out.println("tv");
      }else{
          System.out.println("fail");
      
      }
         

    }
}
