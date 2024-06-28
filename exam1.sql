
-- DROP DATABASE IF EXISTS sales_co;
-- CREATE DATABASE sales_co;
-- USE sales_co;
-- CREATE TABLE VENDOR (
-- V_CODE 		INTEGER,
-- V_NAME 		VARCHAR(35) NOT NULL,
-- V_CONTACT 	VARCHAR(15) NOT NULL,
-- V_AREACODE 	CHAR(3) NOT NULL,
-- V_PHONE 	CHAR(8) NOT NULL,
-- V_STATE 	CHAR(2) NOT NULL,
-- V_ORDER 	CHAR(1) NOT NULL,
-- PRIMARY KEY (V_CODE));


-- CREATE TABLE PRODUCT (
-- P_CODE 	VARCHAR(10) PRIMARY KEY,
-- P_DESCRIPT 	VARCHAR(35) NOT NULL,
-- P_INDATE 	DATE NOT NULL,
-- P_ONHAND 	FLOAT NOT NULL,
-- P_MIN 		FLOAT NOT NULL,
-- P_PRICE 	FLOAT NOT NULL,
-- P_DISCOUNT 	FLOAT NOT NULL,
-- V_CODE 		INTEGER,
-- CONSTRAINT PRODUCT_V_CODE_FK FOREIGN KEY(V_CODE) REFERENCES VENDOR(V_CODE));

-- CREATE TABLE CUSTOMER (
-- CUS_CODE	FLOAT PRIMARY KEY,
-- CUS_LNAME	VARCHAR(15) NOT NULL,
-- CUS_FNAME	VARCHAR(15) NOT NULL,
-- CUS_INITIAL	CHAR(1),
-- CUS_AREACODE 	CHAR(3) DEFAULT '615' NOT NULL,
-- CUS_PHONE	CHAR(8) NOT NULL,
-- CUS_BALANCE	FLOAT DEFAULT 0.00,
-- CONSTRAINT CUS_UI1 UNIQUE(CUS_LNAME,CUS_FNAME));


-- CREATE TABLE INVOICE (
-- INV_NUMBER     	FLOAT PRIMARY KEY,
-- CUS_CODE	FLOAT NOT NULL REFERENCES CUSTOMER(CUS_CODE),
-- INV_DATE  	DATE NOT NULL,
-- INV_SUBTOTAL    FLOAT,
-- INV_TAX         FLOAT,
-- INV_TOTAL       FLOAT);


-- CREATE TABLE LINE (
-- INV_NUMBER 	FLOAT NOT NULL,
-- LINE_NUMBER	FLOAT NOT NULL,
-- P_CODE		VARCHAR(10) NOT NULL,
-- LINE_UNITS	FLOAT DEFAULT 0.00 NOT NULL,
-- LINE_PRICE	FLOAT DEFAULT 0.00 NOT NULL,
-- LINE_TOTAL      FLOAT,
-- PRIMARY KEY (INV_NUMBER,LINE_NUMBER),
-- FOREIGN KEY (INV_NUMBER) REFERENCES INVOICE(INV_NUMBER) ON DELETE CASCADE,
-- FOREIGN KEY (P_CODE) REFERENCES PRODUCT(P_CODE),
-- CONSTRAINT LINE_UI1 UNIQUE(INV_NUMBER, P_CODE));



-- /* VENDOR rows						*/
-- INSERT INTO VENDOR VALUES(21225,'Bryson, Inc.'    ,'Smithson','615','223-3234','TN','Y');
-- INSERT INTO VENDOR VALUES(21226,'SuperLoo, Inc.'  ,'Flushing','904','215-8995','FL','N');
-- INSERT INTO VENDOR VALUES(21231,'D&E Supply'     ,'Singh'   ,'615','228-3245','TN','Y');
-- INSERT INTO VENDOR VALUES(21344,'Gomez Bros.'     ,'Ortega'  ,'615','889-2546','KY','N');
-- INSERT INTO VENDOR VALUES(22567,'Dome Supply'     ,'Smith'   ,'901','678-1419','GA','N');
-- INSERT INTO VENDOR VALUES(23119,'Randsets Ltd.'   ,'Anderson','901','678-3998','GA','Y');
-- INSERT INTO VENDOR VALUES(24004,'Brackman Bros.'  ,'Browning','615','228-1410','TN','N');
-- INSERT INTO VENDOR VALUES(24288,'ORDVA, Inc.'     ,'Hakford' ,'615','898-1234','TN','Y');
-- INSERT INTO VENDOR VALUES(25443,'B&K, Inc.'      ,'Smith'   ,'904','227-0093','FL','N');
-- INSERT INTO VENDOR VALUES(25501,'Damal Supplies'  ,'Smythe'  ,'615','890-3529','TN','N');
-- INSERT INTO VENDOR VALUES(25595,'Rubicon Systems' ,'Orton'   ,'904','456-0092','FL','Y');

