/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE users;
CREATE TABLE users(
		userno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		email                         		VARCHAR2(100)		 NOT NULL,
		pwd                           		VARCHAR2(60)		 NOT NULL,
		sex                           		VARCHAR2(10)		 NOT NULL,
		bdate                         		DATE		 NOT NULL,
		phone                         		VARCHAR2(20)		 NOT NULL,
		rdate                         		DATE		 NULL 
);

DROP SEQUENCE users_seq;
CREATE SEQUENCE users_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

CREATE TRIGGER user_userno_TRG
BEFORE INSERT ON user
FOR EACH ROW
BEGIN
IF :NEW.userno IS NOT NULL THEN
  SELECT user_userno_SEQ.NEXTVAL INTO :NEW.userno FROM DUAL;
END IF;
END;

COMMENT ON TABLE user is '회원';
COMMENT ON COLUMN user.userno is '회원 번호';
COMMENT ON COLUMN user.email is '이메일';
COMMENT ON COLUMN user.pwd is '비밀번호';
COMMENT ON COLUMN user.sex is '성별';
COMMENT ON COLUMN user.bdate is '생년월일';
COMMENT ON COLUMN user.phone is '폰번호';
COMMENT ON COLUMN user.rdate is '가입일';


/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE admin(
		adminno                       		NUMBER(10)		 NULL 		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		id                            		VARCHAR2(30)		 NOT NULL,
		pwd                           		VARCHAR2(30)		 NOT NULL
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자 번호';
COMMENT ON COLUMN admin.name is '관리자 이름';
COMMENT ON COLUMN admin.id is '아이디';
COMMENT ON COLUMN admin.pwd is '비밀번호';


/**********************************/
/* Table Name: 매장(상품) */
/**********************************/
CREATE TABLE store(
		storeno                       		NUMBER(10)		 NULL 		 PRIMARY KEY,
		name                          		VARCHAR2(150)		 NOT NULL,
		adress                        		VARCHAR2(300)		 NULL ,
		visible                       		NUMBER(1)		 DEFAULT 1		 NOT NULL,
		lat                           		NUMBER(10)		 NULL ,
		lng                           		NUMBER(10)		 NULL ,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE store is '매장(상품)';
COMMENT ON COLUMN store.storeno is '상품(매장) 번호';
COMMENT ON COLUMN store.name is '상품(매장)명';
COMMENT ON COLUMN store.adress is '주소';
COMMENT ON COLUMN store.visible is '영업여부';
COMMENT ON COLUMN store.lat is '위도';
COMMENT ON COLUMN store.lng is '경도';
COMMENT ON COLUMN store.rdate is '등록일';


/**********************************/
/* Table Name: 리뷰 */
/**********************************/
CREATE TABLE review(
		reviewno                      		NUMBER(10)		 NULL 		 PRIMARY KEY,
		userno                        		NUMBER(10)		 NOT NULL,
		storeno                       		NUMBER(10)		 NOT NULL,
		score                         		NUMBER(5)		 NOT NULL,
		contents                      		VARCHAR2(3000)		 NOT NULL,
		file1                         		VARCHAR2(200)		 NULL ,
		file1saved                    		VARCHAR2(200)		 NULL ,
		thumb                         		VARCHAR2(200)		 NULL ,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (userno) REFERENCES users (userno),
  FOREIGN KEY (storeno) REFERENCES store (storeno)
);

COMMENT ON TABLE review is '리뷰';
COMMENT ON COLUMN review.reviewno is '리뷰 번호';
COMMENT ON COLUMN review.userno is '회원 번호';
COMMENT ON COLUMN review.storeno is '상품 번호';
COMMENT ON COLUMN review.score is '별점';
COMMENT ON COLUMN review.contents is '리뷰내용';
COMMENT ON COLUMN review.file1 is '사진-업로드 이름';
COMMENT ON COLUMN review.file1saved is '사진-서버 저장 이름';
COMMENT ON COLUMN review.thumb is '썸네일';
COMMENT ON COLUMN review.rdate is '작성일';


/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE notice(
		noticeno                      		NUMBER(10)		 NULL 		 PRIMARY KEY,
		adminno                       		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(50)		 NULL ,
		contents                      		VARCHAR2(1000)		 NULL ,
		rdate                         		DATE		 NULL ,
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.noticeno is '공지 번호';
COMMENT ON COLUMN notice.adminno is '관리자 번호';
COMMENT ON COLUMN notice.title is '제목';
COMMENT ON COLUMN notice.contents is '내용';
COMMENT ON COLUMN notice.rdate is '작성일';


/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE cate(
		cateno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		date                          		DATE		 NOT NULL
);

COMMENT ON TABLE cate is '카테고리';
COMMENT ON COLUMN cate.cateno is '카테고리 번호';
COMMENT ON COLUMN cate.name is '카테고리 이름';
COMMENT ON COLUMN cate.date is '카테고리 생성일';


/**********************************/
/* Table Name: 카테고리 조인 */
/**********************************/
CREATE TABLE catejoin(
		catejoinno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cateno                        		NUMBER(10)		 NOT NULL,
		storeno                       		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (cateno) REFERENCES cate (cateno),
  FOREIGN KEY (storeno) REFERENCES store (storeno)
);

COMMENT ON TABLE catejoin is '카테고리 조인';
COMMENT ON COLUMN catejoin.catejoinno is '카테고리 조인 번호';
COMMENT ON COLUMN catejoin.cateno is '카테고리 번호';
COMMENT ON COLUMN catejoin.storeno is '상품(매장) 번호';


/**********************************/
/* Table Name: 키워드 */
/**********************************/
DROP TABLE keyword;
CREATE TABLE keyword(
		keywordno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		reviewno                      		NUMBER(10)		 NOT NULL,
		keyword                       		NUMBER(2)		 NOT NULL,
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

/**********************************/
/* Table Name: 즐겨찾기 */
/**********************************/
CREATE TABLE favorite(
		favno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		userno                        		NUMBER(10)		 NOT NULL,
		storeno                       		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (storeno) REFERENCES store (storeno),
  FOREIGN KEY (userno) REFERENCES user (userno)
);

COMMENT ON TABLE favorite is '즐겨찾기';
COMMENT ON COLUMN favorite.favno is '즐겨찾기 번호';
COMMENT ON COLUMN favorite.userno is '회원 번호';
COMMENT ON COLUMN favorite.storeno is '상품(매장) 번호';


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


/**********************************/
/* Table Name: 영업시간 */
/**********************************/
CREATE TABLE working(
		workno                        		NUMBER(24)		 NOT NULL		 PRIMARY KEY,
		storeno                       		NUMBER(10)		 NOT NULL,
		day                           		VARCHAR2(15)		 NOT NULL,
		starttime                     		VARCHAR2(40)		 NULL ,
		endtime                       		VARCHAR2(40)		 NULL ,
  FOREIGN KEY (storeno) REFERENCES store (storeno)
);

COMMENT ON TABLE working is '영업시간';
COMMENT ON COLUMN working.workno is '영업시간 번호';
COMMENT ON COLUMN working.storeno is '상품(매장) 번호';
COMMENT ON COLUMN working.day is '요일';
COMMENT ON COLUMN working.starttime is '영업 시작 시간';
COMMENT ON COLUMN working.endtime is '영업 종료 시간';


/**********************************/
/* Table Name: 메뉴 */
/**********************************/
CREATE TABLE menu(
		menuno                        		NUMBER(30)		 NOT NULL		 PRIMARY KEY,
		storeno                       		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(300)		 NOT NULL,
		price                         		NUMBER(8)		 NULL ,
  FOREIGN KEY (storeno) REFERENCES store (storeno)
);

COMMENT ON TABLE menu is '메뉴';
COMMENT ON COLUMN menu.menuno is '메뉴 번호';
COMMENT ON COLUMN menu.storeno is '매장 번호';
COMMENT ON COLUMN menu.name is '메뉴 이름';
COMMENT ON COLUMN menu.price is '메뉴 가격';


