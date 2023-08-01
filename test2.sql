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
orderid varchar(15) not null,
orderdate TIMESTAMP default CURRENT_TIMESTAMP(), 
shipdate TIMESTAMP default CURRENT_TIMESTAMP(), 
customerid varchar(15),
productid varchar(15),
quantity int(10),
discount decimal(10,2)
);

create table product (
productid varchar(15) primary key,
bigcategory varchar(50) not null,
subcategory varchar(50),
productname varchar(100) not null,
price decimal(10,2)
);
