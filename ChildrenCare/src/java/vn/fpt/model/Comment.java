/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.model;

/**
 *
 * @author dangv
 */
public class Comment {
    

    private int comment_id;
    private int blog_id;
    private String content;
    private String create_at;
    private int create_by;

    public Comment() {
    }

    public Comment(int comment_id, int blog_id, String content, String create_at, int create_by) {
        this.comment_id = comment_id;
        this.blog_id = blog_id;
        this.content = content;
        this.create_at = create_at;
        this.create_by = create_by;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreate_at() {
        return create_at;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
    }

    public int getCreate_by() {
        return create_by;
    }

    public void setCreate_by(int create_by) {
        this.create_by = create_by;
    }
    
}
