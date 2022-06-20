package dev.mvc.users;

import java.util.List;
import java.util.Map;

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
     * @param email
     * @return
     */
    public UsersVO readByEmail(String email);

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

    /**
     * 이메일 중복확인
     * 
     * @param email
     * @return
     */
    public int checkEmail(String email);

    /**
     * 
     * @param map
     * @return
     */
    public int login(Map<String, Object> map);
    public List<UsersVO> read_name(int storeno);
}
