package dev.mvc.cate;

/*
CREATE TABLE cate(
cateno    NUMBER(10)            NOT NULL      PRIMARY KEY,
name     VARCHAR2(50)           NOT NULL,
rdate      DATE                       NOT NULL
);
 */
public class CateVO {
    /** 카테고리 번호 */
    private int cateno;
    /** 카테고리 이름 */
    private String name;
    /** 등록일 */
    private String rdate;
    /** 이미지 */
    private String image;
    /** 상점이름 */
    private String s_name;
    /** 상점주소 */
    private String s_address;
    /** 가게번호 */
    private int s_storeno;
    /** 리뷰내용 */
    private String contents;
    
    /* 기본생성자 */
    public CateVO() {

    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public int getCateno() {
        return cateno;
    }

    public void setCateno(int cateno) {
        this.cateno = cateno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public String getS_address() {
        return s_address;
    }

    public void setS_address(String s_address) {
        this.s_address = s_address;
    }

    public int getS_storeno() {
        return s_storeno;
    }

    public void setS_storeno(int s_storeno) {
        this.s_storeno = s_storeno;
    }

}
 