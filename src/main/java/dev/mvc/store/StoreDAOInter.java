package dev.mvc.store;

import java.util.List;

public interface StoreDAOInter {
    public int create(StoreVO storeVO);
    public List<StoreVO> list_all();
    public StoreVO read(int storeno);
    public int update(StoreVO storeVO);
    public int delete(int storeno);
}
