package dev.mvc.cate;

import java.util.HashMap;
import java.util.List;

import dev.mvc.store.StoreVO;

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
    
    public List<String> read_s(int storeno);

    /**
     * 검색 + 페이징 목록
     * @param map
     * @return
     */
    public List<CateVO> list_by_cateno_search_paging(HashMap<String, Object> map);

    /**
     * 카테고리별 검색 목록
     * @param word
     * @return
     */
    public List<Cate_StoreVO> list_search(String name);

    /**
     * 카테고리별 검색 레코드 갯수
     * @param hashMap
     * @return
     */
    public int search_count(HashMap<String, Object> hashMap);
    
    
    /**
     * 검색 + 페이징 목록
     * @param map
     * @return
     */
    public List<CateVO> list_search_paging(HashMap<String, Object> map);
}
