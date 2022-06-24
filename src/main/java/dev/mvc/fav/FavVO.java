package dev.mvc.fav;

public class FavVO {
    private int favno;
    private int usersno;
    private int storeno;
    private int favcheck; // 0 or 1
    /**
     * @return the favno
     */
    public int getFavno() {
        return favno;
    }
    /**
     * @param favno the favno to set
     */
    public void setFavno(int favno) {
        this.favno = favno;
    }
    /**
     * @return the usersno
     */
    public int getUsersno() {
        return usersno;
    }
    /**
     * @param usersno the usersno to set
     */
    public void setUsersno(int usersno) {
        this.usersno = usersno;
    }
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
     * @return the favcheck
     */
    public int getFavcheck() {
        return favcheck;
    }
    /**
     * @param favcheck the favcheck to set
     */
    public void setFavcheck(int favcheck) {
        this.favcheck = favcheck;
    }
    
    
}
