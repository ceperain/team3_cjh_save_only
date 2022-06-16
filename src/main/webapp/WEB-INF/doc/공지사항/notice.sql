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

select noticeno, title, contents, rdate
from notice
order by noticeno desc;

--검색
select noticeno, title, contents, rdate 
from notice 
where title like '%sbk%' or contents like '%jh%'
order by noticeno asc;

--페이징
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
where noticeno=1;
--삭제
delete from notice
where noticeno=3;
--레코드 갯수
select count(*)
from notice;
--FK 컬럼 기준 카운트,

--FK 컬럼 기준 삭제,






