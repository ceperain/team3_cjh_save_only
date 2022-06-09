package dev.mvc.cate;

import java.util.List;

public interface CateProcInter {
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
    public List<CateVO> read();
    
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
     * 상점 목록
     * @param cateno
     * @return cateVO
     */
    public List<CateVO> list(int cateno);
    
}


