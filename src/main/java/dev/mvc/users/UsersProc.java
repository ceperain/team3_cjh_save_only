package dev.mvc.users;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.users.UsersProc")
public class UsersProc implements UsersProcInter {

    @Autowired
    private UsersDAOInter UsersDAO;

    @Override
    public int create(UsersVO usersVO) {
        int cnt = this.UsersDAO.create(usersVO);
        return cnt;
    }

    @Override
    public UsersVO read(int usersno) {
        UsersVO usersVO = this.UsersDAO.read(usersno);
        return usersVO;
    }

    @Override
    public UsersVO readByEmail(String email) {
        UsersVO usersVO = this.UsersDAO.readByEmail(email);
        return usersVO;
    }

    @Override
    public List<UsersVO> list() {
        List<UsersVO> list = this.UsersDAO.list();
        return list;
    }

    @Override
    public int update(UsersVO usersVO) {
        int cnt = this.UsersDAO.update(usersVO);
        return cnt;
    }

    @Override
    public int delete(int usersno) {
        int cnt = this.UsersDAO.delete(usersno);
        return cnt;
    }
    
    @Override
    public int checkEmail(String email) {
        int cnt = this.UsersDAO.checkEmail(email);
        return cnt;
    }

    @Override
    public int login(Map<String, Object> map) {
        int cnt = this.UsersDAO.login(map);
        return cnt;
    }



}
