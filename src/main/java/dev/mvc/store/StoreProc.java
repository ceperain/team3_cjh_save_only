package dev.mvc.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.store.StoreProc")
public class StoreProc implements StoreProcInter{
    @Autowired
    private StoreDAOInter storeDAO;
    public StoreProc() {
        System.out.println("-> StoreProc created");
    }
    
    @Override
    public int create(StoreVO storevo) {
        int cnt = this.storeDAO.create(storevo);
        return cnt;
    }

    @Override
    public List<StoreVO> list_all() {
        List<StoreVO> list = this.storeDAO.list_all();
        return list;
    }
    
    @Override
    public StoreVO read(int storeno) {
        StoreVO storeVO = this.storeDAO.read(storeno);
        return storeVO;
    }
    
    @Override
    public int update(StoreVO storeVO) {
        int cnt = this.storeDAO.update(storeVO);
        return cnt;
    }
    
    @Override
    public int delete(int storeno) {
        int cnt = this.storeDAO.delete(storeno);
        return cnt;
    }

}
