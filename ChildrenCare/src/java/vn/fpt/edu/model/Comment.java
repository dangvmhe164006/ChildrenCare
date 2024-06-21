
package vn.fpt.edu.model;

import java.sql.Date;

public class Comment {

    private int userID;
    private int postID;
    private String content;
    private Date commentDate;

    public Comment() {
    }

    public Comment(int userID, int postID, String content, Date commentDate) {
        this.userID = userID;
        this.postID = postID;
        this.content = content;
        this.commentDate = commentDate;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    
}
