package dev.mvc.fav;

import java.util.List;
import java.util.Map;

public interface FavDAOInter {

    /**
     * 
     * @param map
     * @return
     */
    public int countfav(Map<String, Object> map);

    /**
     * 
     * @param map
     * @return
     */
    public int create(Map<String, Object> map);

    /**
     * 
     * @param map
     * @return
     */
    public int favcheck(Map<String, Object> map);

    /**
     * 
     * @param map
     * @return
     */
    public int favcheck_cancel(Map<String, Object> map);

    /**
     * 
     * @param map
     * @return
     */
    public FavVO read(Map<String, Object> map);

    /**
     * 
     * @param usersno
     * @return
     */
    public int deleteByUsersno(int usersno);

    /**
     * 
     * @param storeno
     * @return
     */
    public int deleteByStoreno(int storeno);
    
    /**
     * 
     * @param usersno
     * @return
     */
    public List<FavDataVO> favorite_list(int usersno);
}
