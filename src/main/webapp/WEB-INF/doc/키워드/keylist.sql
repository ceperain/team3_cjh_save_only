/**********************************/
/* Table Name: 키워드 리스트 */
/**********************************/
drop table keylist;
CREATE TABLE keylist(
      keylistno                                NUMBER(2)       NOT NULL       PRIMARY KEY,
      keytext                             VARCHAR2(100)       NOT NULL
);

COMMENT ON TABLE keylist is '키워드 리스트';
COMMENT ON COLUMN keylist.keylistno is '키워드 리스트 번호 번호';
COMMENT ON COLUMN keylist.keytext is '키워드 문구';

DROP SEQUENCE keytxt_seq;
CREATE SEQUENCE keytxt_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

insert into keylist(keylistno, keytxt)
values(keytxt_seq.nextval, '가성비가 좋아요');

insert into keylist(keylistno, keytxt)
values(keytxt_seq.nextval, '친절해요');

insert into keylist(keylistno, keytxt)
values(keytxt_seq.nextval, '분위기가 좋아요');

insert into keylist(keylistno, keytxt)
values(keytxt_seq.nextval, '재료가 신선해요');

insert into keylist(keylistno, keytxt)
values(keytxt_seq.nextval, '매장이 청결해요');

insert into keylist(keylistno, keytxt)
values(keytxt_seq.nextval, '주차하기 좋아요');