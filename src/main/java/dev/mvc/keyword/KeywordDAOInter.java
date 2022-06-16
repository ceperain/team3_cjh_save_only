package dev.mvc.keyword;

import java.util.List;

import dev.mvc.review.ReviewVO;

public interface KeywordDAOInter {
    /**
     * 등록
     * @param keywordVO
     * @return
     */
    public int create(int keylistno);
    
    /**
     * 등록
     * @param keywordVO
     * @return
     */
    public int create2(KeywordVO keywordVO);
    
    

    /**
     * 조회
     * @param reviewno
     * @return
     */
    public  List<KeywordVO> read(int reviewno);
    

    
    /**
     * 수정
     * @param keyowrdno
     * @return 처리된 레코드 갯수
     */
    public int update(int keyowrdno);
    
    /**
     * 삭제
     * @param reviewno
     * @return 삭제된 레코드 갯수
     */
    public int delete(int reviewno);
    
    public  int  count_1(int storeno);
    public  int  count_2(int storeno);
    public  int  count_3(int storeno);
    public  int  count_4(int storeno);
    public  int  count_5(int storeno);
    public  int  count_6(int storeno);
}
