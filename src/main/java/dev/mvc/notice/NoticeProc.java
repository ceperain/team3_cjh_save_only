package dev.mvc.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.notice.NoticeProc")
public class NoticeProc implements NoticeProcInter{
    
    @Autowired
    private NoticeDAOInter noticeDAO;
    
    public NoticeProc() {
        System.out.println("==> NotceProc created");
    }

    @Override
    public int create(NoticeVO noticeVO) {
        int cnt = this.noticeDAO.create(noticeVO);
        return cnt;
    }

    @Override
    public int update(NoticeVO noticeVO) {
        int cnt = this.noticeDAO.update(noticeVO);
        return cnt;
    }

    @Override
    public int delete(int noticeno) {
        int cnt = this.noticeDAO.delete(noticeno);
        return cnt;
    }

    @Override
    public List<NoticeVO> list() {
        List<NoticeVO> list = this.noticeDAO.list();
        return list;
    }
    

}
