package dev.mvc.review;

import org.springframework.web.multipart.MultipartFile;

/*
    reviewno number(10) NOT NULL PRIMARY KEY,
    usersno number(10) NOT NULL,
    storeno number(10) NOT NULL,
    score number(2) not null,
    contents VARCHAR2(3000) NOT NULL,
    file1 varchar2(200) ,
    file1saved varchar2(200) ,
    thumb varchar2(200) ,
    rdate date NOT NULL,
*/

public class ReviewVO {
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
    
    /**
     * 이미지 파일
     * <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="파일 선택">
     */
    private MultipartFile file1MF;
    
 
    
    public ReviewVO() {
        //System.out.println("->ReviewVO:생성");
    }



    public int getReviewno() {
        //System.out.println("->reviewno:"+reviewno);
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



    public MultipartFile getFile1MF() {
        System.out.println("File1MF :  "+file1MF);
        return file1MF;
    }



    public void setFile1MF(MultipartFile file1mf) {
        file1MF = file1mf;
    }

    
    
}
