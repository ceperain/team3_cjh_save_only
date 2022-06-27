package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

public interface NoticeProcInter {
    /**
     * 공지사항 등록
     * @param noticeVO
     * @return
     */
    public int create(NoticeVO noticeVO);
    
    /**
     * 공지사항 목록
     * @return
     */
    public List<NoticeVO> list();
    
    /**
     * 공지사항 조회
     * @param noticeno
     * @return
     */
    public NoticeVO read(int noticeno);
    
    /**
     * 공지사항 수정
     * @param noticeVO
     * @return
     */
    public int update(NoticeVO noticeVO);
    
    /**
     * 공지사항 삭제
     * @param noticeno
     * @return
     */
    public int delete(int noticeno);
    
    /**
     * 카테고리별 검색 목록
     * @param hashMap
     * @return
     */
    public List<NoticeVO> list_search(String word);

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
    public List<NoticeVO> list_search_paging(HashMap<String, Object> map);
    
    /**
     * 페이지 목록 문자열 생성, Box 형태
     * @param noticeno 카테고리번호
     * @param search_count 검색 갯수
     * @param now_page 현재 페이지, now_page는 1부터 시작
     * @param title 검색어
     * @return
     */
    public String pagingBox(int noticeno, int search_count, int now_page, String title);
    
}
