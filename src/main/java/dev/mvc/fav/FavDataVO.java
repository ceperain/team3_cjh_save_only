package dev.mvc.fav;

/*
 * select s.storeno, s.name as s_name, s.address as address, c.name as c_name
 * from store s, cate c, catejoin j
 * where (s.storeno = j.storeno and j.cateno = c.cateno) and 
 *     (s.storeno in (select storeno
 *                    from favorite
 *                    where favcheck=1 and usersno=5
 *                  )
 *      )
 */
public class FavDataVO {
    private int storeno;
    private int cateno;
    private String address;
    private String s_name;
    private String c_name;

    /**
     * @return the storeno
     */
    public int getStoreno() {
        return storeno;
    }

    /**
     * @param storeno the storeno to set
     */
    public void setStoreno(int storeno) {
        this.storeno = storeno;
    }

    /**
     * @return the cateno
     */
    public int getCateno() {
        return cateno;
    }

    /**
     * @param cateno the cateno to set
     */
    public void setCateno(int cateno) {
        this.cateno = cateno;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the s_name
     */
    public String getS_name() {
        return s_name;
    }

    /**
     * @param s_name the s_name to set
     */
    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    /**
     * @return the c_name
     */
    public String getC_name() {
        return c_name;
    }

    /**
     * @param c_name the c_name to set
     */
    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

}
