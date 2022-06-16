package dev.mvc.store;

import dev.mvc.review.ReviewVO;

public class Users_ReviewVO {
    private int r_usersno;

    private String name;
    
    /** 리뷰 번호 */
    private int reviewno;
    /** 회원 번호 */
    private int usersno;
    /** 상품(매장) 번호 */
    private int storeno;
    /** 별점 */
    private int score;
    /** 내용 */
    private String contents = "";
    /**메인 이미지 */
    private String file1 = "";
    /** 실제 저장된 메인 이미지 */
    private String file1saved = "";
    /** 메인 이미지 preview */
    private String thumb = "";
    /** 등록 날짜 */
    private String rdate = "";
    public Users_ReviewVO() {
        
    }
    public int getR_usersno() {
        return r_usersno;
    }
    public void setR_usersno(int r_usersno) {
        this.r_usersno = r_usersno;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getReviewno() {
        return reviewno;
    }
    public void setReviewno(int reviewno) {
        this.reviewno = reviewno;
    }
    public int getUsersno() {
        return usersno;
    }
    public void setUsersno(int usersno) {
        this.usersno = usersno;
    }
    public int getStoreno() {
        return storeno;
    }
    public void setStoreno(int storeno) {
        this.storeno = storeno;
    }
    public int getScore() {
        return score;
    }
    public void setScore(int score) {
        this.score = score;
    }
    public String getContents() {
        return contents;
    }
    public void setContents(String contents) {
        this.contents = contents;
    }
    public String getFile1() {
        return file1;
    }
    public void setFile1(String file1) {
        this.file1 = file1;
    }
    public String getFile1saved() {
        return file1saved;
    }
    public void setFile1saved(String file1saved) {
        this.file1saved = file1saved;
    }
    public String getThumb() {
        return thumb;
    }
    public void setThumb(String thumb) {
        this.thumb = thumb;
    }
    public String getRdate() {
        return rdate;
    }
    public void setRdate(String rdate) {
        this.rdate = rdate;
    }
    
    public void addReviewVO(ReviewVO reviewVO) {
        this.reviewno = reviewVO.getReviewno();
        this.contents = reviewVO.getContents();
        this.file1 = reviewVO.getFile1();
        this.file1saved = reviewVO.getFile1saved();
        this.thumb = reviewVO.getThumb();
        this.score = reviewVO.getScore();
        this.rdate = reviewVO.getRdate();
        this.storeno = reviewVO.getStoreno();
        this.usersno = reviewVO.getUsersno();
    }
    
}
