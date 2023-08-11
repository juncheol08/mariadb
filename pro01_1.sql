
-- 회원(member) 테이블 생성
CREATE TABLE MEMBER(
	id VARCHAR(16) NOT NULL,
	pw VARCHAR(330) NOT NULL,
	NAME VARCHAR (100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	tel VARCHAR(13),
	regdate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP(),
	POINT INT DEFAULT 0,
	PRIMARY KEY (id)
);

DESC MEMBER;
--더미 데이터 추가
INSERT INTO MEMBER(id,pw,NAME,email,tel) 
VALUES ('admin','1234','관리자','admin@edu.com','010-1004-1004');
INSERT INTO MEMBER(id,pw,NAME,email,tel) 
VALUES ('kim','4321','김현경','kim@edu.com','010-7979-2848');
INSERT INTO MEMBER(id,pw,NAME,email,tel) 
VALUES ('lee','1111','이소윤','lee@edu.com','010-1111-1111');
INSERT INTO MEMBER(id,pw,NAME,email,tel) 
VALUES ('baik','2222','백준철','baik@edu.com','010-2222-2222');
INSERT INTO MEMBER(id,pw,NAME,email,tel) 
VALUES ('ku','3333','구예진','ku@edu.com','010-3333-3333');
INSERT INTO MEMBER(id,pw,NAME,email,tel) 
VALUES ('shin','4444','신승원','shin@edu.com','010-3333-3333');




SELECT * FROM MEMBER;



CREATE TABLE board (
	bno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(1000),
	author VARCHAR(16),
	resdate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP(),
	cnt INT DEFAULT 0
);

DESC board;

--게시판 더미글 생성
--작성시간 오류날 수 있으므로 범위 지정해서 한번에 실행 X
INSERT INTO board(title,content,author) VALUES ('더미글1','여기는 더미글1 입니다','admin');
INSERT INTO board(title,content,author) VALUES ('더미글2','여기는 더미글2 입니다','admin');
INSERT INTO board(title,content,author) VALUES ('더미글3','여기는 더미글3 입니다','admin');
INSERT INTO board(title,content,author) VALUES ('더미글4','여기는 더미글4 입니다','admin');
INSERT INTO board(title,content,author) VALUES ('더미글5','여기는 더미글5 입니다','admin');
INSERT INTO board(title,content,author) VALUES ('더미글6','여기는 더미글6 입니다','admin');
INSERT INTO board(title,content,author) VALUES ('더미글7','여기는 더미글7 입니다','admin');
INSERT INTO board(title,content,author) VALUES ('더미글8','여기는 더미글8 입니다','lee');

SELECT * FROM board;

COMMIT;

INSERT INTO board(title,content,author) VALUES ('더미글9','여기는 더미글9 입니다','admin');
INSERT INTO board(title,content,author) VALUES ('더미글10','여기는 더미글10 입니다','admin');
INSERT INTO board(title,content,author) VALUES ('더미글11','여기는 더미글11 입니다','admin');
----------------------------------------------------------------


--7번글에 대한 작성자의 이름
SELECT author FROM board WHERE bno=7;

--유사 검색
SELECT FROM MEMBER WHERE NAME LIKE '김%';  -- '김'으로 시작하는 이름  검색
SELECT FROM MEMBER WHERE NAME LIKE '%세%';  -- '세'가 포함된 이름 검색

--구간 검색
SELECT * FROM board WHERE bno>=3 AND bno<=6;  --글번호 3~6 검색
SELECT * FROM board WHERE bno BETWEEN 3 AND 6;  --글번호 3~6 검색
SELECT * FROM board LIMIT 2,4;  --MySQL, Maria 에서만 사용가능




--이중 쿼리(=, >=, <=, !=, ...): select 문을 이중으로 사용
SELECT id,NAME FROM MEMBER WHERE id=(SELECT author FROM board WHERE bno=7);
--일치 검색(in)
SELECT id,NAME FROM MEMBER WHERE id IN(SELECT author FROM board);
--불일치 검색(not~in~)
SELECT id,NAME FROM MEMBER WHERE id NOT IN(SELECT author FROM board);


DELETE FROM MEMBER WHERE id='shin';  -- 아이디가 shin인 레코드 삭제

UPDATE board SET author = 'lee' WHERE bno=5;  --글번호 5인 레코드의 작성자 아이디를 lee로 변경



--연관쿼리와 join
--연관쿼리
SELECT * FROM MEMBER a, board b;
SELECT a.id, a.name, a.email, b.bno, b.title from MEMBER a, board b; --
SELECT a.id AS pid, a.name AS panme, a.email AS pemail, b.bno AS pno, b.title AS ptitle FROM MEMBER a, board b;
SELECT a.id AS pid, a.name AS panme, a.email AS pemail, b.bno AS pno, b.title AS ptitle FROM MEMBER a, board b WHERE a.id=b.author;
--게시판에 글을 올린 회원정보와 글정보를 모두 표시
--내부조인
SELECT a.id, a.name, a.email, b.bno, b.title FROM MEMBER a INNER JOIN board b ON a.id=b.author;


--테이블 복제 : 키에 대한 복제는 이루어지지 않는다.
CREATE TABLE board2 AS SELECT * FROM board;
SELECT * FROM board2;
DESC board2;
ALTER TABLE board2 ADD CONSTRAINT PRIMARY KEY (bno); --기본키 설정
--제약조건은 복사가 안됨. (기본키)
ALTER TABLE board2 MODIFY bno INT  AUTO_INCREMENT; --컬럼 수정 - auto_increment 추가



--뷰 생성
CREATE VIEW writer_info AS (SELECT a.id, a.name, a.email, b.bno, b.title FROM MEMBER a INNER JOIN board b ON a.id=b.author);
SELECT * FROM writer_info;



-- 테이블 만들기 및 예시 데이터 추가

-- 테이블명 : goods 
-- 상품코드 : gcode - 정수 / 일련번호(기본키) -필수입력
-- 상품명 : gname - 문자열(150) -필수입력
-- 종류 : gcate -문자열(40) -필수입력
-- 단가 : gprice - 정수 -필수입력
-- 수량 : gqty - 정수 - 기본값 : 0
-- 등록일 : redate - 날짜 - 기본값 : 오늘날짜 및 시간

create table goods(
gcode INT NOT NULL,
gname varchar(150) NOT NULL,
gcate varchar(40) NOT NULL,
gprice int NOT NULL,
gqty int DEFAULT 0,
redate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP(),
PRIMARY KEY (gcode)
);
DESC goods;

--테이블명 : 판매(sales)
--판매코드 : scode - 정수 / 일련번호(기본키) -필수입력
--상품코드 : gcode - 정수 -필수입력
--구매자 : id - 문자열(16) -필수입력
--수량 : qty - 정수 - 기본값:1 -필수입력
--구매단가 : sprice - 정수 -필수입력
--결제수단 : stype - 정수 - 필수입력
--할인금액 : distotal - 정수
--결재금액 : paytotal - 정수
--총금액 : stotal - 정수
--판매일:saledate - 날짜 - 기본값 : 오늘날짜 및 시간 
CREATE TABLE sales (
	scode INT NOT NULL,
	gcode INT NOT NULL,
	id VARCHAR(16) NOT NULL,
	qty INT DEFAULT 0 NOT NULL,
	sprice INT NOT NULL,
	stype INT NOT NULL,
	distotal INT,
	paytotal INT,
	stotal INT,
	saledate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP(),
	PRIMARY KEY (scode)
);
DESC sales;

--더미데이터는 임의로 각자 12건 이상 추가
--상품데이터는 교육,서적,동영상강의 등의 카테고리를 본인이 정하여 추가할 것
--현재 회원과 현존하는 상품 내용을 기준으로  구매한 것으로 판매데이터를 추가할 것.

INSERT INTO goods(gcode,gname,gcate,gprice) VALUES (1,'자바교육','교육',10000);
INSERT INTO goods(gcode,gname,gcate,gprice) VALUES (2,'sql교육','교육',15000 );
INSERT INTO goods(gcode,gname,gcate,gprice) VALUES (3,'jsp교육','교육', 20000);
INSERT INTO goods(gcode,gname,gcate,gprice) VALUES (4,'html교육','교육',18000);
INSERT INTO goods(gcode,gname,gcate,gprice) VALUES (5,'자바교재','서적',30000 );
INSERT INTO goods(gcode,gname,gcate,gprice) VALUES (6,'sql교재','서적', 35000);

INSERT INTO goods(gcode,gname,gcate,gprice) VALUES (7,'html교재','서적',25000 );
INSERT INTO goods(gcode,gname,gcate,gprice) VALUES (8,'jsp교재','서적',32000 );
INSERT INTO goods(gcode,gname,gcate,gprice) VALUES (9,'java강의','동영상강의',80000 );
INSERT INTO goods(gcode,gname,gcate,gprice) VALUES (10,'sql강의','동영상강의', 85000);
INSERT INTO goods(gcode,gname,gcate,gprice) VALUES (11,'jsp강의','동영상강의',90000 );
INSERT INTO goods(gcode,gname,gcate,gprice) VALUES (12,'html강의','동영상강의',90000 );


INSERT INTO sales() VALUES ();




-- sort : 분류, 순서정렬
SELECT * FROM board ORDER BY author ASC, cnt DESC;

-- 그룹화 및 집계(group by -> count,sum,avg,max,min...)
SELECT author, COUNT(author) FROM board GROUP BY author;
