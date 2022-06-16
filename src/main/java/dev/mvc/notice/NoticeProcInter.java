package dev.mvc.notice;

import java.util.List;

public interface NoticeProcInter {

    /**
     * 등록
     * 
     * @param noticeVO
     * @return 등록된 갯수
     */
    public int create(NoticeVO noticeVO);

    /**
     * 수정 처리
     * @param noticeVO
     * @return 수정된 레코드 갯수
     */
    public int update(NoticeVO noticeVO);
   
    /**
     * 삭제 처리 
     * @param noticeno
     * @return 삭제된 레코드 갯수
     */
    public int delete(int noticeno);
 
    /**
     * 상점 목록
     * @param 
     * @return noticeVO
     */
    public List<NoticeVO> list();
    
}
