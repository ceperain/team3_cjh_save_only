INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(CATEJOIN_SEQ.nextval, 7, 1);

INSERT INTO catejoin(catejoinno, cateno, storeno)
VALUES(CATEJOIN_SEQ.nextval, 8, 1);

SELECT * FROM catejoin;
commit;


-- 적힌 리뷰중 한개를 가져오기
select reviewno, usersno , score, contents, r
from(select reviewno, usersno , score, contents, rownum r
        from review
        where review.storeno = 1 
        )
where r = 1;

--- 별점을 가장 높게 준 리뷰 가져오기
select *
from (select reviewno, usersno , score, contents
    from review
    where review.storeno = 2
    order by score desc
    )
where rownum=1;