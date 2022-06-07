package dev.mvc.work;

import java.util.List;

public interface WorkDAOInter {
    public int create(WorkVO workVO);
    public List<WorkVO> list_storeno(int storeno);
    public WorkVO read(int workno);
    public int update(WorkVO workVO);
    public int delete(int workno);
    public int count_by_storeno(int storeno);
}
