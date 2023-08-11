-- 0808

-- DROP TABLE if EXISTS qna;

CREATE TABLE qna(
	qno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(1000),
	author VARCHAR(16),
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	cnt INT DEFAULT 0,
	lev INT DEFAULT 0,
	par INT,
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE
	);
	
DESC qna;
	
-- lev  0 : 질문 / 1 : 답변
--	부모 글번호 -> 질문(자신 레코드의 qno), 답변(질문의 글번호)

SELECT * FROM member;

SELECT * FROM qna;

INSERT INTO qna (title,content,author,lev) VALUES ('질문1','질문글 1 입니다','lee', 0);
UPDATE qna SET par=qno WHERE qno=1;
INSERT INTO qna (title,content,author,lev) VALUES ('질문2','질문글 2 입니다','kim', 0);
UPDATE qna SET par=qno WHERE qno=2;
INSERT INTO qna (title,content,author,lev) VALUES ('답변1','질문1에 대한 답변','kim',1 );
UPDATE qna SET par=1 WHERE qno=3;
INSERT INTO qna (title,content,author,lev) VALUES ('답변2','질문2에 대한 답변','baik',1 );
UPDATE qna SET par=2 WHERE qno=4;

INSERT INTO qna(title,content,author,lev) VALUES ('질문3','질문글 3 입니다','kim', 0);
UPDATE qna SET par=qno WHERE qno=5;
INSERT INTO qna (title,content,author,lev) VALUES ('답변3','질문3에 대한 답변','ku',1 );
UPDATE qna SET par=5 WHERE qno=6;
INSERT INTO qna(title,content,author,lev) VALUES ('질문4','질문글 4 입니다','baik', 0);
UPDATE qna SET par=qno WHERE qno=7;
INSERT INTO qna(title,content,author,lev) VALUES ('질문5','질문글 5 입니다','ku', 0);
UPDATE qna SET par=qno WHERE qno=8;
INSERT INTO qna (title,content,author,lev) VALUES ('답변4','질문4에 대한 답변','lee',1 );
UPDATE qna SET par=7 WHERE qno=9;
INSERT INTO qna (title,content,author,lev) VALUES ('답변5','질문5에 대한 답변','kim',1 );
UPDATE qna SET par=8 WHERE qno=10;


UPDATE qna SET par=8 WHERE qno=10;

SELECT * FROM qna ORDER BY par DESC, qno ASC;

SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev, a.par AS par, b.name AS name 
FROM qna a, member b WHERE a.author = b.id
ORDER BY a.par DESC,a.lev asc, a.qno ASC;

SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev, a.par AS par, b.name AS name 
FROM qna a, member b WHERE a.author = b.id

COMMIT;


UPDATE qna SET cnt=cnt+1 WHERE qno=10;

CREATE VIEW qnalist AS(SELECT q.qno AS qno, q.title AS title, q.content AS content, q.author AS author, 
q.resdate AS resdate,q.cnt AS cnt, q.lev AS lev, q.par AS par, m.name AS name
FROM qna q, member m WHERE q.author=m.id order BY q.par DESC, q.lev ASC, q.qno ASC);


CREATE TABLE faq(
	fno INT PRIMARY KEY AUTO_INCREMENT,
	question VARCHAR(200) NOT NULL,
	answer VARCHAR(2000),
	cnt INT DEFAULT 0	
)



DESC faq;

INSERT INTO faq(question,answer) VALUES('강좌 신청방법을 알려주세요.','1. 홈페이지 상단 [강좌 안내]를 클릭하여 접속하고, 좌측의 메뉴와 영역별/선생님별/교재별 검색을 이용하여 내가 학습할 강좌를 찾습니다.

※ [강좌 한눈의 보기]를 이용하면 각 과정에 대해서 파악이 가능합니다.



2. 원하는 강좌를 선택하여 하단의 [장바구니 담기] 또는 [바로 구매하기]를 클릭하여 결제를 진행합니다.

※ 같은 영역과 학년의 강좌 중에서도 범위, 선생님, 교재 등이 달라서 선택의 폭이 넓습니다.

  강좌소개 및 맛보기 강의를 통해서 나에게 필요한 강좌를 선택하여 신청하세요.');
  INSERT INTO faq(question,answer) VALUES('학습생 탈퇴는 어디서 하나요?','탈퇴를 하시려면, 정보수정 > 탈퇴 메뉴를 통해 하실 수 있습니다.



※ 회원탈퇴시 회원님이 보유하고 있는 포인트/각종 쿠폰/학습내용/쪽지와 함께 개인정보 등은 자동 소멸되며,

회원을 재가입할 경우 복원되지 않으니 주의 바랍니다.');
  INSERT INTO faq(question,answer) VALUES('비밀번호를 변경하고 싶어요','비밀번호를 변경 하시려면, 로그인 후

정보수정 > 개인정보수정 메뉴를 통해 하실 수 있습니다.');
  INSERT INTO faq(question,answer) VALUES('	등록한 아이디를 변경 할 수 있을까요?','최초 가입한 아이디는 변경하실 수 없습니다.

탈퇴 후 다시 가입을 할때 아이디를 변경하여 가입할 수는 있지만,

이전 아이디의 나의 포인트/등급, 학습정보, 친구목록 등이 모두 사라지게 됩니다.');










SELECT * FROM member;

UPDATE member SET pw='03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4' WHERE pw='1234';

COMMIT;




INSERT INTO member(id,pw,NAME,email,tel) VALUES('test','1234','test','test@test','123');
UPDATE member SET pw= SHA2('1234',256) WHERE pw='1234';



