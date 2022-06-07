/**********************************/
/* Table Name: 리뷰 */
/**********************************/
drop table review;
CREATE TABLE review(
    reviewno number(10) NOT NULL PRIMARY KEY,
    usersno number(10) NOT NULL,
    storeno number(10) NOT NULL,
    score number(2) not null,
    contents VARCHAR2(3000) NOT NULL,
    file1 varchar2(200) ,
    file1saved varchar2(200) ,
    thumb varchar2(200) ,
    rdate date NOT NULL,
    FOREIGN KEY (usersno) REFERENCES users (usersno),
    FOREIGN KEY (storeno) REFERENCES store (storeno)
);

COMMENT ON TABLE review is '리뷰';
COMMENT ON COLUMN review.reviewno is '리뷰 번호';
COMMENT ON COLUMN review.usersno is '회원 번호';
COMMENT ON COLUMN review.storeno is '상품(매장) 번호';
COMMENT ON COLUMN review.score is '별점';
COMMENT ON COLUMN review.contents is '리뷰 내용';
COMMENT ON COLUMN review.file1 is '사진-업로드 이름';
COMMENT ON COLUMN review.file1saved is '사진-서버 저장 이름';
COMMENT ON COLUMN review.thumb is '썸네일';
COMMENT ON COLUMN review.rdate is '작성일';

DROP SEQUENCE review_seq;
CREATE SEQUENCE review_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    CACHE 2 
    NOCYCLE;

--리뷰 등록
insert into reiview(reviewno, userno,storeno, score, contents,rdate)
values(review_seq.nextval, 1, 1, 5, '잘 먹고 갑니다', sysdate);

--수정
update review
set
    title='수정된 리뷰 제목',
    contents='수정된 내용'
where reviewno=1;

--삭제
delete from review
where reviewno=5;