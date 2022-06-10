package dev.mvc.users;

import java.util.List;

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
     * 사용자 전체 리스트
     * 
     * @return
     */
    public List<UsersVO> list();

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
