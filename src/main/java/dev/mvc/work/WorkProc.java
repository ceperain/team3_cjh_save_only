package dev.mvc.work;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.store.StoreDAOInter;

@Component("dev.mvc.work.WorkProc")
public class WorkProc implements WorkProcInter{
    @Autowired
    private WorkDAOInter workDAO;
    public WorkProc() {
        System.out.println("-> WorkProc created");
    }
    
    @Override
    public int create(WorkVO workVO) {
        int cnt = this.workDAO.create(workVO);
        return cnt;
    }
    @Override
    public List<WorkVO> list_storeno(int storeno){
        List<WorkVO> list = this.workDAO.list_storeno(storeno);
        return list;
    }
    @Override
    public WorkVO read(int workno) {
        WorkVO workVO = this.workDAO.read(workno);
        return workVO;
    }
    @Override
    public int update(WorkVO workVO) {
        int cnt = this.workDAO.update(workVO);
        return cnt;
    }
    @Override
    public int delete(int workno) {
        int cnt = this.workDAO.delete(workno);
        return cnt;
    }
    @Override
    public int count_by_storeno(int storeno) {
        int cnt = this.workDAO.count_by_storeno(storeno);
        return cnt;
    }
    @Override
    public int delete_s(int storeno) {
        int cnt = this.workDAO.delete_s(storeno);
        return cnt;
    }
}
