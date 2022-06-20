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
values(admin_seq.nextval, 'aa' ,'admin1', '1234');



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
VALUES(catejoin_seq.nextval, 7, 2);

INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(catejoin_seq.nextval, 7, 3);

INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(catejoin_seq.nextval, 8, 3);

SELECT * FROM catejoin;
CATEJOINNO     CATENO    STORENO
---------- ---------- ----------
         1          7          2
         2          7          3
         3          8          3



/**********************************/
/*  카테고리                       */
/**********************************/
-- 테이블 삭제
DROP TABLE cate;


-- 테이블 생성
CREATE TABLE cate(
cateno    NUMBER(10)            NOT NULL      PRIMARY KEY,
name     VARCHAR2(50)           NOT NULL   UNIQUE,
image     VARCHAR2(300),
rdate      DATE                       NOT NULL
);


COMMENT ON TABLE cate is '카테고리';
COMMENT ON COLUMN cate.cateno is '카테고리 번호';
COMMENT ON COLUMN cate.name is '카테고리 이름';
COMMENT ON COLUMN cate.image is '카테고리 이미지';
COMMENT ON COLUMN cate.rdate is '카테고리 생성일'

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
insert into cate(cateno, name, image, rdate)
values(cate_seq.nextval, '한식', 'http://www.fsnews.co.kr/news/photo/201902/32707_27510_4314.jpg',sysdate);
  
insert into cate(cateno, name, image, rdate)
values(cate_seq.nextval, '중식', 'https://cdn.vox-cdn.com/uploads/chorus_image/image/66683596/Atlas_Kitchen_30.0.jpg',sysdate);

insert into cate(cateno, name, image, rdate)
values(cate_seq.nextval, '일식', 'https://feelfukuoka.com/wp/wp-content/uploads/2020/07/746869_m-768x510.jpg',sysdate);

insert into cate(cateno, name, image, rdate)
values(cate_seq.nextval, '양식', 'https://ldb-phinf.pstatic.net/20200529_288/1590729021609YuodC_JPEG/wG8x9yxYvJcqemQKTcpAi005.jpg?type=f804_408_60_sharpen',sysdate);

insert into cate(cateno, name, image, rdate)
values(cate_seq.nextval, '그외', 'http://www.fsnews.co.kr/news/photo/201902/32707_27510_4314.jpg',sysdate);

select * from cate;

----------------------------------------------------------------------

INSERT INTO store(storeno, name, address, visible, lat, lng, rdate)
values(STORE_SEQ.nextval, '강원도집', '서울특별시 종로구 낙원동 289-2', 1, 37.572216462641, 126.98797517551, sysdate);

INSERT INTO store(storeno, name, address, visible, lat, lng, rdate)
values(STORE_SEQ.nextval, '짱개집', '서울특별시 종로구 낙원동 212-2', 2, 40.572216462641, 130.98797517551, sysdate);

INSERT INTO store(storeno, name, address, visible, lat, lng, rdate)
values(STORE_SEQ.nextval, '복덕방', '서울특별시 종로구 낙원동 289-2', 1, 37.572216462641, 126.98797517551, sysdate);

INSERT INTO store(storeno, name, address, visible, lat, lng, rdate)
values(STORE_SEQ.nextval, 'ABC 1992', '서울특별시 종로구 낙원동 289-2', 1, 37.572216462641, 126.98797517551, sysdate);

INSERT INTO store(storeno, name, address, visible, lat, lng, rdate)
values(STORE_SEQ.nextval, '아버지 손두부', '서울특별시 종로구 낙원동 289-2', 1, 37.572216462641, 126.98797517551, sysdate);

INSERT INTO store(storeno, name, address, visible, lat, lng, rdate)
values(STORE_SEQ.nextval, '강원도집2', '서울특별시 종로구 낙원동 289-2', 1, 37.572216462641, 126.98797517551, sysdate);

INSERT INTO store(storeno, name, address, visible, lat, lng, rdate)
values(STORE_SEQ.nextval, '짱개집3', '서울특별시 종로구 낙원동 212-2', 2, 40.572216462641, 130.98797517551, sysdate);

INSERT INTO store(storeno, name, address, visible, lat, lng, rdate)
values(STORE_SEQ.nextval, '복덕방4', '서울특별시 종로구 낙원동 289-2', 1, 37.572216462641, 126.98797517551, sysdate);

INSERT INTO store(storeno, name, address, visible, lat, lng, rdate)
values(STORE_SEQ.nextval, '산울림5 1992', '서울특별시 종로구 낙원동 289-2', 1, 37.572216462641, 126.98797517551, sysdate);