-- /* PRODUCT rows						*/
-- INSERT INTO PRODUCT VALUES('11QER/31','Power painter, 15 psi., 3-nozzle'     ,'2003-11-03',  8,  5,109.99,0.00,25595);
-- INSERT INTO PRODUCT VALUES('13-Q2/P2','7.25-in. pwr. saw blade'              ,'2003-12-13', 32, 15, 14.99,0.05,21344);
-- INSERT INTO PRODUCT VALUES('14-Q1/L3','9.00-in. pwr. saw blade'              ,'2003-11-13', 18, 12, 17.49,0.00,21344);
-- INSERT INTO PRODUCT VALUES('1546-QQ2','Hrd. cloth, 1/4-in., 2x50'            ,'2004-01-04', 15,  8, 39.95,0.00,23119);
-- INSERT INTO PRODUCT VALUES('1558-QW1','Hrd. cloth, 1/2-in., 3x50'            ,'2004-01-15', 23,  5, 43.99,0.00,23119);
-- INSERT INTO PRODUCT VALUES('2232/QTY','B&D jigsaw, 12-in. blade'            ,'2003-12-10',  8,  5,109.92,0.05,24288);
-- INSERT INTO PRODUCT VALUES('2232/QWE','B&D jigsaw, 8-in. blade'             ,'2003-12-24',  6,  5, 99.87,0.05,24288);
-- INSERT INTO PRODUCT VALUES('2238/QPD','B&D cordless drill, 1/2-in.'         ,'2004-01-20', 12,  5, 38.95,0.05,25595);
-- INSERT INTO PRODUCT VALUES('23109-HB','Claw hammer'                          ,'2004-01-20', 23, 10,  9.95,0.10,21225);
-- INSERT INTO PRODUCT VALUES('23114-AA','Sledge hammer, 12 lb.'                ,'2004-01-20',  8,  5, 14.40,0.05,NULL );
-- INSERT INTO PRODUCT VALUES('54778-2T','Rat-tail file, 1/8-in. fine'          ,'2003-12-15', 43, 20,  4.99,0.00,21344);
-- INSERT INTO PRODUCT VALUES('89-WRE-Q','Hicut chain saw, 16 in.'              ,'2004-02-17', 11,  5,256.99,0.05,24288);
-- INSERT INTO PRODUCT VALUES('PVC23DRT','PVC pipe, 3.5-in., 8-ft'              ,'2004-02-20',188, 75,  5.87,0.00,NULL );
-- INSERT INTO PRODUCT VALUES('SM-18277','1.25-in. metal screw, 25'             ,'2004-03-01',172, 75,  6.99,0.00,21225);
-- INSERT INTO PRODUCT VALUES('SW-23116','2.5-in. wd. screw, 50'                ,'2004-02-24',237,100,  8.45,0.00,21231);
-- INSERT INTO PRODUCT VALUES('WR3/TT3' ,'Steel matting, 4''x8''x1/6", .5" mesh','2004-01-07', 18,  5,119.95,0.10,25595);


-- /* CUSTOMER rows					*/
-- INSERT INTO CUSTOMER VALUES(10010,'Ramas'   ,'Alfred','A' ,'615','844-2573',0);
-- INSERT INTO CUSTOMER VALUES(10011,'Dunne'   ,'Leona' ,'K' ,'713','894-1238',0);
-- INSERT INTO CUSTOMER VALUES(10012,'Smith'   ,'Kathy' ,'W' ,'615','894-2285',345.86);
-- INSERT INTO CUSTOMER VALUES(10013,'Olowski' ,'Paul'  ,'F' ,'615','894-2180',536.75);
-- INSERT INTO CUSTOMER VALUES(10014,'Orlando' ,'Myron' ,NULL,'615','222-1672',0);
-- INSERT INTO CUSTOMER VALUES(10015,'O''Brian','Amy'   ,'B' ,'713','442-3381',0);
-- INSERT INTO CUSTOMER VALUES(10016,'Brown'   ,'James' ,'G' ,'615','297-1228',221.19);
-- INSERT INTO CUSTOMER VALUES(10017,'Williams','George',NULL,'615','290-2556',768.93);
-- INSERT INTO CUSTOMER VALUES(10018,'Farriss' ,'Anne'  ,'G' ,'713','382-7185',216.55);
-- INSERT INTO CUSTOMER VALUES(10019,'Smith'   ,'Olette','K' ,'615','297-3809',0);


