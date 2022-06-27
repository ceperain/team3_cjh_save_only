package dev.mvc.store;

import java.util.HashMap;
import java.util.List;

public interface StoreProcInter {
    public int create(StoreVO storeVO);
    public List<StoreVO> list_all();
    public StoreVO read(int storeno);
    public int update(StoreVO storeVO);
    public int delete(int storeno);
    public List<StoreVO> list_search_paging(HashMap<String, Object> map);
    public String pagingBox(int storeno, int cnt,int now_page);
    public int count();
}
