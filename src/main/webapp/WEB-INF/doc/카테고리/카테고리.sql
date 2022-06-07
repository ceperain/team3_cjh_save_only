/**********************************/
/*  관리자                          */
/**********************************/
-- 관리자 테이블 삭제
DROP TABLE admin;

-- 관리자 테이블 생성
CREATE TABLE admin(
    adminno number(10)       NOT NULL PRIMARY KEY,
    name     VARCHAR2(50)  NOT NULL,
    id          varchar2(30)     NOT NULL,
    pwd       varchar2(30)     NOT NULL
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자 번호 ';
COMMENT ON COLUMN admin.name is '관리자 이름';
COMMENT ON COLUMN admin.id is '아이디';
COMMENT ON COLUMN admin.pwd is '비밀번호';

-- 관리자 시퀀스 삭제
DROP SEQUENCE admin_seq;

-- 관리자 시퀀스 생성
CREATE SEQUENCE admin_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    CACHE 2 
    NOCYCLE;
    
    
--관리자 추가
insert into admin(adminno, name, id, pwd)
values(admin_seq.nextval, 'test_admin' ,'t_adm_01', 'adpwd001');



/**********************************/
/*  카테고리 조인                 */
/**********************************/
DROP TABLE catejoin

CREATE TABLE catejoin(
catejoinno NUMBER(10)           NOT NULL        PRIMARY KEY,
cateno      NUMBER(10)          NOT NULL,
storeno     NUMBER(10)          NOT NULL,
FOREIGN KEY (cateno) REFERENCES cate (cateno),
FOREIGN KEY (storeno) REFERENCES store (storeno)
);

COMMENT ON TABLE catejoin is '카테고리 조인';
COMMENT ON COLUMN catejoin.catejoinno is '카테고리 조인 번호';
COMMENT ON COLUMN catejoin.cateno is '카테고리 번호';
COMMENT ON COLUMN catejoin.storeno is '상품(매장) 번호';

DROP SEQUENCE catejoin_seq;

CREATE SEQUENCE catejoin_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  



INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(catejoin_seq.nextval, 1, 1);


SELECT * FROM catejoin;
  CATEJOINNO     CATENO    STORENO
---------- ---------- ----------
         1          1          1



/**********************************/
/*  카테고리                       */
/**********************************/
-- 테이블 삭제
DROP TABLE cate;


-- 테이블 생성
CREATE TABLE cate(
cateno    NUMBER(10)            NOT NULL      PRIMARY KEY,
name     VARCHAR2(50)           NOT NULL,
rdate      DATE                       NOT NULL
);


COMMENT ON TABLE cate is '카테고리';
COMMENT ON COLUMN cate.cateno is '카테고리 번호';
COMMENT ON COLUMN cate.name is '카테고리 이름';
COMMENT ON COLUMN cate.rdate is '카테고리 생성일';

-- 시퀀스 삭제
DROP SEQUENCE cate_seq;

-- 시퀀스 등록
CREATE SEQUENCE cate_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

-- 카테고리 등록  
INSERT INTO cate(cateno, name, rdate)
VALUES(cate_seq.nextval, '한식', sysdate);

INSERT INTO cate(cateno, name, rdate)
VALUES(cate_seq.nextval, '중식', sysdate);

INSERT INTO cate(cateno, name, rdate)
VALUES(cate_seq.nextval, '일식', sysdate);

INSERT INTO cate(cateno, name, rdate)
VALUES(cate_seq.nextval, '양식', sysdate);

INSERT INTO cate(cateno, name, rdate)
VALUES(cate_seq.nextval, '그 외', sysdate);

-- 테이블 확인 
SELECT * FROM cate;
    CATENO NAME                                               RDATE              
---------- -------------------------------------------------- -------------------
         1 카테고리 이름                                      2022-06-03 02:16:46
         2 카테고리 이름2                                     2022-06-03 04:11:41
         3 카테고리 이름3                                     2022-06-03 04:11:41           
  
-- 수정
update cate
set
    name='수정된 카테고리 이름'
where cateno=1;

SELECT * FROM cate;
    CATENO NAME                                               RDATE              
---------- -------------------------------------------------- -------------------
         1 수정된 카테고리 이름                               2022-06-03 02:16:46
         2 카테고리 이름2                                     2022-06-03 04:11:41
         3 카테고리 이름3                                     2022-06-03 04:11:41


-- 삭제
delete from cate
where cateno=2; 

SELECT * FROM cate;
    CATENO NAME                                               RDATE              
---------- -------------------------------------------------- -------------------
         1 수정된 카테고리 이름                               2022-06-03 02:16:46
         3 카테고리 이름3                                     2022-06-03 04:11:41  
  
-- 조회
select cateno, name, rdate
from cate
where cateno=1;
    CATENO NAME                                               RDATE              
---------- -------------------------------------------------- -------------------
         1 수정된 카테고리 이름                               2022-06-03 02:16:46  
  
  
  





  
/**********************************/
/*  리뷰                            */
/**********************************/  
DROP TABLE review

CREATE TABLE review(
reviewno        NUMERIC(10)           NOT NULL       PRIMARY KEY,
storeno          NUMERIC(10)          NOT NULL,
usersno          NUMERIC(10)          NOT NULL,
content          VARCHAR2(3000)     NOT NULL,
score             NUMERIC(10)            NOT NULL,
rdate             DATE                      NOT NULL,
FOREIGN KEY (usersno) REFERENCES users (usersno),
FOREIGN KEY (storeno) REFERENCES store (storeno)
);

COMMENT ON TABLE review is '리뷰';
COMMENT ON COLUMN review.reviewno is '리뷰 번호';
COMMENT ON COLUMN review.storeno is '매장 번호';
COMMENT ON COLUMN review.usersno is '유저 번호';
COMMENT ON COLUMN review.content is '리뷰 내용';
COMMENT ON COLUMN review.score is '별점';
COMMENT ON COLUMN review.rdate is '작성일';

-- 시퀀스 삭제
DROP SEQUENCE review_seq;

-- 시퀀스 등록
CREATE SEQUENCE review_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


INSERT INTO review(reviewno, storeno, usersno, content, score, rdate)
VALUES(review_seq.nextval, 1, 1, '맛있네요', '5', sysdate);

INSERT INTO review(reviewno, storeno, usersno, content, score, rdate)
VALUES(review_seq.nextval, 1, 1, '맛있는데...', '4', sysdate);

INSERT INTO review(reviewno, storeno, usersno, content, score, rdate)
VALUES(review_seq.nextval, 1, 1, '애매하네', '3', sysdate);

INSERT INTO review(reviewno, storeno, usersno, content, score, rdate)
VALUES(review_seq.nextval, 1, 1, '아니..', '2', sysdate);

INSERT INTO review(reviewno, storeno, usersno, content, score, rdate)
VALUES(review_seq.nextval, 1, 1, '먹지마라', '1', sysdate);


-- 테이블 데이터 전체 삭제
DELETE FROM review;


-- 입력 데이터 확인
SELECT * FROM review;



-- 수정
update review
set
    content='맛있네요에서 맛있는데...로 수정',
    score= '4'
where reviewno=6;

SELECT * FROM review;



-- 삭제
delete from review
where reviewno=7; 

SELECT * FROM review;







  