DROP TABLE keyword;
CREATE TABLE keyword(
        keywordno                           NUMBER(10)       NOT NULL        PRIMARY KEY,
        reviewno                            NUMBER(10)       NOT NULL,
        keyword                             NUMBER(2)        NOT NULL,
  FOREIGN KEY (reviewno) REFERENCES review (reviewno)
);

COMMENT ON TABLE keyword is '키워드';
COMMENT ON COLUMN keyword.keywordno is '키워드 번호';
COMMENT ON COLUMN keyword.reviewno is '리뷰 번호';
COMMENT ON COLUMN keyword.keyword is '키워드';

DROP SEQUENCE keyword_seq;
CREATE SEQUENCE keyword_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 조회
SELECT keywordno, reviewno, keyword
FROM keyword
ORDER BY reviewno;

-- 조회(Join) -> 좀더 보완 및 테스트 필요
SELECT k.keyword
FROM review r, keyword k
WHERE k.reviewno = r.reviewno
ORDER BY k.reviewno ASC;

-- 추가
INSERT INTO keyword(keywordno, reviewno, keyword)
VALUES(keyword_seq.nextval, 1, '키워드');

-- 수정
UPDATE keyword
SET keyword=''
WHERE keywordno=1;

-- 삭제(댓글 삭제시 필요한가..? DELETE 할때 CASCADE 걸어버리면 되나?)
DELETE FROM keyword
WHERE keywordno=1;