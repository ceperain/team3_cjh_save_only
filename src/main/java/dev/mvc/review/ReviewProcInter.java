package dev.mvc.review;

import java.util.List;

public interface ReviewProcInter {
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
    
    public List<ReviewVO> list_storeno(int storeno);
    
}
