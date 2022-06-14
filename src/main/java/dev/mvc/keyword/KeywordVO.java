package dev.mvc.keyword;
/*
 * keywordno NUMBER(10) NOT NULL PRIMARY KEY, 
 * reviewno NUMBER(10) NOT NULL,
 * keylistno NUMBER(2) NOT NULL,
 */

public class KeywordVO {
    /**키워드 번호*/
    private int keywordno;
    /** 리뷰 번호 */
    private int reviewno;
    /** 키워드 리스트 */
    private int keylistno;


public KeywordVO() {
    
}


public int getKeywordno() {
    return keywordno;
}


public void setKeywordno(int keywordno) {
    this.keywordno = keywordno;
}


public int getReviewno() {
    return reviewno;
}


public void setReviewno(int reviewno) {
    this.reviewno = reviewno;
}


public int getKeylistno() {
    return keylistno;
}


public void setKeylistno(int keylistno) {
    this.keylistno = keylistno;
}

}