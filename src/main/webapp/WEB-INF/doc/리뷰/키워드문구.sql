/**********************************/
/* Table Name: 키워드 매칭 문구 */
/**********************************/
CREATE TABLE keytxt(
		ktno                          		NUMBER(3)		 NOT NULL		 PRIMARY KEY,
		keywordno                     		NUMBER(10)		 NOT NULL,
		keytext                       		VARCHAR2(100)		 NOT NULL,
  FOREIGN KEY (keywordno) REFERENCES keyword (keywordno)
);

COMMENT ON TABLE keytxt is '키워드 매칭 문구';
COMMENT ON COLUMN keytxt.ktno is '키워드 텍스트 번호';
COMMENT ON COLUMN keytxt.keywordno is '키워드 번호';
COMMENT ON COLUMN keytxt.keytext is '키워드 문구';

DROP SEQUENCE keytxt_seq;
CREATE SEQUENCE keytxt_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 조회
SELECT ktno, keywordno, keytext
FROM keytxt
ORDER BY keywordno;

-- 조회2
SELECT ktno, keywordno, keytext
FROM keytxt
ORDER BY ktno;

-- 조회(Join) -> 좀더 보완 및 테스트 필요
SELECT k.keyword
FROM review r, keyword k
WHERE k.reviewno = r.reviewno
ORDER BY k.reviewno ASC;

-- 추가
INSERT INTO keytxt(ktno, keywordno, keytext)
VALUES(keytxt_seq.nextval, 1, '가성비가 좋아요');

-- 추가
INSERT INTO keytxt(ktno, keywordno, keytext)
VALUES(keytxt_seq.nextval, 1, '친절해요');

-- 추가
INSERT INTO keytxt(ktno, keywordno, keytext)
VALUES(keytxt_seq.nextval, 1, '분위기가 좋아요');

-- 추가
INSERT INTO keytxt(ktno, keywordno, keytext)
VALUES(keytxt_seq.nextval, 1, '재료가 신선해요');

-- 추가
INSERT INTO keytxt(ktno, keywordno, keytext)
VALUES(keytxt_seq.nextval, 1, '매장이 청결해요');

-- 추가
INSERT INTO keytxt(ktno, keywordno, keytext)
VALUES(keytxt_seq.nextval, 1, '주차하기 좋아요');

-- 수정
UPDATE keytxt
SET keytext='가성비가 좋아요'
WHERE ktno=1;

-- 삭제(댓글 삭제시 필요한가..? DELETE 할때 CASCADE 걸어버리면 되나?)
DELETE FROM keytxt
WHERE ktno=1;