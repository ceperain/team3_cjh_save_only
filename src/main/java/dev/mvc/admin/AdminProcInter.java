package dev.mvc.admin;

import java.util.Map;

public interface AdminProcInter {

    /**
     * 
     * @param map
     * @return
     */
    public int login(Map<String, Object> map);
    
    /**
     * 
     * @param id
     * @return
     */
    public AdminVO readById(String id);
}
