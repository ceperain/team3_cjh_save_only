package dev.mvc.keylist;

import java.util.List;

import dev.mvc.keyword.KeywordVO;
import dev.mvc.review.ReviewVO;

public interface KeylistDAOInter {
    /**
     * 등록
     * 
     * @param keywordVO
     * @return
     */
    public int create(KeylistVO keylistVO);

    
    /**
        * 조회
        * 
        * @param keylistno
        * @return
        */
    public  KeylistVO read(int keylistno);
           
}
