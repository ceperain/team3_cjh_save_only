package dev.mvc.fav;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.fav.FavProc")
public class FavProc implements FavProcInter {

    @Autowired
    private FavDAOInter favDAO;

    
    @Override
    public int countfav(Map<String, Object> map) {
        int cnt = this.favDAO.countfav(map);
        return cnt;
    }
    @Override
    public int create(Map<String, Object> map) {
        int cnt = this.favDAO.create(map);
        return cnt;
    }

    @Override
    public int favcheck(Map<String, Object> map) {
        int cnt = this.favDAO.favcheck(map);
        return cnt;
    }

    @Override
    public int favcheck_cancel(Map<String, Object> map) {
        int cnt = this.favDAO.favcheck_cancel(map);
        return cnt;
    }

    @Override
    public FavVO read(Map<String, Object> map) {
        FavVO favVO = this.favDAO.read(map);
        return favVO;
    }

    @Override
    public int deleteByUsersno(int usersno) {
        int cnt = this.favDAO.deleteByUsersno(usersno);
        return cnt;
    }

    @Override
    public int deleteByStoreno(int storeno) {
        int cnt = this.favDAO.deleteByStoreno(storeno);
        return cnt;
    }
    @Override
    public List<FavDataVO> favorite_list(int usersno) {
        List<FavDataVO> list = this.favDAO.favorite_list(usersno);
        return list;
    }

}
