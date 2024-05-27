/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import vn.fpt.model.Comment;

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

}
