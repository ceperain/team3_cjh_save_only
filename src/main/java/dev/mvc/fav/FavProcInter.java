package dev.mvc.fav;

import java.util.List;
import java.util.Map;

public interface FavProcInter {

    /**
     * 
     * @param map
     * @return
     */
    public int countfav(Map<String, Object> map);

    /**
     * 
     * @param usersno
     * @return
     */
    public int countByUsers(int usersno);

    /**
     * 
     * @param map
     * @return
     */
    public int create(Map<String, Object> map);

    /**
     * 
     * @param map
     * @return
     */
    public int favcheck(Map<String, Object> map);

    /**
     * 
     * @param map
     * @return
     */
    public int favcheck_cancel(Map<String, Object> map);

    /**
     * 
     * @param map
     * @return
     */
    public FavVO read(Map<String, Object> map);

    /**
     * 
     * @param usersno
     * @return
     */
    public int deleteByUsersno(int usersno);

    /**
     * 
     * @param storeno
     * @return
     */
    public int deleteByStoreno(int storeno);

    /**
     * 
     * @param usersno
     * @return
     */
    public List<FavDataVO> favorite_list(int usersno);

    /**
     * 
     * @param map
     * @return
     */
    public List<FavDataVO> favorite_list_paging(Map<String, Object> map);

    /**
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작
     * 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17 18 19 20 [다음]
     *
     * @param list_file    목록 파일명
     * @param cateno       카테고리번호
     * @param search_count 검색(전체) 레코드수
     * @param now_page     현재 페이지
     * @param word         검색어
     * @return 페이징 생성 문자열
     */
    String pagingBox(int search_count, int now_page);
}
