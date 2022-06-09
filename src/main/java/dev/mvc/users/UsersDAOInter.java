package dev.mvc.users;

public interface UsersDAOInter {

    /**
     * 
     * @param usersVO
     * @return
     */
    public int create(UsersVO usersVO);

    /**
     * 
     * @param usersno
     * @return
     */
    public UsersVO read(int usersno);

    /**
     * 
     * @param usersVO
     * @return
     */
    public int update(UsersVO usersVO);

    /**
     * 
     * @param usersno
     * @return
     */
    public int delete(int usersno);
}
