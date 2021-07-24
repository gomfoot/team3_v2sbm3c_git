drop table mboard_reply;
drop table mboard;
drop table users;
drop table notice;
drop table favorites;
drop table mscore;
drop table answer;
drop table admin;
drop table qna;
drop table member;
drop table movie;
drop table mgenre;

drop SEQUENCE mboard_reply_seq;
drop SEQUENCE mboard_seq;
drop SEQUENCE users_seq;
drop SEQUENCE notice_seq;
drop SEQUENCE favorites_seq;
drop SEQUENCE mscore_seq;
drop SEQUENCE answer_seq;
drop SEQUENCE admin_seq;
drop SEQUENCE qna_seq;
drop SEQUENCE member_seq;
drop SEQUENCE movie_seq;
drop SEQUENCE mgenre_seq;

/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE admin(
		adminno                       		NUMBER(10)		 NOT NULL,
		id                            		VARCHAR2(20)		 NOT NULL,
		name                          		VARCHAR2(50)		 NOT NULL,
		passwd                        		VARCHAR2(100)		 NOT NULL,
		AUTHORITY                     		VARCHAR2(20)		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자 번호';
COMMENT ON COLUMN admin.id is '아이디';
COMMENT ON COLUMN admin.name is '성명';
COMMENT ON COLUMN admin.passwd is '패스워드';
COMMENT ON COLUMN admin.AUTHORITY is '권한, ROLE_ADMIN';
COMMENT ON COLUMN admin.rdate is '등록일';

CREATE SEQUENCE admin_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL,
		id                            		VARCHAR2(20)		 NOT NULL,
		passwd                        		VARCHAR2(60)		 NOT NULL,
		mname                         		VARCHAR2(30)		 NOT NULL,
		tel                           		VARCHAR2(14)		 NOT NULL,
		zipcode                       		VARCHAR2(5)		 NOT NULL,
		address1                      		VARCHAR2(80)		 NOT NULL,
		address2                      		VARCHAR2(50)		 NOT NULL,
		genre1                        		VARCHAR2(20)		 NOT NULL,
		genre2                        		VARCHAR2(20)		 NOT NULL,
		mdate                         		DATE		 NOT NULL,
		keyword                       		VARCHAR2(20)		 NOT NULL
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.memberno is '회원 번호';
COMMENT ON COLUMN member.id is '아이디';
COMMENT ON COLUMN member.passwd is '패스워드';
COMMENT ON COLUMN member.mname is '성명';
COMMENT ON COLUMN member.tel is '전화번호';
COMMENT ON COLUMN member.zipcode is '우편번호';
COMMENT ON COLUMN member.address1 is '주소1';
COMMENT ON COLUMN member.address2 is '주소2';
COMMENT ON COLUMN member.genre1 is '장르1';
COMMENT ON COLUMN member.genre2 is '장르2';
COMMENT ON COLUMN member.mdate is '가입일';
COMMENT ON COLUMN member.keyword is '인증키워드';

CREATE SEQUENCE member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지

/**********************************/
/* Table Name: 이용자 */
/**********************************/
CREATE TABLE users(
		usersno                       		NUMBER(10)		 NOT NULL,
		sdate                         		    DATE		 NOT NULL,
		edate                         		DATE		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		paytype                       		VARCHAR2(20)		 NOT NULL
);

COMMENT ON TABLE users is '이용자';
COMMENT ON COLUMN users.usersno is '이용자번호';
COMMENT ON COLUMN users.sdate is '시작날짜';
COMMENT ON COLUMN users.edate is '끝나는날짜';
COMMENT ON COLUMN users.memberno is '회원 번호';
COMMENT ON COLUMN users.paytype is '결제수단';

CREATE SEQUENCE users_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
  
/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE notice(
		noticeno                      		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(100)		 NOT NULL,
		ncontent                      		VARCHAR2(1000)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		adminno                       		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.noticeno is '공지사항 번호';
COMMENT ON COLUMN notice.title is '공지사항 제목';
COMMENT ON COLUMN notice.ncontent is '공지사항 내용';
COMMENT ON COLUMN notice.rdate is '공지사항 작성날짜';
COMMENT ON COLUMN notice.adminno is '관리자 번호';

CREATE SEQUENCE notice_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지


/**********************************/
/* Table Name: 게시판 */
/**********************************/
CREATE TABLE mboard(
		mboardno                      		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(100)		 NOT NULL,
		content                       		VARCHAR2(1000)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		cnt                           		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE mboard is '게시판';
COMMENT ON COLUMN mboard.mboardno is '커뮤니티번호';
COMMENT ON COLUMN mboard.title is '제목';
COMMENT ON COLUMN mboard.content is '내용';
COMMENT ON COLUMN mboard.rdate is '작성날짜';
COMMENT ON COLUMN mboard.cnt is '조회수';
COMMENT ON COLUMN mboard.memberno is '회원 번호';

CREATE SEQUENCE mboard_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지


/**********************************/
/* Table Name: 질문답변 */
/**********************************/
CREATE TABLE QNA(
		qnano                         		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(500)		 NOT NULL,
		content                       		VARCHAR2(500)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		qtype                          		VARCHAR2(20)		 NOT NULL ,
		memberno                      		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE QNA is '질문답변';
COMMENT ON COLUMN QNA.qnano is '질문 답변 번호';
COMMENT ON COLUMN QNA.title is '제목';
COMMENT ON COLUMN QNA.content is '내용';
COMMENT ON COLUMN QNA.rdate is '작성날짜';
COMMENT ON COLUMN QNA.qtype is '유형종류';
COMMENT ON COLUMN QNA.memberno is '회원 번호';

CREATE SEQUENCE QNA_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
  
/**********************************/
/* Table Name: 영화 장르 */
/**********************************/
CREATE TABLE mgenre(
		mgenreno                      		NUMBER(10)		 NOT NULL,
		mgenrename                    		VARCHAR2(50)		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE mgenre is '영화 장르';
COMMENT ON COLUMN mgenre.mgenreno is '영화 장르 번호';
COMMENT ON COLUMN mgenre.mgenrename is '영화 장르 이름';
COMMENT ON COLUMN mgenre.cnt is '관련 자료 수';

CREATE SEQUENCE mgenre_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지

/**********************************/
/* Table Name: 영화 상품 */
/**********************************/
CREATE TABLE movie(
		movieno                       		NUMBER(10)		 NOT NULL,
		mtitle                        		VARCHAR2(300)		 NOT NULL,
		mcontent                      		VARCHAR2(1000)		 NOT NULL,
		mtime                         		NUMBER(10)		 NOT NULL,
		director                      		VARCHAR2(100)		 NOT NULL,
		caster                        		VARCHAR2(100)		 NOT NULL,
		viewclass                     		VARCHAR2(100)		 NOT NULL,
        mdate                     		VARCHAR2(100)		 NOT NULL,
		goodscore                     		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		hatescore                     		NUMBER(7)		 DEFAULT 0      NOT NULL,
		mcnt                           		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		imgfile1                      		VARCHAR2(100)		 NULL ,
		imgthumb1                     		VARCHAR2(100)		 NULL ,
        imgsize1                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		videofile1                    		VARCHAR2(500)		 NULL ,
        videosize1                     		NUMBER(30)		 DEFAULT 0		 NOT NULL,
		mgenreno                      		NUMBER(10)		 NOT NULL 
);

COMMENT ON TABLE movie is '영화 상품';
COMMENT ON COLUMN movie.movieno is '영화 번호';
COMMENT ON COLUMN movie.mtitle is '영화 제목';
COMMENT ON COLUMN movie.mcontent is '영화 내용';
COMMENT ON COLUMN movie.mtime is '영화 길이';
COMMENT ON COLUMN movie.director is '감독';
COMMENT ON COLUMN movie.caster is '출연진';
COMMENT ON COLUMN movie.viewclass is '관람등급';
COMMENT ON COLUMN movie.goodscore is '좋아요 수';
COMMENT ON COLUMN movie.hatescore is '싫어요 수';
COMMENT ON COLUMN movie.mcnt is '조회수';
COMMENT ON COLUMN movie.mdate is '출시일';
COMMENT ON COLUMN movie.rdate is '등록일';
COMMENT ON COLUMN movie.imgfile1 is '메인 이미지';
COMMENT ON COLUMN movie.imgthumb1 is '메인 이미지 미리보기';
COMMENT ON COLUMN movie.imgsize1 is '메인 이미지 크기';
COMMENT ON COLUMN movie.videofile1 is '메인 영상';
COMMENT ON COLUMN movie.videosize1 is '메인 영상 크기';
COMMENT ON COLUMN movie.mgenreno is '영화 장르 번호';

CREATE SEQUENCE movie_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
  
/**********************************/
/* Table Name: 영화 평점 */
/**********************************/
CREATE TABLE mscore(
		mscoreno                   		NUMBER(10)		 NOT NULL,
		movieno                       		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		score_check                    		NUMBER(7)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE mscore is '영화 평점';
COMMENT ON COLUMN mscore.mscoreno is '영화 평점 번호';
COMMENT ON COLUMN mscore.movieno is '영화 번호';
COMMENT ON COLUMN mscore.memberno is '회원 번호';
COMMENT ON COLUMN mscore.score_check is '평점 체크';

CREATE SEQUENCE mscore_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지  
  
/**********************************/
/* Table Name: 찜 목록 */
/**********************************/
CREATE TABLE favorites(
		favoritesno                   		NUMBER(10)		 NOT NULL,
		movieno                       		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE favorites is '찜 목록';
COMMENT ON COLUMN favorites.favoritesno is '찜번호';
COMMENT ON COLUMN favorites.movieno is '영화 번호';
COMMENT ON COLUMN favorites.memberno is '회원 번호';

CREATE SEQUENCE favorites_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지

/**********************************/
/* Table Name: 답변 */
/**********************************/
CREATE TABLE answer(
        answerno                            NUMBER(10)		 NOT NULL,
		qnano                         		NUMBER(10)		 NOT NULL,
		content                       		VARCHAR2(300)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		adminno                       		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE answer is '답변';
COMMENT ON COLUMN answer.answerno is '답변 번호';
COMMENT ON COLUMN answer.qnano is '질문 답변 번호';
COMMENT ON COLUMN answer.content is '답변내용';
COMMENT ON COLUMN answer.rdate is '답변날짜';
COMMENT ON COLUMN answer.adminno is '관리자 번호';

CREATE SEQUENCE answer_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
  
/**********************************/
/* Table Name: 게시판댓글 */
/**********************************/
CREATE TABLE mboard_reply(
		replyno                       		NUMBER(10)		 NOT NULL,
		mboardno                      		NUMBER(10)		 NOT NULL,
		content                       		VARCHAR2(300)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		MEMBERNO                      		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE mboard_reply is '게시판댓글';
COMMENT ON COLUMN mboard_reply.replyno is '댓글번호';
COMMENT ON COLUMN mboard_reply.mboardno is '커뮤니티번호';
COMMENT ON COLUMN mboard_reply.content is '내용';
COMMENT ON COLUMN mboard_reply.rdate is '등록일';
COMMENT ON COLUMN mboard_reply.MEMBERNO is '회원 번호';

CREATE SEQUENCE mboard_reply_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지

/**********************************/
/* Table Name: 영화 평점 */
/**********************************/
CREATE TABLE mhistory(
		mhistoryno                   		NUMBER(10)		 NOT NULL,
		movieno                       		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		hcnt                    		NUMBER(7)		 DEFAULT 0		 NOT NULL,
        rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE mhistory is '시청 기록';
COMMENT ON COLUMN mhistory.mhistoryno is '시청기록 번호';
COMMENT ON COLUMN mhistory.movieno is '영화 번호';
COMMENT ON COLUMN mhistory.memberno is '회원 번호';
COMMENT ON COLUMN mhistory.hcnt is '시청 횟수';
COMMENT ON COLUMN mhistory.rdate is '등록일';

CREATE SEQUENCE mhistory_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
  
ALTER TABLE admin ADD CONSTRAINT IDX_admin_PK PRIMARY KEY (adminno);

ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (memberno);

ALTER TABLE users ADD CONSTRAINT IDX_users_PK PRIMARY KEY (usersno);
ALTER TABLE users ADD CONSTRAINT IDX_users_FK0 FOREIGN KEY (memberno) REFERENCES member (memberno);

ALTER TABLE notice ADD CONSTRAINT IDX_notice_PK PRIMARY KEY (noticeno);
ALTER TABLE notice ADD CONSTRAINT IDX_notice_FK0 FOREIGN KEY (adminno) REFERENCES admin (adminno);

ALTER TABLE mboard ADD CONSTRAINT IDX_mboard_PK PRIMARY KEY (mboardno);
ALTER TABLE mboard ADD CONSTRAINT IDX_mboard_FK0 FOREIGN KEY (memberno) REFERENCES member (memberno);

ALTER TABLE QNA ADD CONSTRAINT IDX_QNA_PK PRIMARY KEY (qnano);
ALTER TABLE QNA ADD CONSTRAINT IDX_QNA_FK0 FOREIGN KEY (memberno) REFERENCES member (memberno);

ALTER TABLE mgenre ADD CONSTRAINT IDX_mgenre_PK PRIMARY KEY (mgenreno);

ALTER TABLE movie ADD CONSTRAINT IDX_movie_PK PRIMARY KEY (movieno);
ALTER TABLE movie ADD CONSTRAINT IDX_movie_FK0 FOREIGN KEY (mgenreno) REFERENCES mgenre (mgenreno);

ALTER TABLE mscore ADD CONSTRAINT IDX_mscore_PK PRIMARY KEY (mscoreno);
ALTER TABLE mscore ADD CONSTRAINT IDX_mscore_FK0 FOREIGN KEY (movieno) REFERENCES movie (movieno);
ALTER TABLE mscore ADD CONSTRAINT IDX_mscore_FK1 FOREIGN KEY (memberno) REFERENCES member (memberno);

ALTER TABLE favorites ADD CONSTRAINT IDX_favorites_PK PRIMARY KEY (favoritesno);
ALTER TABLE favorites ADD CONSTRAINT IDX_favorites_FK0 FOREIGN KEY (movieno) REFERENCES movie (movieno);
ALTER TABLE favorites ADD CONSTRAINT IDX_favorites_FK1 FOREIGN KEY (memberno) REFERENCES member (memberno);

ALTER TABLE answer ADD CONSTRAINT IDX_answer_PK PRIMARY KEY (answerno);
ALTER TABLE answer ADD CONSTRAINT IDX_answer_FK0 FOREIGN KEY (qnano) REFERENCES QNA (qnano) ON DELETE CASCADE;
ALTER TABLE answer ADD CONSTRAINT IDX_answer_FK1 FOREIGN KEY (adminno) REFERENCES admin (adminno);

ALTER TABLE mboard_reply ADD CONSTRAINT IDX_mboard_reply_PK PRIMARY KEY (replyno);
ALTER TABLE mboard_reply ADD CONSTRAINT IDX_mboard_reply_FK0 FOREIGN KEY (mboardno) REFERENCES mboard (mboardno) ON DELETE CASCADE;
ALTER TABLE mboard_reply ADD CONSTRAINT IDX_mboard_reply_FK1 FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO);

ALTER TABLE mhistory ADD CONSTRAINT IDX_mhistory_PK PRIMARY KEY (mhistoryno);
ALTER TABLE mhistory ADD CONSTRAINT IDX_mhistory_FK0 FOREIGN KEY (movieno) REFERENCES movie (movieno);
ALTER TABLE mhistory ADD CONSTRAINT IDX_mhistory_FK1 FOREIGN KEY (memberno) REFERENCES member (memberno);                                   
