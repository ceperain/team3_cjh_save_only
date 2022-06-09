package dev.mvc.cate;

import java.util.List;

public interface CateDAOInter {
    /**
     * 등록
     * 
     * @param cateVO
     * @return 등록된 갯수
     */
    public int create(CateVO cateVO);

    /**
     * 조회, 수정
     * @param cateno 카테고리 번호, PK
     * @return 
     */
    public CateVO read(int cateno);
    
    /**
     * 수정 처리
     * @param cateVO
     * @return 수정된 레코드 갯수
     */
    public int update(CateVO cateVO);
   
    /**
     * 삭제 처리 
     * @param cateno
     * @return 삭제된 레코드 갯수
     */
    public int delete(int cateno);
 
    /**
     * 조회 Join
     * @param cateno 카테고리 번호, PK
     * @return 
     */
    public CateVO list(int cateno);
}