-- /* INVOICE rows						*/
-- INSERT INTO INVOICE VALUES(1001,10014,'2004-01-16',  24.90,  1.99,  26.89);
-- INSERT INTO INVOICE VALUES(1002,10011,'2004-01-16',   9.98,  0.80,  10.78);
-- INSERT INTO INVOICE VALUES(1003,10012,'2004-01-16', 153.85, 12.31, 166.16);
-- INSERT INTO INVOICE VALUES(1004,10011,'2004-01-17',  34.97,  2.80,  37.77);
-- INSERT INTO INVOICE VALUES(1005,10018,'2004-01-17',  70.44,  5.64,  76.08);
-- INSERT INTO INVOICE VALUES(1006,10014,'2004-01-17', 397.83, 31.83, 429.66);
-- INSERT INTO INVOICE VALUES(1007,10015,'2004-01-17',  34.97,  2.80,  37.77);
-- INSERT INTO INVOICE VALUES(1008,10011,'2004-01-17', 399.15, 31.93, 431.08);

-- /* LINE rows						*/
-- INSERT INTO LINE VALUES(1001,1,'13-Q2/P2',1,  14.99,  14.99);
-- INSERT INTO LINE VALUES(1001,2,'23109-HB',1,   9.95,   9.95);
-- INSERT INTO LINE VALUES(1002,1,'54778-2T',2,   4.99,   9.98);
-- INSERT INTO LINE VALUES(1003,1,'2238/QPD',1,  38.95,  38.95);
-- INSERT INTO LINE VALUES(1003,2,'1546-QQ2',1,  39.95,  39.95);
-- INSERT INTO LINE VALUES(1003,3,'13-Q2/P2',5,  14.99,  74.95);
-- INSERT INTO LINE VALUES(1004,1,'54778-2T',3,   4.99,  14.97);
-- INSERT INTO LINE VALUES(1004,2,'23109-HB',2,   9.95,  19.90);
-- INSERT INTO LINE VALUES(1005,1,'PVC23DRT',12,  5.87,  70.44);
-- INSERT INTO LINE VALUES(1006,1,'SM-18277',3,   6.99,  20.97);
-- INSERT INTO LINE VALUES(1006,2,'2232/QTY',1, 109.92, 109.92);
-- INSERT INTO LINE VALUES(1006,3,'23109-HB',1,   9.95,   9.95);
-- INSERT INTO LINE VALUES(1006,4,'89-WRE-Q',1, 256.99, 256.99);
-- INSERT INTO LINE VALUES(1007,1,'13-Q2/P2',2,  14.99,  29.98);
-- INSERT INTO LINE VALUES(1007,2,'54778-2T',1,   4.99,   4.99);
-- INSERT INTO LINE VALUES(1008,1,'PVC23DRT',5,   5.87,  29.35);
-- INSERT INTO LINE VALUES(1008,2,'WR3/TT3' ,3, 119.95, 359.85);
-- INSERT INTO LINE VALUES(1008,3,'23109-HB',1,   9.95,   9.95);

use sales_co;

-- select * 
-- from customer c
-- join invoice i
-- 	on c.cus_code = i.cus_code
-- join line l
-- 	on l.inv_number = i.inv_number
-- join product p
-- 	on p.p_code = l.p_code
-- join vendor v
-- 	on v.v_code = p.v_code;

-- use sales_co;

-- select distinct concat(cus_fname, cus_lname) as Name, cus_phone, cus_balance
-- from customer c
-- join invoice i
-- 	on c.cus_code = i.cus_code
-- join line l
-- 	on l.inv_number = i.inv_number
-- join product p
-- 	on p.p_code = l.p_code
-- where p.v_code = 21225;








-- CREATE DATABASE `invoicing`; 
-- USE `invoicing`;

-- SET NAMES utf8 ;
-- SET character_set_client = utf8mb4 ;

