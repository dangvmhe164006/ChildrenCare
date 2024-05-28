package vn.fpt.edu.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import vn.fpt.edu.model.Blog;
import java.sql.ResultSet;

        


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
    
    
     public ArrayList<Blog> getAllBlogs() {
        ArrayList<Blog> blogs = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Blog]";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("blog_id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                String imageUrl = resultSet.getString("image_url");
                String createdAt = resultSet.getString("created_at");
                int createdBy = resultSet.getInt("created_by");
                Blog blog = new Blog(id, title, content, imageUrl, createdAt, createdBy);
                blogs.add(blog);
            }

            resultSet.close();
            preparedStatement.close();

        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return blogs;
    }
    
     public ArrayList<Blog> getLatestBlogs(int limit) {
    ArrayList<Blog> blogs = new ArrayList<>();
    String sql = "SELECT TOP " + limit + " * FROM [dbo].[Blog] ORDER BY created_at DESC";

    try {
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            int id = resultSet.getInt("blog_id");
            String title = resultSet.getString("title");
            String content = resultSet.getString("content");
            String imageUrl = resultSet.getString("image_url");
            String createdAt = resultSet.getString("created_at");
            int createdBy = resultSet.getInt("created_by");
            Blog blog = new Blog(id, title, content, imageUrl, createdAt, createdBy);
            blogs.add(blog);
        }

        resultSet.close();
        preparedStatement.close();

    } catch (SQLException ex) {
        Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
    }

    return blogs;
}

     
     public Blog getBlogById(int id) {
        Blog blog = null;
        String sql = "SELECT * FROM [dbo].[Blog] WHERE blog_id = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                String imageUrl = resultSet.getString("image_url");
                String createdAt = resultSet.getString("created_at");
                int createdBy = resultSet.getInt("created_by");

                blog = new Blog(id, title, content, imageUrl, createdAt, createdBy);
            }

            resultSet.close();
            preparedStatement.close();

        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return blog;
    }

    public boolean deleteBlog(int id) {
        boolean success = false;
        String sql = "DELETE FROM [dbo].[Blog] WHERE blog_id = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            int rowsAffected = preparedStatement.executeUpdate();
            success = rowsAffected > 0;
            preparedStatement.close();

        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return success;
    }

    public boolean updateBlog(Blog blog) {
        boolean success = false;
        String sql = "UPDATE [dbo].[Blog] " +
                     "SET title = ?, content = ?, image_url = ? " +
                     "WHERE blog_id = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, blog.getTitle());
            preparedStatement.setString(2, blog.getContent());
            preparedStatement.setString(3, blog.getImage_url());
            preparedStatement.setInt(6, blog.getBlog_id());

            int rowsAffected = preparedStatement.executeUpdate();
            success = rowsAffected > 0;
            preparedStatement.close();

        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return success;
    }
     
       public static void main(String[] args) {
        BlogDAO blogDAO = new BlogDAO();
        Blog b =  blogDAO.getBlogById(45);
           System.out.println(b.getBlog_id());
//        ArrayList<Blog> allBlogs = blogDAO.getAllBlogs();
//
//        for (Blog blog : allBlogs) {
//            System.out.println("ID: " + blog.getBlog_id());
//            System.out.println("Title: " + blog.getTitle());
//            System.out.println("Created At: " + blog.getCreate_at());
//            System.out.println();
//        }
    }
 
}


