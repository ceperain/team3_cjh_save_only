package dev.mvc.cate;

public class Cate_StoreVO {
    /** 카테고리 번호 */
    private int cateno;
    /** 가게 이름 */
    private String name;
    /** 가게 주소 */
    private String address;
    /** 번호 */
    private int storeno;
    
    /** 기본 생성자 */
    public Cate_StoreVO() {

    }

    public int getCateno() {
        System.out.println("cateno" + cateno);
        return cateno;
    }

    public void setCateno(int cateno) {
        this.cateno = cateno;
    }

    public String getName() {
        System.out.println("name" + name);
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        System.out.println("address" + address);
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStoreno() {
        System.out.println("storeno" + storeno);
        return storeno;
    }

    public void setStoreno(int storeno) {

        this.storeno = storeno;
    }

    

    
    
}
