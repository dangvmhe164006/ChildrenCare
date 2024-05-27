
package vn.fpt.model;


public class CommentDTO {
    private int commentId;
    private int blogId;
    private String content;
    private String createdAt;
    private int createdBy;
    private String username;

    public CommentDTO(int commentId, int blogId, String content, String createdAt, int createdBy, String username) {
        this.commentId = commentId;
        this.blogId = blogId;
        this.content = content;
        this.createdAt = createdAt;
        this.createdBy = createdBy;
        this.username = username;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    
}
