/**********************************/
/* Table Name: 회원 */
/**********************************/

drop table users;
CREATE TABLE users(
    usersno number(10) NOT NULL PRIMARY KEY,
    email VARCHAR2(100) NOT NULL,
    pwd VARCHAR2(60) NOT NULL,
    sex VARCHAR2(10) NOT NULL,
    bdate date NOT NULL,
    phone varchar2(20) NOT NULL,
    rdate date NOT NULL
);

COMMENT ON TABLE users is '회원';
COMMENT ON COLUMN users.userno is '회원번호';
COMMENT ON COLUMN users.email is '이메일';
COMMENT ON COLUMN users.pwd is '비밀번호';
COMMENT ON COLUMN users.sex is '성별';
COMMENT ON COLUMN users.bdate is '생년월일';
COMMENT ON COLUMN users.phone is '전화번호';
COMMENT ON COLUMN users.rdate is '가입일';


DROP SEQUENCE users_seq;
CREATE SEQUENCE users_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    CACHE 2 
    NOCYCLE;


--회원
insert into users(usersno, email, pwd, sex, bdate, phone, rdate)
values(users_seq.nextval,'test@gmail.com', 'testpwd' , '남' , '1999-01-01' ,'010-0000-0000', sysdate);

/**********************************/
/* Table Name: 매장 */
/**********************************/

drop table store;
CREATE TABLE store(
    storeno number(10) NOT NULL PRIMARY KEY,
    name VARCHAR2(150) NOT NULL,
    address VARCHAR2(300) NOT NULL,
    visible number(1) default 1 NOT NULL,
    lat number ,
    lng number ,
    rdate date NOT NULL
);

COMMENT ON TABLE store is '상품(매장)';
COMMENT ON COLUMN store.storeno is '상품(매장) 번호';
COMMENT ON COLUMN store.name is '상품(매장)명';
COMMENT ON COLUMN store.address is '주소';
COMMENT ON COLUMN store.visible is '영업여부';
COMMENT ON COLUMN store.lat is '위도';
COMMENT ON COLUMN store.lng is '경도';
COMMENT ON COLUMN store.rdate is '등록일';


DROP SEQUENCE store_seq;
CREATE SEQUENCE store_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    CACHE 2 
    NOCYCLE;

--매장
insert into store(storeno, name, address, visible, rdate)
values(store_seq.nextval, '매장 테스트' ,'서울시 종로구 어딘가', 1, sysdate);

/**********************************/
/* Table Name: 메뉴 */
/**********************************/

CREATE TABLE menu(
      menuno                              NUMBER(30)       NOT NULL       PRIMARY KEY,
      storeno                             NUMBER(10)       NOT NULL,
      name                                VARCHAR2(300)       NOT NULL,
      price                               NUMBER(8)       NULL ,
  FOREIGN KEY (storeno) REFERENCES store (storeno)
);

COMMENT ON TABLE menu is '메뉴';
COMMENT ON COLUMN menu.menuno is '메뉴 번호';
COMMENT ON COLUMN menu.storeno is '매장 번호';
COMMENT ON COLUMN menu.name is '메뉴 이름';
COMMENT ON COLUMN menu.price is '메뉴 가격';


CREATE SEQUENCE menu_seq
  START WITH 1               -- 시작 번호
  INCREMENT BY 1           -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;   


/**********************************/
/* Table Name: 영업 */
/**********************************/

CREATE TABLE working(
      workno                              NUMBER(24)       NOT NULL       PRIMARY KEY,
      storeno                             NUMBER(10)       NOT NULL,
      day                                 VARCHAR2(15)       NOT NULL,
      starttime                           VARCHAR2(40)       NULL ,
      endtime                             VARCHAR2(40)       NULL ,
  FOREIGN KEY (storeno) REFERENCES store (storeno)
);

COMMENT ON TABLE working is '영업시간';
COMMENT ON COLUMN working.workno is '영업시간 번호';
COMMENT ON COLUMN working.storeno is '상품(매장) 번호';
COMMENT ON COLUMN working.day is '요일';
COMMENT ON COLUMN working.starttime is '영업 시작 시간';
COMMENT ON COLUMN working.endtime is '영업 종료 시간';

CREATE SEQUENCE working_seq
  START WITH 1               -- 시작 번호
  INCREMENT BY 1           -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;   


/**********************************/
/* Table Name: 리뷰 */
/**********************************/

drop table review;
CREATE TABLE review(
    reviewno number(10) NOT NULL PRIMARY KEY,
    usersno number(10) NOT NULL,
    storeno number(10) NOT NULL,
    score number(2) not null,
    contents VARCHAR2(4000) NOT NULL,
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
insert into review(reviewno, usersno,storeno, score, contents,rdate)
values(review_seq.nextval, 1, 2, 3, '잘 먹고 갑니다3', sysdate);

insert into review(reviewno, usersno,storeno, score, contents,rdate)
values(review_seq.nextval, 1, 2, 4, '잘 먹고 갑니다3', sysdate);

insert into review(reviewno, usersno,storeno, score, contents,rdate)
values(review_seq.nextval, 1, 1, 5, '잘 먹고 갑니다', sysdate);

--수정
UPDATE review
SET contents='안녕', file1='맛집.jpg', file1saved='맛집.jpg', thumb='맛집.jpg'
WHERE reviewno =7;

--삭제
delete from review
where reviewno=5;

 COMMIT;
 
   SELECT  reviewno, contents, file1, file1saved, thumb, score, rdate
    FROM review
    WHERE reviewno=3;
    
    
    
    
    
    
    
SELECT * FROM review;
    
 
     
 
