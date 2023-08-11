create table customer(
customerid varchar(15) primary KEY COMMENT '怨좉컼id',
customername varchar(50) not NULL COMMENT '怨좉컼?대쫫',
customertype varchar(50) not NULL COMMENT '怨좉컼援щ텇',
country varchar(50) not NULL COMMENT '援?쟻',
city varchar(50) COMMENT '?꾩떆',
state varchar(50) COMMENT '二?,
postcode INT COMMENT '?고렪踰덊샇',
regiontype varchar(50) COMMENT '吏??뎄遺? 
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

-- ??⑥쐞 ?곗씠??csv?뚯씪???대떦 ?뚯씠釉붿뿉 import?섍린
LOAD DATA LOCAL INFILE 'buy.csv' INTO TABLE customer FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';


-- ?대떦 ?곗씠?곕? csv濡?export ?섍린
-- ?대떦 ?뚯씠釉?癒쇱? 寃??select)
SELECT * FROM product;
-- 寃??寃곌낵?먯꽌 ?꾩껜 ?좏깮????留덉슦???ㅻⅨ履?寃⑹옄 ???대낫?닿린]
-- ?대낫????낆쓣 Excel csv ?좏깮?섍퀬, ?대떦 ?뚯씪???대쫫怨?寃쎈줈瑜?吏??
-- ?대낫?닿린

-- SQL ?뚯씪 ?ㅽ뻾?섏뿬 sql 紐낅졊???ㅽ뻾?섍린. (?곕??먯뿉???뚯씪?덈뒗 寃쎈줈?먯꽌 ?ㅽ뻾??寃?)
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


-- ?뚯썝 ?깅줉
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

-- 怨좉컼 ?뺣낫 蹂寃?
UPDATE customer SET country='America',city='Los Angels', state='Los Angels' WHERE customerid = 'AK-10880';
-- ?뱀뿉??怨좉컼 ?뺣낫 蹂寃?
UPDATE customer SET country=?,city=?, state=? WHERE customerid = ?;
pstmt.setSting(1,cus.getCountry());
pstmt.setSting(2,cus.getCity());
pstmt.setSting(3,cus.getState());
pstmt.setSting(4,cus.getCustomerid());



-- 怨좉컼 ??젣
DELETE FROM customer WHERE customerid='AK-10880';
-- ?뱀뿉??怨좉컼 ??젣
DELETE FROM customer WHERE customerid=?;
pstmt.setString(1,customerid);






SHOW TABLES;
SELECT * FROM buy;

-- customerid 蹂꾨줈 洹몃９?뷀븯??customerid, ?쒗뭹嫄곕옒嫄댁닔, 珥앹닔?? ?됯퇏 ?좎씤?⑥쓣 異쒕젰
-- SELECT customerid, COUNT(*) AS ?쒗뭹嫄곕옒嫄댁닔,SUM(*) AS 珥앹닔??avg

SELECT customerid,COUNT(productid) AS ?쒗뭹嫄곕옒嫄댁닔,SUM(quantity) AS 珥앹닔?? 
avg(discount) AS ?됯퇏?좎씤??FROM buy GROUP BY customerid;


-- buy ?뚯씠釉붿뿉???좎씤?⑥씠 媛???묒? 嫄곕옒 ?뺣낫瑜??섎웾(quantity)???대┝李⑥닚?쇰줈 異쒕젰?섏떆??
-- (???섎웾??媛숈? 寃쎌슦 二쇰Ц??orderdate)???ㅻ쫫李⑥닚?쇰줈 ?섏떆??
SELECT * FROM buy where discount = (select min(discount) from buy) 
ORDER BY quantity DESC, orderdate ASC;

-- 諛곗넚??shipdate)???꾨룄蹂꾨줈 珥앹닔?됱쓽 ?⑷퀎? 珥앹닔?됱쓽 ?됯퇏, 珥앹닔?됱쓽 理쒕?媛믪쓣 吏묎퀎?섏떆??
-- ?꾨룄瑜?異붿텧?섎뒗 ?⑥닔??year

SELECT YEAR(shipdate) AS ?꾨룄,SUM(quantity) AS '珥앺빀怨?, AVG(quantity) AS '珥앺룊洹?,MAX(quantity)
AS 理쒕?諛곗넚??FROM buy GROUP BY YEAR(shipdate);

-- 二쇰Ц??orderdate)???꾨룄? ?붾퀎濡?二쇰Ц?섎웾(quantity)???⑷퀎? ?됯퇏 ?좎씤?⑥쓣 吏묎퀎?섏떆??
-- (date_format ?⑥닔瑜??ъ슜) dateformat(而щ읆,?뺤떇)
SELECT DATE_FORMAT(orderdate,'%y-%m') AS ?꾨룄, SUM(quantity) AS 二쇰Ц?됲빀怨? 
AVG(discount) AS ?좎씤?⑦룊洹?
FROM buy GROUP BY DATE_FORMAT(orderdate,'%y-%m') HAVING SUM(quantity) != 0;


