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

    @Override
    public int count_1(int storeno) {
        int cnt = this.keywordDAO.count_1(storeno);
        return cnt;
    }
    
    @Override
    public int count_2(int storeno) {
        int cnt = this.keywordDAO.count_2(storeno);
        return cnt;
    }
    @Override
    public int count_3(int storeno) {
        int cnt = this.keywordDAO.count_3(storeno);
        return cnt;
    }
    
    @Override
    public int count_4(int storeno) {
        int cnt = this.keywordDAO.count_4(storeno);
        return cnt;
    }
    @Override
    public int count_5(int storeno) {
        int cnt = this.keywordDAO.count_5(storeno);
        return cnt;
    }
    
    @Override
    public int count_6(int storeno) {
        int cnt = this.keywordDAO.count_6(storeno);
        return cnt;
    }
    
}
