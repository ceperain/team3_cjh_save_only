package dev.mvc.review;

import java.util.HashMap;
import java.util.List;




public interface ReviewDAOInter {
    /**
     * 등록
     * @param reviewVO
     * @return
     */
    public int create(ReviewVO reviewVO);
    
    /**
     * 등록 순서별 목록
     * @return
     */
    public List<ReviewVO> list_reviewno();
    
    /**
     * 조회
     * @param reviewno
     * @return
     */
    public ReviewVO read(int reviewno);
    
    /**
     * 수정
     * @param reviewVO
     * @return 처리된 레코드 갯수
     */
    public int update(ReviewVO reviewVO);
    
    /**
     * 삭제
     * @param reviewno
     * @return 삭제된 레코드 갯수
     */
    public int delete(int reviewno);
    
    public List<ReviewVO> list_storeno(int storeno);
    public int read_user(HashMap<String, Integer> hashmap);
}