-- CREATE TABLE `payment_methods` (
--   `payment_method_id` tinyint(4) NOT NULL AUTO_INCREMENT,
--   `name` varchar(50) NOT NULL,
--   PRIMARY KEY (`payment_method_id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- INSERT INTO `payment_methods` VALUES (1,'Credit Card');
-- INSERT INTO `payment_methods` VALUES (2,'Cash');
-- INSERT INTO `payment_methods` VALUES (3,'PayPal');
-- INSERT INTO `payment_methods` VALUES (4,'Wire Transfer');

-- CREATE TABLE `clients` (
--   `client_id` int(11) NOT NULL,
--   `name` varchar(50) NOT NULL,
--   `address` varchar(50) NOT NULL,
--   `city` varchar(50) NOT NULL,
--   `state` char(2) NOT NULL,
--   `phone` varchar(50) DEFAULT NULL,
--   PRIMARY KEY (`client_id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- INSERT INTO `clients` VALUES (1,'Vinte','3 Nevada Parkway','Syracuse','NY','315-252-7305');
-- INSERT INTO `clients` VALUES (2,'Myworks','34267 Glendale Parkway','Huntington','WV','304-659-1170');
-- INSERT INTO `clients` VALUES (3,'Yadel','096 Pawling Parkway','San Francisco','CA','415-144-6037');
-- INSERT INTO `clients` VALUES (4,'Kwideo','81674 Westerfield Circle','Waco','TX','254-750-0784');
-- INSERT INTO `clients` VALUES (5,'Topiclounge','0863 Farmco Road','Portland','OR','971-888-9129');

-- CREATE TABLE `invoices` (
--   `invoice_id` int(11) NOT NULL,
--   `number` varchar(50) NOT NULL,
--   `client_id` int(11) NOT NULL,
--   `invoice_total` decimal(9,2) NOT NULL,
--   `payment_total` decimal(9,2) NOT NULL DEFAULT '0.00',
--   `invoice_date` date NOT NULL,
--   `due_date` date NOT NULL,
--   `payment_date` date DEFAULT NULL,
--   PRIMARY KEY (`invoice_id`),
--   KEY `FK_client_id` (`client_id`),
--   CONSTRAINT `FK_client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE RESTRICT ON UPDATE CASCADE
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- INSERT INTO `invoices` VALUES (1,'91-953-3396',2,101.79,0.00,'2019-03-09','2019-03-29',NULL);
-- INSERT INTO `invoices` VALUES (2,'03-898-6735',5,175.32,8.18,'2019-06-11','2019-07-01','2019-02-12');
-- INSERT INTO `invoices` VALUES (3,'20-228-0335',5,147.99,0.00,'2019-07-31','2019-08-20',NULL);
-- INSERT INTO `invoices` VALUES (4,'56-934-0748',3,152.21,0.00,'2019-03-08','2019-03-28',NULL);
-- INSERT INTO `invoices` VALUES (5,'87-052-3121',5,169.36,0.00,'2019-07-18','2019-08-07',NULL);
-- INSERT INTO `invoices` VALUES (6,'75-587-6626',1,157.78,74.55,'2019-01-29','2019-02-18','2019-01-03');
-- INSERT INTO `invoices` VALUES (7,'68-093-9863',3,133.87,0.00,'2019-09-04','2019-09-24',NULL);
-- INSERT INTO `invoices` VALUES (8,'78-145-1093',1,189.12,0.00,'2019-05-20','2019-06-09',NULL);
-- INSERT INTO `invoices` VALUES (9,'77-593-0081',5,172.17,0.00,'2019-07-09','2019-07-29',NULL);
-- INSERT INTO `invoices` VALUES (10,'48-266-1517',1,159.50,0.00,'2019-06-30','2019-07-20',NULL);
-- INSERT INTO `invoices` VALUES (11,'20-848-0181',3,126.15,0.03,'2019-01-07','2019-01-27','2019-01-11');
-- INSERT INTO `invoices` VALUES (13,'41-666-1035',5,135.01,87.44,'2019-06-25','2019-07-15','2019-01-26');
-- INSERT INTO `invoices` VALUES (15,'55-105-9605',3,167.29,80.31,'2019-11-25','2019-12-15','2019-01-15');
-- INSERT INTO `invoices` VALUES (16,'10-451-8824',1,162.02,0.00,'2019-03-30','2019-04-19',NULL);
-- INSERT INTO `invoices` VALUES (17,'33-615-4694',3,126.38,68.10,'2019-07-30','2019-08-19','2019-01-15');
-- INSERT INTO `invoices` VALUES (18,'52-269-9803',5,180.17,42.77,'2019-05-23','2019-06-12','2019-01-08');
-- INSERT INTO `invoices` VALUES (19,'83-559-4105',1,134.47,0.00,'2019-11-23','2019-12-13',NULL);

-- CREATE TABLE `payments` (
--   `payment_id` int(11) NOT NULL AUTO_INCREMENT,
--   `client_id` int(11) NOT NULL,
--   `invoice_id` int(11) NOT NULL,
--   `date` date NOT NULL,
--   `amount` decimal(9,2) NOT NULL,
--   `payment_method` tinyint(4) NOT NULL,
--   PRIMARY KEY (`payment_id`),
--   KEY `fk_client_id_idx` (`client_id`),
--   KEY `fk_invoice_id_idx` (`invoice_id`),
--   KEY `fk_payment_payment_method_idx` (`payment_method`),
--   CONSTRAINT `fk_payment_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON UPDATE CASCADE,
--   CONSTRAINT `fk_payment_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON UPDATE CASCADE,
--   CONSTRAINT `fk_payment_payment_method` FOREIGN KEY (`payment_method`) REFERENCES `payment_methods` (`payment_method_id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- INSERT INTO `payments` VALUES (1,5,2,'2019-02-12',8.18,1);
-- INSERT INTO `payments` VALUES (2,1,6,'2019-01-03',74.55,1);
-- INSERT INTO `payments` VALUES (3,3,11,'2019-01-11',0.03,1);
-- INSERT INTO `payments` VALUES (4,5,13,'2019-01-26',87.44,1);
-- INSERT INTO `payments` VALUES (5,3,15,'2019-01-15',80.31,1);
-- INSERT INTO `payments` VALUES (6,3,17,'2019-01-15',68.10,1);
-- INSERT INTO `payments` VALUES (7,5,18,'2019-01-08',32.77,1);
-- INSERT INTO `payments` VALUES (8,5,18,'2019-01-08',10.00,2);




-- use invoicing;
-- select *
-- from clients c
-- where c.client_id not in (
-- 	select distinct c.Client_id
-- 	from  clients c
-- 	join invoices i
-- 		on c.Client_ID = i.client_id
-- 		) ;

-- create table Person 
-- (  	
-- 	person_id int,
-- 	Fname varchar(10) not null,
--     Lname varchar(10),
--     age int
-- );

-- alter table Person
-- Modify column person_id INT NOT NULL auto_increment primary key;

-- alter table Person
-- Modify column person_id INT ;

-- alter table Person
-- drop Primary Key ;

-- SHOW INDEX FROM Person;

-- create table House
-- (  	
-- 	h_id int not null AUTO_INCREMENT primary key,
-- 	person_id int,
--     address varchar(20)
-- );

-- alter table house
-- add constraint p_k foreign key (person_id) References Person (person_id);

-- delete from house;



-- Insert dummy data into Person table
-- INSERT INTO Person (Fname, Lname, age) VALUES
-- ('John', 'Doe', 30),
-- ('Jane', 'Smith', 25),
-- ('Alice', 'Johnson', 28),
-- ('Bob', 'Brown', 35),
-- ('Carol', 'Davis', 22);

-- Insert dummy data into House table
-- INSERT INTO House (person_id, address) VALUES
-- (6, '123 Elm St'),
-- (7, '456 Oak St'),
-- (8, '789 Pine St'),
-- (9, '101 Maple St'),
-- (10, '202 Birch St');





-- set foreign_key_checks = 0;

-- alter table house
-- drop constraint p_k ;

-- delete h
-- from house h;
-- select *
-- from person p
-- join house h
-- 	on p.person_id = h.person_id
-- where p.person_id = 1
-- ;


-- set foreign_key_checks = 1;

-- create table ligma
-- (
-- 	p_id int,
--     h_id int,
--     start_time date,
--     Primary key(p_id, h_id),
--     constraint p_k2 foreign key (p_id) references person (person_id),
--     constraint h_k foreign key (h_id) references house (h_id)
-- );

-- alter table ligma
-- add constraint p_k2 foreign key (p_id) references person (person_id);


-- alter table ligma
-- add constraint h_k foreign key (h_id) references house (h_id);

-- alter table ligma
-- add primary key (p_id, h_id);

-- alter table ligma
-- drop constraint p_k2;


-- alter table ligma
-- drop constraint h_k;

-- alter table ligma
-- drop index h_k;

-- alter table ligma
-- drop primary key;


-- show index from ligma;

-- drop table ligma;


























