INSERT INTO store(storeno, name, address, visible, lat, lng, rdate)
values(STORE_SEQ.nextval, '아버지 손두부6', '서울특별시 종로구 낙원동 289-2', 1, 37.572216462641, 126.98797517551, sysdate);

INSERT INTO store(storeno, name, address, visible, lat, lng, rdate)
values(STORE_SEQ.nextval, 'abc', '서울특별시 종로구 낙원동 289-2', 1, 37.572216462641, 126.98797517551, sysdate);

INSERT INTO store(storeno, name, address, visible, lat, lng, rdate)
values(STORE_SEQ.nextval, 'ABC', '서울특별시 종로구 낙원동 289-2', 1, 37.572216462641, 126.98797517551, sysdate);

select * from store;

----------------------------------------------------------------------

INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(CATEJOIN_SEQ.nextval, 7, 4);

INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(CATEJOIN_SEQ.nextval, 7, 5);

INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(CATEJOIN_SEQ.nextval, 7, 6);

INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(CATEJOIN_SEQ.nextval, 7, 7);

INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(CATEJOIN_SEQ.nextval, 7, 8);

INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(CATEJOIN_SEQ.nextval, 7, 9);

INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(CATEJOIN_SEQ.nextval, 7, 10);

INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(CATEJOIN_SEQ.nextval, 7, 11);

SELECT * FROM catejoin;


--카테고리 클릭시 카테고리별 매장 - 전체
select s.name as 매장명, s.address as 매장주소 
from store s, cate c, catejoin j
where s.storeno = j.storeno and j.cateno = c.cateno and c.cateno=7;

commit;

select count(*)
from store s, cate c, catejoin j
where s.storeno = j.storeno and j.cateno = c.cateno and c.cateno=7;


----------------------------------------------------------------------

INSERT INTO store(storeno, name, address, visible, lat, lng, rdate)
values(STORE_SEQ.nextval, '서호장', '서울특별시 종로구 관수동 15', 1, 37.569312055105, 126.98964219128, sysdate);

select * from store;

----------------------------------------------------------------------

INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(CATEJOIN_SEQ.nextval, 1, 3);  -- 그래서 cateno 1: 한식 끼워넣음

INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(CATEJOIN_SEQ.nextval, 2, 3);  -- cateno 2: 중식, cateno 1: 한식

SELECT * FROM catejoin;
commit;

----------------------------------------------------------------------


----------------------------------------------------------------------

select s.name as 매장명, s.address as 매장주소 
from store s, cate c, catejoin j
where s.storeno = j.storeno and j.cateno = c.cateno and c.cateno=1;

----------------------------------------------------------------------

select s.name as 매장명, s.address as 매장주소 
from store s, cate c, catejoin j
where s.storeno = j.storeno and j.cateno = c.cateno and c.cateno=2;

----------------------------------------------------------------------
 SELECT c.cateno, s.name, s.address, s.storeno
    FROM cate c, store s, catejoin j
   
   
    WHERE (c.cateno = j.cateno and j.storeno = s.storeno) 
                AND(UPPER(s.name) LIKE UPPER('%' || '강원' || '%')  
                OR UPPER(s.address) LIKE UPPER('%' || '강원' || '%' ))


    ORDER BY c.cateno DESC










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
where cateno=1; 

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
  
  
--카테고리 리스트
select cateno,name
from cate
order by cateno asc;

--카테고리 클릭시 카테고리별 매장 - 전체
select s.name as 매장명, s.address as 매장주소 
from store s, cate c, catejoin j
where s.storeno = j.storeno and j.cateno = c.cateno and c.cateno = 1;

-- 카테고리 검색 시작
-- 1) 검색
-- ① cateno별 검색 목록
-- word 컬럼의 존재 이유: 검색 정확도를 높이기 위하여 중요 단어를 명시
-- 글에 'swiss'라는 단어만 등장하면 한글로 '스위스'는 검색 안됨.
-- 이런 문제를 방지하기위해 'swiss,스위스,스의스,수의스,유럽' 검색어가 들어간 word 컬럼을 추가함.

-- 원본
--SELECT name, address, storeno
--FROM store
--WHERE UPPER(name) (title LIKE '%강원도%' OR address LIKE '%종로%')
--ORDER BY cateno DESC;

-- ANSI join
--SELECT c.cateno, s.name, s.address, s.storeno
--FROM cate c
--JOIN store s USING (storeno)
--WHERE cateno=7 AND (name LIKE '%강원도%' OR address LIKE '%종로%')
--ORDER BY c.cateno DESC;

