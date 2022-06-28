package dev.mvc.store;

import java.util.HashMap;
import java.util.List;

import dev.mvc.cate.Cate_StoreVO;

public interface StoreDAOInter {
    /**
     * 등록
     * @param storeVO
     * @return
     */
    public int create(StoreVO storeVO);
    /**
     * 목록
     * @return
     */
    public List<StoreVO> list_all();
    /**
     * 읽기
     * @param storeno
     * @return
     */
    public StoreVO read(int storeno);
    /**
     * 수정
     * @param storeVO
     * @return
     */
    public int update(StoreVO storeVO);
    /**
     * 삭제
     * @param storeno
     * @return
     */
    public int delete(int storeno);
    /**
     * 페이징
     * @param map
     * @return
     */
    public List<StoreVO> list_search_paging(HashMap<String, Object> map);
    /**
     * 매장 총 개수
     * @return
     */
    public int count();
}