-- ?쒗뭹踰덊샇(productid)媛 FUR濡??쒖옉?섎뒗 媛援?醫낅쪟瑜?援щℓ??怨좉컼?뺣낫 以묒뿉??
-- 怨좉컼紐?customername), 援??(country), ?꾩떆(city)瑜?異쒕젰?섎릺,
-- 怨좉컼id(customerid)???대┝李⑥닚?쇰줈 ?섍퀬, 
-- 怨좉컼id媛 媛숈? 寃쎌슦 二쇰Ц?섎웾(quantitiy)???ㅻ쫫李⑥닚?쇰줈 ??寃?
-- ?댁쨷荑쇰━, ?곌?荑쇰━, ?대?議곗씤 ???먰븯??諛⑹떇?쇰줈 ?닿껐
SELECT a.customername, a.country, a.city FROM customer a, buy b 
WHERE a.customerid = b.customerid AND b.productid LIKE 'FUR%' ORDER BY a.customerid DESC, b.quantity ASC;

SELECT a.customername, a.country, a.city FROM customer a inner join buy b on 
a.customerid = b.customerid AND b.productid LIKE 'FUR%' ORDER BY a.customerid DESC, b.quantity ASC;


-- ?쒗뭹(product) ?뚯씠釉붾줈遺??媛寃?price)??40 ?댁긽???쒗뭹??寃?됲븯???쒗뭹2(product2) ?뚯씠釉붿쓣 ?앹꽦?섏떆??
-- ?쒗뭹(product) ?뚯씠釉붾줈遺??媛寃?price)??40 誘몃쭔???쒗뭹??寃?됲븯???쒗뭹3(product3) ?뚯씠釉붿쓣 ?앹꽦?섏떆??
SELECT * FROM product;
CREATE TABLE product2 AS (SELECT * FROM product WHERE price >= 40);
CREATE TABLE product3 AS (SELECT * FROM product WHERE price < 40);


-- ?쒗뭹3(product3) ?뚯씠釉붾줈遺??price媛 0???덉퐫?쒕? ??젣?섏떆??
DELETE FROM product3 WHERE price=0;

SHOW TABLES;
SELECT * FROM product3; WHERE price =0;
SELECT * FROM product2;

-- ?쒗뭹紐?productname)??" 媛 ?덈뒗 ?곗씠?곗쓽 "瑜??쒓굅
UPDATE product2 SET productname = SUBSTRING(productname, 2, LENGTH(productname)-1)
WHERE productname LIKE '\"%'; 


-- union - 以묐났 ?쒓굅 ?⑹쭛??
-- union all - 以묐났 ?ы븿 ?⑹쭛??
-- 援먯쭛??intersect
-- 李⑥쭛??except
CREATE VIEW uni_tab1 AS (SELECT productid,price FROM product2 UNION SELECT productid,price FROM product3);
CREATE VIEW int_tab1 AS (SELECT productid,price FROM product2 intersect SELECT productid,price FROM product3);
CREATE VIEW exc_tab1 AS (SELECT productid,price FROM product EXCEPT SELECT productid,price FROM product2);

SELECT * from uni_tab1;
SELECT * from int_tab1;
SELECT * from exc_tab1;



-- ?쒗뭹2(product2)? ?쒗뭹3(product3)???뚯씠釉??곗씠?곕? ?⑹쭛?⑺븯???꾩껜?곹뭹(totpro)???뚯씠釉붿쓣 ?앹꽦?섏떆??
CREATE TABLE totpro AS(SELECT * FROM product2 UNION SELECT * FROM product3  );
-- ?쒗뭹(product1)? ?쒗뭹3(product3)???뚯씠釉??곗씠?곕? 李⑥쭛?⑺븯???쒓굅?곹뭹(revpro)???뚯씠釉붿쓣 ?앹꽦
CREATE TABLE revpro AS(SELECT * FROM product1 EXCEPT SELECT * FROM product3);
-- ?쒗뭹(product)? ?쒗뭹2(product2)???뚯씠釉??곗씠?곕? 援먯쭛?⑺븯???멸린?곹뭹(hotpro)???뚯씠釉붿쓣 ?앹꽦
CREATE TABLE hotpro AS(SELECT * FROM product intersect SELECT * FROM product2);


-- ?뱀젙 怨좉컼??二쇰Ц?뺣낫瑜?寃??
SELECT * FROM buy WHERE customerid = '';
SELECT * FROM buy WHERE customerid = '';
pstmt.setString(1,customerid);

-- ?뱀젙 怨좉컼??蹂몄씤 ?뺣낫
SELECT * FROM customer WHERE customerid= '';
SELECT * FROM customer WHERE customerid = '';
pstmt.setString(1,customerid);



-- DAO Data Access Object


-- controller







-- 0802






































