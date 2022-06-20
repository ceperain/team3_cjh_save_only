SELECT *--r.usersno, r.storeno, r.score / 5 as divided_score --,  as 가성비,  as 친절,  as 분위기,  as 신선,  as 매장,  as 주차
    FROM keylist l, keyword w, review r, users u
    WHERE r.usersno = u.usersno AND l.keylistno = w.keylistno;

select count(case when keylistno='1' then 1 end) as 가성비,count(case when keylistno='2' then 1 end) as 친절,count(case when keylistno='3' then 1 end) as 분위기, storeno, r.usersno, r.score
from keyword k , review r, users u
group by r.usersno ,storeno,r.score;

select max(case when keylistno='1' then 1 end) as 가성비,max(case when keylistno='2' then 1 end) as 친절,max(case when keylistno='3' then 1 end) as 분위기, storeno, r.usersno, r.score
from keyword k , review r, users u
group by r.usersno ,storeno,r.score;

select max(case when keylistno='1' then 1 end) as 가성비,max(case when keylistno='2' then 1 end) as 친절,max(case when keylistno='3' then 1 end) as 분위기, storeno, r.usersno, r.score
from keyword k , review r, users u
group by r.usersno ,storeno,r.score, r.reviewno;


select count(case when keylistno='1' then 1 end) as 가성비,count(case when keylistno='2' then 1 end) as 친절,count(case when keylistno='3' then 1 end) as 분위기, storeno, r.usersno,r.reviewno
from keyword k , review r, users u
group by r.usersno ,storeno,score,r.reviewno;