-- join n개 이상 sql작성
SELECT c.cateno, s.name, s.address, s.storeno
FROM cate c, store s, catejoin j
WHERE (c.cateno = j.cateno and j.storeno = s.storeno) and ( c.cateno=7 AND (s.name LIKE '%강원도%' OR s.address LIKE '%d%') )
ORDER BY c.cateno DESC;


-- ② 검색 레코드 갯수
-- 전체 레코드 갯수
SELECT COUNT(*)
FROM catejoin j
WHERE j.cateno=7;

SELECT COUNT(*) as cnt -- 함수 사용시는 컬럼 별명을 선언하는 것을 권장
FROM catejoin j
WHERE j.cateno=7;

-- cateno 별 검색된 레코드 갯수
SELECT COUNT(*) as cnt
FROM catejoin j, store s
WHERE (j.storeno = s.storeno) AND (j.cateno=7 AND s.name LIKE '%아버지 손두부%');

SELECT COUNT(*) as cnt
FROM catejoin j, store s
WHERE (j.storeno = s.storeno) AND (j.cateno=7 AND (s.name LIKE '%강원도집%' OR s.address LIKE '%종로%'));

-- SUBSTR(컬럼명, 시작 index(1부터 시작), 길이)
SELECT j.cateno, SUBSTR(s.name, 1, 20)
FROM catejoin j, store s
WHERE (j.storeno = s.storeno) AND (j.cateno=7 AND (s.name LIKE '%아버지%'));

-- 대소문자를 구분하여 검색
SELECT j.cateno, s.name, s.address
FROM catejoin j, store s
WHERE (j.storeno = s.storeno) AND (cateno=7 AND (s.name LIKE '%abc%'));

SELECT  j.cateno, s.name, s.address
FROM catejoin j, store s
WHERE (j.storeno = s.storeno) AND (cateno=7 AND (s.name LIKE '%ABC%')); -- 대소문자 구분으로 검색 안됨.

SELECT j.cateno, s.name, s.address
FROM catejoin j, store s
WHERE (j.storeno = s.storeno) AND (cateno=7 AND (UPPER(s.name) LIKE '%ABC%')); -- 대소문자를 일치 시켜서 검색

                                   


SELECT c.cateno, s.name, s.address, s.storeno
FROM cate c, store s, catejoin j
WHERE (c.cateno = j.cateno and j.storeno = s.storeno) and ( c.cateno=7 AND (s.name LIKE '%강원도%' OR s.address LIKE '%d%') )
ORDER BY c.cateno DESC;




------------------페이징 시작
--카테고리 클릭시 카테고리별 매장 - 페이징 (5개)
select storeno, name, address, cateno
from (select storeno, name, address, cateno, rownum as r
    from (select s.storeno, s.name, s.address, c.cateno
        from store s, cate c, catejoin j
        where (s.storeno = j.storeno
            and j.cateno = c.cateno)
            and c.cateno = 7
        )
        ORDER BY cateno DESC
    )
where r >=1 and r <=5;

--카테고리 클릭시 카테고리별 매장 - 페이징 (5개)
select storeno, name, address, cateno
from (select storeno, name, address, cateno, rownum as r
    from (select s.storeno, s.name, s.address, c.cateno
        from store s, cate c, catejoin j
        where (s.storeno = j.storeno
            and j.cateno = c.cateno)
            and c.cateno = 7
        )
    )
where r >=6 and r <=10;

--검색시 매장 - 페이징 (5개)
select storeno, name, address, cateno
from (select storeno, name, address, cateno, rownum as r
    from (select s.storeno, s.name, s.address, c.cateno
        from store s, cate c, catejoin j
        where (s.storeno = j.storeno
            and j.cateno = c.cateno)
            and (s.name like '%강원도%'
                or s.address like '%강원도%')
        )
    )
where r >=1 and r <=5;
      
  
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



---------------------민정씨꺼 상품

drop table store;
CREATE TABLE store(
    storeno    number(10) NOT NULL PRIMARY KEY,
    name       VARCHAR2(150) NOT NULL,
    address    VARCHAR2(300) NOT NULL,
    visible     number(1) default 1 NOT NULL,
    lat          number ,
    lng         number ,
    rdate      date NOT NULL
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

    
    
select s.name as 매장명, s.address as 매장주소, s.storeno as 가게번호
from store s, cate c, catejoin j
where s.storeno = j.storeno and j.cateno = c.cateno and c.cateno = 8;    
    




  