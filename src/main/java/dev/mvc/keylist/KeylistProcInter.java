package dev.mvc.keylist;

import java.util.List;

public interface KeylistProcInter {
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
    public KeylistVO read(int keylistno);
              
}
