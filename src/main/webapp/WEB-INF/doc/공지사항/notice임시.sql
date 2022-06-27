/**********************************/
/* Table Name: 공지사항 */
/**********************************/
drop table notice;
CREATE TABLE notice(
    noticeno number(10) NOT NULL PRIMARY KEY,
    adminno number(10) not null,
    title VARCHAR2(50) NOT NULL,
    contents varchar2(1000) NOT NULL,
    rdate date NOT NULL,
    FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.adminno is '공지 번호 ';
COMMENT ON COLUMN notice.adminno is '관리자 번호 ';
COMMENT ON COLUMN notice.title is '제목';
COMMENT ON COLUMN notice.contents is '내용';
COMMENT ON COLUMN notice.rdate is '작성일';

DROP SEQUENCE notice_seq;
CREATE SEQUENCE notice_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    CACHE 2 
    NOCYCLE;
    
--공지 등록
insert into notice(noticeno, adminno, title, contents, rdate)
values(notice_seq.nextval, 1 , '첫 번째 공지사항' ,'첫 번째 공지사항 테스트 team3', sysdate);

insert into notice(noticeno, adminno, title, contents, rdate)
values(notice_seq.nextval, 1 , '두 번째 공지사항' ,'두 번째 공지사항 테스트 jh', sysdate);

insert into notice(noticeno, adminno, title, contents, rdate)
values(notice_seq.nextval, 1 , '세 번째 공지사항' ,'세 번째 공지사항 테스트 jh', sysdate);

insert into notice(noticeno, adminno, title, contents, rdate)
values(notice_seq.nextval, 1 , '네 번째 공지사항' ,'네 번째 공지사항 테스트 jh', sysdate);

insert into notice(noticeno, adminno, title, contents, rdate)
values(notice_seq.nextval, 1 , '6 번째 공지사항' ,'6 번째 공지사항 테스트 jh', sysdate);

INSERT INTO  notice(noticeno, adminno, title, contents, rdate)
VALUES (notice_seq.nextval, 1, '다섯번째 공지사항' , '다섯번재 공지사항 테스트 jh' , sysdate);

select noticeno, title, contents, rdate
from notice
order by noticeno desc;


-- 6/16 간단한 검색,기능 시작
--검색 title, contents
SELECT noticeno, title, contents, rdate 
FROM notice
WHERE (UPPER(title) LIKE UPPER('%하히%') OR UPPER(contents) LIKE UPPER('%그냥%'))
ORDER BY noticeno ASC;


--6/16 위에까지 해서 간단한 검색기능 만듦  (성공)


-- ② 검색 레코드 갯수
-- 전체 레코드 갯수
SELECT COUNT(*)
FROM notice
WHERE noticeno=41;

SELECT COUNT(*) as cnt -- 함수 사용시는 컬럼 별명을 선언하는 것을 권장 **여기서 cnt는 별명임
FROM notice
WHERE noticeno=41;

-- cateno 별 검색된 레코드 갯수
SELECT COUNT(*) as cnt
FROM notice
WHERE noticeno=41 AND title LIKE '%하%';

SELECT COUNT(*) as cnt
FROM notice
WHERE noticeno=41 AND (title LIKE '%하히%' OR contents LIKE '%내용%');

-- SUBSTR(컬럼명, 시작 index(1부터 시작), 길이)
SELECT noticeno, SUBSTR(title, 1, 8)
FROM notice
WHERE noticeno=41 AND (contents LIKE '%내용%');

-- 대소문자를 구분하여 검색
SELECT noticeno, title, contents
FROM notice
WHERE noticeno=41 AND (title LIKE LOWER('%abc%'));     -- 글의 제목이 하히후헤호abc라서 소문자 검색 됨

SELECT noticeno, title, contents
FROM notice
WHERE noticeno=41 AND (title LIKE UPPER('%ABC%') or title like LOWER('%ABC%')); -- 글의 제목이 하히후헤호abc라서 대문자 검색 안됨

SELECT noticeno, title, contents
FROM notice
WHERE noticeno=41 AND (UPPER(title) LIKE '%abc%'); -- 대소문자를 일치 시켜서 검색 **글의 제목이 "하히후헤호ABC"이건 "하히후헤호abc"이건 전부 검색됨

-- 이상 검색 sql 종료








-- 6/17 step2 시작


-- 검색 + 페이징 + 메인페이지
-- step 1   -- 검색 sql       위와 같음?  ㄴㄴ WHERE에 noticeno 붙음
SELECT noticeno, title, contents, rdate
FROM notice
WHERE noticeno=41 AND (title LIKE '%하%' OR contents LIKE '%후헤%')
ORDER BY noticeno DESC;

-- STEP 2
SELECT noticeno, title, contents, rdate, rownum as r
FROM (
          SELECT noticeno, title, contents, rdate
          FROM notice
          WHERE noticeno=41 AND (title LIKE '%하%' OR contents LIKE '%대충 아무것도 안맞는 asdfasdfasdf%')
          ORDER BY noticeno DESC
);

-- STEP 3, PAGE 1   -- 페이징 1페이지당 3개 
SELECT noticeno, title, contents, rdate, rownum, r
FROM (
           SELECT noticeno, title, contents, rdate, rownum as r
           FROM (
                     SELECT noticeno, title, contents, rdate
                     FROM notice
                     WHERE noticeno=41 AND (title LIKE '%하히%' OR contents LIKE '%공지%')
                     ORDER BY noticeno DESC
           )          
)
WHERE r >= 1 AND r <= 3;

-- STEP 3, PAGE 2
SELECT noticeno, title, contents, rdate, rownum, r
FROM (
           SELECT noticeno, title, contents, rdate, rownum as r
           FROM (
                     SELECT noticeno, title, contents, rdate
                     FROM notice
                     WHERE noticeno=41 AND (title LIKE '%하히%' OR contents LIKE '%공지%')
                     ORDER BY noticeno DESC
           )          
)
WHERE r >= 4 AND r <= 6;

 SELECT noticeno, title, contents, rdate, r
   FROM (
              SELECT noticeno, title, contents, rdate, rownum as r
              FROM (
                        SELECT noticeno, title, contents, rdate
                        FROM notice
                        WHERE noticeno=41 AND (UPPER(title) LIKE '%하히%'   OR UPPER(contents) LIKE '하히' )
                        ORDER BY noticeno DESC
               )
    )
    WHERE  r >= 4 AND r <=6;

-- 검색 수 세기
    SELECT COUNT(*) as cnt
    FROM notice
        WHERE noticeno=41 AND (UPPER(title) LIKE '%하히%' OR UPPER(contents) LIKE '%제목만%');
                                   


-- 이하 재환이에게 받은 sql
-- 페이징
select noticeno, title, contents, rdate
from (
    select noticeno, title, contents, rdate, rownum as r
    from (
        select noticeno, title, contents, rdate
        from notice
        order by noticeno asc
        )
    )
where r >=1 and r <=3;

-- 검색 + 페이징
select noticeno, title, contents, rdate
from (
    select noticeno, title, contents, rdate, rownum as r
    from (
        select noticeno, title, contents, rdate
        from notice
        where title like '%sbk%' or contents like '%jh%'
        order by noticeno asc
        )
    )
where r >=1 and r <=3;



--조회
select noticeno, title, contents, rdate
from notice
where noticeno=1;
--수정
update notice
set
    title='수정된 공지사항',
    contents='수정된 내용'
where noticeno=4;
--삭제
delete from notice
where noticeno=3;
--레코드 갯수
select count(*)
from notice;
--FK 컬럼 기준 카운트,

--FK 컬럼 기준 삭제,


    SELECT noticeno, adminno, title, contents, rdate
    FROM notice
    ORDER BY noticeno desc



