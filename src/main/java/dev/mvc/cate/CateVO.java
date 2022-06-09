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
    /** store_s 매장명 Join용 변수 */
    private String s_name;
    /** store_s 매장 주소 Join용 변수 */
    private String s_address;
    
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

    /*
     * @Override public String toString() { return "[r_cateno=" + r_cateno +
     * ", s_name=" + s_name + ", s_address=" + s_address + ", name=" + name +
     * ", rdate=" + rdate + ", cnt=" + cnt + "]"; }
     */
}

/*
 * select s.name as s_name, s.address as s_address
 * from store s, cate c,
 * catejoin j where s.storeno = j.storeno and j.cateno = c.cateno;
 */
