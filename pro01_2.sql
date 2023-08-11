create table customer(
customerid varchar(15) primary KEY COMMENT '고객id',
customername varchar(50) not NULL COMMENT '고객이름',
customertype varchar(50) not NULL COMMENT '고객구분',
country varchar(50) not NULL COMMENT '국적',
city varchar(50) COMMENT '도시',
state varchar(50) COMMENT '주',
postcode INT COMMENT '우편번호',
regiontype varchar(50) COMMENT '지역구분' 
);

create table buy (
seq int auto_increment primary key,
orderid varchar(15) not NULL,
orderdate TIMESTAMP default CURRENT_TIMESTAMP(), 
shipdate TIMESTAMP default CURRENT_TIMESTAMP(), 
customerid varchar(15),
productid varchar(15),
quantity int(10),
discount decimal(10,2)
);
 
SELECT * FROM product;
create table product (
productid varchar(15) primary key,
bigcategory varchar(50) not null,
subcategory varchar(50),
productname varchar(100) not null,
price decimal(10,2)
);


SHOW TABLES;
DESC product;
DROP TABLE product;

-- 대단위 데이터 csv파일을 해당 테이블에 import하기
LOAD DATA LOCAL INFILE 'buy.csv' INTO TABLE customer FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';


-- 해당 데이터를 csv로 export 하기
-- 해당 테이블 먼저 검색(select)
SELECT * FROM product;
-- 검색 결과에서 전체 선택한 후 마우스 오른쪽[격자 행 내보내기]
-- 내보낼 타입을 Excel csv 선택하고, 해당 파일의 이름과 경로를 지정
-- 내보내기

-- SQL 파일 실행하여 sql 명령을 실행하기. (터미널에서 파일있는 경로에서 실행할 것.)
SOURCE test2.sql;





customer cus = NEW customer();
cus.setCumtomerid(request.getParameter());
cus.setCumtomername());
cus.setCumtomertype());
cus.setCountry());
cus.setCity());
cus.setState());
cus.setPostcode());
cus.setRegiontype());


SELECT * FROM customer;
INSERT INTO customer VALUES('AK-10880','Alien Kim','Consumer','South Korea','Seoul','Seoul',18517 ,'West');

SELECT * FROM customer WHERE customername LIKE '%Kim%' AND city='Seoul';
SELECT COUNT(*) AS cnt FROM customer WHERE customername LIKE '%Kim%';


-- 회원 등록
INSERT INTO customer VALUES(?, ?, ?, ?, ?, ?, ?, ?);
pstmt.setString(1, cus.getCumtomerid());
pstmt.setString(2, cus.getCumtomername());
pstmt.setString(3, cus.getCumtomertype());
pstmt.setString(4, cus.getCountry());
pstmt.setString(5, cus.getCity());
pstmt.setString(6, cus.getState());
pstmt.setInt(7, cus.getPostcode());
pstmt.setString(8, cus.getRegiontype());


SELECT * FROM customer WHERE customername LIKE '%Kim%';

-- 고객 정보 변경
UPDATE customer SET country='America',city='Los Angels', state='Los Angels' WHERE customerid = 'AK-10880';
-- 웹에서 고객 정보 변경
UPDATE customer SET country=?,city=?, state=? WHERE customerid = ?;
pstmt.setSting(1,cus.getCountry());
pstmt.setSting(2,cus.getCity());
pstmt.setSting(3,cus.getState());
pstmt.setSting(4,cus.getCustomerid());



-- 고객 삭제
DELETE FROM customer WHERE customerid='AK-10880';
-- 웹에서 고객 삭제
DELETE FROM customer WHERE customerid=?;
pstmt.setString(1,customerid);






SHOW TABLES;
SELECT * FROM buy;

-- customerid 별로 그룹화하여 customerid, 제품거래건수, 총수량, 평균 할인율을 출력
-- SELECT customerid, COUNT(*) AS 제품거래건수,SUM(*) AS 총수량,avg

SELECT customerid,COUNT(productid) AS 제품거래건수,SUM(quantity) AS 총수량, 
avg(discount) AS 평균할인율 FROM buy GROUP BY customerid;


