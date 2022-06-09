package dev.mvc.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.users.UsersProc")
public class UsersProc implements UsersProcInter{
    
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
    public int update(UsersVO usersVO) {
        int cnt = this.UsersDAO.update(usersVO);
        return cnt;
    }

    @Override
    public int delete(int usersno) {
        int cnt = this.UsersDAO.delete(usersno);
        return cnt;
    }

}
