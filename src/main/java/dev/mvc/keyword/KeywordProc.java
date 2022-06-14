package dev.mvc.keyword;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.keyword.KeywordProc")
public class KeywordProc implements KeywordProcInter{
    @Autowired
    private KeywordDAOInter keywordDAO;
    
    @Override
    public int create(int keylistno) {
        int cnt=this.keywordDAO.create(keylistno);
        return cnt;
    }

    @Override
    public List<KeywordVO> read(int reviewno) {
        List<KeywordVO> list=this.keywordDAO.read(reviewno);
        return list;
    }

    @Override
    public int update(int keyowrdno) {
        int cnt=this.keywordDAO.update(keyowrdno);
        return cnt;
    }

    @Override
    public int delete(int reviewno) {
        int cnt=this.keywordDAO.delete(reviewno);
        return cnt;
    }

    @Override
    public int create2(KeywordVO keywordVO) {
        int cnt=this.keywordDAO.create2(keywordVO);
        return cnt;
    }
    
    
    
}
