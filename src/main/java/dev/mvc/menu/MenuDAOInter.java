package dev.mvc.menu;

import java.util.List;

public interface MenuDAOInter {
    public int create(MenuVO menuVO);
    public List<MenuVO> list_storeno(int storeno);
    public int update(MenuVO menuVO);
    public int delete(int menuno);
    public MenuVO read(int menuno);
    public int count_by_storeno(int storeno);
}
