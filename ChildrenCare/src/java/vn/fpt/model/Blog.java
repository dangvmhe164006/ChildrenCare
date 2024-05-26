package vn.fpt.model;

public class Blog {
    
    private int blog_id;
    private String title;
    private String content;
    private String image_url;
    private String create_at;
    private int create_by;

    public Blog() {
    }

    public Blog(int blog_id, String title, String content, String image_url, String create_at, int create_by) {
        this.blog_id = blog_id;
        this.title = title;
        this.content = content;
        this.image_url = image_url;
        this.create_at = create_at;
        this.create_by = create_by;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
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
