package dev.mvc.admin;

public class AdminVO {

    private int adminno;
    private String name;
    private String id;
    private String pwd;

    /**
     * @return the adminno
     */
    public int getAdminno() {
        return adminno;
    }

    /**
     * @param adminno the adminno to set
     */
    public void setAdminno(int adminno) {
        this.adminno = adminno;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the pwd
     */
    public String getPwd() {
        return pwd;
    }

    /**
     * @param pwd the pwd to set
     */
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

}
