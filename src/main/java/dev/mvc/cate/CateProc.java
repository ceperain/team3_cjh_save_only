package dev.mvc.cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.cate.CateProc")
public class CateProc implements CateProcInter {
    
    @Autowired private CateDAOInter cateDAO;

    public CateProc() {
        // System.out.println("-> CateProc created");
    }

    @Override
    public int create(CateVO cateVO) {
        int cnt = this.cateDAO.create(cateVO);
        return cnt;
    }

    @Override
    public CateVO read(int cateno) {
        CateVO cateVO = this.cateDAO.read(cateno);
        return cateVO;
    }

    @Override
    public int update(CateVO cateVO) {
        int cnt = this.cateDAO.update(cateVO);
        return cnt;
    }

    @Override
    public int delete(int cateno) {
        int cnt = this.cateDAO.delete(cateno);
        return cnt;
    }

    @Override
    public CateVO list(int cateno) {
        CateVO cateVO = this.cateDAO.list(cateno);
        return cateVO;
    }
}





