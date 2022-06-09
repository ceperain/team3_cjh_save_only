package dev.mvc.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.menu.MenuProc")
public class MenuProc implements MenuProcInter{

    @Autowired
    private MenuDAOInter menuDAO;

    public MenuProc() {
        System.out.println("-> MenuProc created");
    }
    
    @Override
    public int create(MenuVO menuVO) {
        int cnt = this.menuDAO.create(menuVO);
        return cnt;
    }

    @Override
    public List<MenuVO> list_storeno(int storeno) {
       List<MenuVO> list = this.menuDAO.list_storeno(storeno);
        return list;
    }
    @Override
    public int update(MenuVO menuVO) {
        int cnt = this.menuDAO.update(menuVO);
        return cnt;
    }
    @Override
    public int delete(int menuno) {
        int cnt = this.menuDAO.delete(menuno);
        return cnt;
    }
    @Override
    public MenuVO read(int menuno) {
        MenuVO menuVO = this.menuDAO.read(menuno);
        return menuVO;
    }
    @Override
    public int count_by_storeno(int storeno) {
        int cnt = this.menuDAO.count_by_storeno(storeno);
        return cnt;
    }
    @Override
    public int delete_s(int storeno) {
        int cnt = this.menuDAO.delete_s(storeno);
        return cnt;
    }
}
