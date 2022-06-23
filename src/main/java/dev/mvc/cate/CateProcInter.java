package dev.mvc.cate;

import java.util.HashMap;
import java.util.List;

import dev.mvc.store.StoreVO;

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
     * @param sssss 카테고리 번호, PK
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
    public List<Cate_StoreVO> list_search_paging(HashMap<String, Object> map);
   
    /**
     * 페이지 목록 문자열 생성, Box 형태
     * @param cateno 카테고리번호
     * @param search_count 검색 갯수
     * @param now_page 현재 페이지, now_page는 1부터 시작
     * @param name 검색어
     * @return
     */
    public String pagingBox(int cateno, int search_count, int now_page, String name);
    
}


