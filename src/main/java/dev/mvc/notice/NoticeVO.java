package dev.mvc.notice;

/*CREATE TABLE notice(
        noticeno number(10) NOT NULL PRIMARY KEY,
        adminno number(10) not null,
        title VARCHAR2(50) NOT NULL,
        contents varchar2(1000) NOT NULL,
        rdate date NOT NULL,
        FOREIGN KEY (adminno) REFERENCES admin (adminno)
    );*/

public class NoticeVO {
    /** 공지사항 번호 */
    private int noticeno;
    /** 관리자 번호 */
    private int adminno;
    /** 공지사항 제목 */
    private String title;
    /** 공지사항 내용 */
    private String contents;
    /** 공지사항 등록일 */
    private String rdate;
    
    /** 기본 생성자*/
    public NoticeVO() {
        
    }

    public int getNoticeno() {
        System.out.println("noticeno : " + noticeno);
        return noticeno;
    }

    public void setNoticeno(int noticeno) {
        this.noticeno = noticeno;
    }

    public int getAdminno() {
        System.out.println("adminno : " + adminno);
        return adminno;
    }

    public void setAdminno(int adminno) {
        this.adminno = adminno;
    }

    public String getTitle() {
        System.out.println("title : " + title);
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        System.out.println("contents : " + contents);
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getRdate() {
        System.out.println("rdate : " + rdate);
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    } 
    
    
    
}
