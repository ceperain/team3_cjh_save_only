package dev.mvc.keylist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.keylist.KeylistProc")
public class KeylistProc implements KeylistProcInter{
    @Autowired
    private KeylistDAOInter keylistDAO;
    
    @Override
    public int create(KeylistVO keylistVO) {
        int cnt=this.keylistDAO.create(keylistVO);
        return cnt;
    }

    @Override
    public KeylistVO read(int keylistno) {
        KeylistVO  keylistVO=this.keylistDAO.read(keylistno);
        return keylistVO;
    }

}