-- buy 테이블에서 할인율이 가장 작은 거래 정보를 수량(quantity)의 내림차순으로 출력하시오.
-- (단 수량이 같은 경우 주문일(orderdate)의 오름차순으로 하시오
SELECT * FROM buy where discount = (select min(discount) from buy) 
ORDER BY quantity DESC, orderdate ASC;

-- 배송일(shipdate)의 년도별로 총수량의 합계와 총수량의 평균, 총수량의 최대값을 집계하시오.
-- 년도를 추출하는 함수는 year

SELECT YEAR(shipdate) AS 년도,SUM(quantity) AS '총합계', AVG(quantity) AS '총평균',MAX(quantity)
AS 최대배송량 FROM buy GROUP BY YEAR(shipdate);

-- 주문일(orderdate)의 년도와 월별로 주문수량(quantity)의 합계와 평균 할인율을 집계하시오.
-- (date_format 함수를 사용) dateformat(컬럼,형식)
SELECT DATE_FORMAT(orderdate,'%y-%m') AS 년도, SUM(quantity) AS 주문량합계, 
AVG(discount) AS 할인율평균
FROM buy GROUP BY DATE_FORMAT(orderdate,'%y-%m') HAVING SUM(quantity) != 0;


-- 제품번호(productid)가 FUR로 시작하는 가구 종류를 구매한 고객정보 중에서
-- 고객명(customername), 국가(country), 도시(city)를 출력하되,
-- 고객id(customerid)의 내림차순으로 하고, 
-- 고객id가 같은 경우 주문수량(quantitiy)의 오름차순으로 할 것.
-- 이중쿼리, 연관쿼리, 내부조인 등 원하는 방식으로 해결
SELECT a.customername, a.country, a.city FROM customer a, buy b 
WHERE a.customerid = b.customerid AND b.productid LIKE 'FUR%' ORDER BY a.customerid DESC, b.quantity ASC;

SELECT a.customername, a.country, a.city FROM customer a inner join buy b on 
a.customerid = b.customerid AND b.productid LIKE 'FUR%' ORDER BY a.customerid DESC, b.quantity ASC;


-- 제품(product) 테이블로부터 가격(price)이 40 이상인 제품을 검색하여 제품2(product2) 테이블을 생성하시오
-- 제품(product) 테이블로부터 가격(price)이 40 미만인 제품을 검색하여 제품3(product3) 테이블을 생성하시오
SELECT * FROM product;
CREATE TABLE product2 AS (SELECT * FROM product WHERE price >= 40);
CREATE TABLE product3 AS (SELECT * FROM product WHERE price < 40);


-- 제품3(product3) 테이블로부터 price가 0인 레코드를 삭제하시오.
DELETE FROM product3 WHERE price=0;

SHOW TABLES;
SELECT * FROM product3; WHERE price =0;
SELECT * FROM product2;

-- 제품명(productname)에 " 가 있는 데이터의 "를 제거
UPDATE product2 SET productname = SUBSTRING(productname, 2, LENGTH(productname)-1)
WHERE productname LIKE '\"%'; 


-- union - 중복 제거 합집합
-- union all - 중복 포함 합집합
-- 교집합 intersect
-- 차집합 except
CREATE VIEW uni_tab1 AS (SELECT productid,price FROM product2 UNION SELECT productid,price FROM product3);
CREATE VIEW int_tab1 AS (SELECT productid,price FROM product2 intersect SELECT productid,price FROM product3);
CREATE VIEW exc_tab1 AS (SELECT productid,price FROM product EXCEPT SELECT productid,price FROM product2);

SELECT * from uni_tab1;
SELECT * from int_tab1;
SELECT * from exc_tab1;



-- 제품2(product2)와 제품3(product3)의 테이블 데이터를 합집합하여 전체상품(totpro)의 테이블을 생성하시오
CREATE TABLE totpro AS(SELECT * FROM product2 UNION SELECT * FROM product3  );
-- 제품(product1)와 제품3(product3)의 테이블 데이터를 차집합하여 제거상품(revpro)의 테이블을 생성
CREATE TABLE revpro AS(SELECT * FROM product1 EXCEPT SELECT * FROM product3);
-- 제품(product)와 제품2(product2)의 테이블 데이터를 교집합하여 인기상품(hotpro)의 테이블을 생성
CREATE TABLE hotpro AS(SELECT * FROM product intersect SELECT * FROM product2);


-- 특정 고객의 주문정보를 검색
SELECT * FROM buy WHERE customerid = '';
SELECT * FROM buy WHERE customerid = '';
pstmt.setString(1,customerid);

-- 특정 고객의 본인 정보
SELECT * FROM customer WHERE customerid= '';
SELECT * FROM customer WHERE customerid = '';
pstmt.setString(1,customerid);



-- DAO Data Access Object


-- controller







-- 0802
-- 트랜잭션
use shop;
-- 재고 테이블
CREATE TABLE inven(
	ino INT PRIMARY KEY AUTO_INCREMENT,
	pid VARCHAR(20),
	qty INT 
	);
	
-- 판매 테이블
CREATE TABLE sale(
	sno INT PRIMARY KEY AUTO_INCREMENT,
	pid VARCHAR(20),
	qty INT 
	);

SHOW TABLES;

-- 입고
INSERT INTO inven(pid, qty) VALUES ('a001',12);
INSERT INTO inven(pid, qty) VALUES ('b001',25);
INSERT INTO inven(pid, qty) VALUES ('c001',18);

INSERT INTO inven(pid, qty) VALUES ('a001',11);
INSERT INTO inven(pid, qty) VALUES ('b001',19);
INSERT INTO inven(pid, qty) VALUES ('c001',14);



SELECT * FROM inven;

CREATE VIEW pro_view1 AS ( SELECT pid, SUM(qty) AS 재고합계 FROM inven GROUP BY pid );

SELECT * FROM pro_view1;


-- 판매
INSERT INTO sale(pid, qty) VALUES ('a001',14);

UPDATE inven SET qty = qty-14 WHERE pid = 'a001';
-- 트랜잭션 처리가 되지 않으면, 재고 처리 시스템에 문제가 발생하므로
-- 이러한 경우 간혹 차집합으로 연산하는 경우가 있음. 
-- 그러나 테이블의 변화를 예측하기 힘든 현상이 발생하기 때문에 사용하지 않는 것이 좋음.

START TRANSACTION;

SAVEPOINT a;

INSERT INTO sale(pid,qty) VALUES ('a001',5);

UPDATE inven SET qty=qty-5 WHERE pid='a001' AND ino=(SELECT MIN(ino) FROM inven WHERE pid='a001' GROUP BY pid);

SELECT * FROM inven;

COMMIT


ROLLBACK; -- 전부 롤백
ROLLBACK TO a; --해당 SAVEPOINT 내용만 롤백



CREATE TABLE student(
	sno INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(100),
	kor INT,
	eng INT,
	mat INT
);

-- 5명의 학생 성적 데이터를 추가
INSERT INTO student(sname,kor,eng,mat) VALUES ('백준철',70,90,90);
INSERT INTO student(sname,kor,eng,mat) VALUES ('구예진',75,85,90);
INSERT INTO student(sname,kor,eng,mat) VALUES ('신승원',80,80,80);
INSERT INTO student(sname,kor,eng,mat) VALUES ('오세훈',85,95,90);
INSERT INTO student(sname,kor,eng,mat) VALUES ('김기태',90,80,95);

SELECT * FROM student;

SELECT sname AS 이름, kor+mat+eng AS '총점', (kor+mat+eng)/3 AS '평균' FROM student;


SELECT sname AS 이름, kor+mat+eng AS '총점', ROUND((kor+mat+eng)/3) AS '평균', 
if((kor+mat+eng)/3>=80, '합격','불합격') AS pan FROM student;
-- if(조건문, 참일때 값, 거짓일때 값)
-- ROUND 반올림 

case 
when ROUND((kor+mat+eng)/3) BETWEEN 90 AND 100 then 'A';
ELSE
end
-- case
-- 	when 조건1 then 조건1이 만족할때 값
-- 	when 조건1 then 조건1이 만족할때 값
-- 	when 조건1 then 조건1이 만족할때 값
--		eles 어떠한조건도 만족하지 않을 경우의 값
-- end
SELECT sname AS 'name', kor+mat+eng AS 'tot', ROUND((kor+mat+eng)/3) AS 'avg', 
if((kor+mat+eng)/3>=80, '합격','불합격') AS pan ,
case
	when ROUND((kor+mat+eng)/3) BETWEEN 90 AND 100 then 'A'
	when ROUND((kor+mat+eng)/3) BETWEEN 80 AND 89 then 'B'
	when ROUND((kor+mat+eng)/3) BETWEEN 70 AND 79 then 'C'
	ELSE 'F'
	END
	AS hak
FROM student;

















shopboard