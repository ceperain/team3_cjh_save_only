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

    
    /* 기본생성자 */
    public CateVO() {

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


    
}
