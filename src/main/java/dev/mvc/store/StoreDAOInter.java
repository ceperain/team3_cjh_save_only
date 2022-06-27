package dev.mvc.store;

import java.util.HashMap;
import java.util.List;

import dev.mvc.cate.Cate_StoreVO;

public interface StoreDAOInter {
    public int create(StoreVO storeVO);
    public List<StoreVO> list_all();
    public StoreVO read(int storeno);
    public int update(StoreVO storeVO);
    public int delete(int storeno);
    public List<StoreVO> list_search_paging(HashMap<String, Object> map);
    public int count();
}

