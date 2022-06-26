package dev.mvc.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.admin.AdminProc")
public class AdminProc implements AdminProcInter {

    @Autowired
    private AdminDAOInter AdminDAO;

    @Override
    public int login(Map<String, Object> map) {
        int cnt = this.AdminDAO.login(map);
        return cnt;
    }

    @Override
    public AdminVO readById(String id) {
        AdminVO adminVO = this.AdminDAO.readById(id);
        return adminVO;
    }

}
