
-- 	THIS IS THE ONE, SHOULD USE TO CREATE THE TABLES AND INSERT DATA

CREATE DATABASE medical_db1;
USE medical_db1;

-- CREATE TABLE medicines(
-- 	id INT(11) AUTO_INCREMENT,
--     stockId INT(5),
-- 	medicine_name VARCHAR(100),
-- 	description TEXT(500),

-- 	PRIMARY KEY(id)
-- );

CREATE TABLE stocks(
	id INT(5) AUTO_INCREMENT,
    -- dealerId INT(5),	
    pharmacy_name VARCHAR(20),
	medicine_name VARCHAR(100),
	description VARCHAR(500),
    mdf_date DATE,
	exp_date DATE,
	unit_price FLOAT(6,2),
	stock_qty INT(5),
    available TINYINT(1),
	PRIMARY KEY(id)
);



CREATE TABLE dealers(
	id INT(5) AUTO_INCREMENT,
	-- dealer_name VARCHAR(50)NOT NULL,
	-- password VARCHAR(10)NOT NULL,
	-- dealer_nic VARCHAR(10)NOT NULL,
	pharmacy_name VARCHAR(20) NOT NULL unique,
	contact_number INT(10)NOT NULL,
	pharmacy_address TEXT(100),
	certificate_id TEXT(100),
	PRIMARY KEY(id)
);



CREATE TABLE dealer_members(
	nic VARCHAR(10),
    pharmacy_name VARCHAR(20) NOT NULL,
	name VARCHAR(50)NOT NULL,
	password VARCHAR(10)NOT NULL,
	certificate_id TEXT(100),
	contact_number INT(10)NOT NULL,
	PRIMARY KEY(nic)
);



CREATE TABLE delivery_people(
	id INT(5) AUTO_INCREMENT,
	name VARCHAR(50),
	nic VARCHAR(10),
	PRIMARY KEY(id)
);

CREATE TABLE deliveries(
	id INT(11) AUTO_INCREMENT,
    delivery_peopleId INT(5),
	orders_informationId INT(11),
	pickup_time DATETIME,
	delivered_time DATETIME,
	delivery_status ENUM("not delivered","picked up","delivered"),
	PRIMARY KEY(id)
);

CREATE TABLE customers(
	id INT(11) AUTO_INCREMENT,
	name VARCHAR(50),
	password VARCHAR(10),
	age INT(4),
	nic VARCHAR(10),
	contact_no INT(10),
	delivery_address TEXT(100),
	PRIMARY KEY(id)
);

CREATE TABLE orders_information(
	id INT(11) AUTO_INCREMENT,
	customerId INT(5),
    pharmacy_name VARCHAR(20),
	date DATE,
	pic_url TEXT(50),
	PRIMARY KEY(id)
);

-- CREATE TABLE order_medicines(
-- 	id INT(11) AUTO_INCREMENT,
--     orders_informationId INT(5),
-- 	medicine_name VARCHAR(100),
--     amount INT(4),
-- 	PRIMARY KEY(id)
-- );


CREATE TABLE order_medicines(
	-- id INT(11) AUTO_INCREMENT,
    orders_informationId INT(5),
	medicine_name VARCHAR(100),
    amount INT(4),
	PRIMARY KEY(orders_informationId, medicine_name)
);


ALTER TABLE deliveries
ADD FOREIGN KEY (delivery_peopleId) REFERENCES delivery_people(id),
ADD FOREIGN KEY(orders_informationId) REFERENCES orders_information(id);


ALTER TABLE orders_information
ADD FOREIGN KEY (customerId) REFERENCES customers(id),
ADD FOREIGN KEY (pharmacy_name) REFERENCES dealers(pharmacy_name);

ALTER TABLE order_medicines
ADD FOREIGN KEY (orders_informationId) REFERENCES orders_information(id);

-- pharmacy_name VARCHAR(20)
ALTER TABLE stocks
ADD FOREIGN KEY (pharmacy_name) REFERENCES dealers(pharmacy_name);

ALTER TABLE dealer_members
ADD FOREIGN KEY (pharmacy_name) REFERENCES dealers(pharmacy_name);

-- ALTER TABLE medicines
-- ADD FOREIGN KEY (stockId) REFERENCES stocks(id);

INSERT INTO dealers 
VALUES (1, 'ph_name1',11100000,'address1','certId1'),
		(2, 'ph_name2',22200000,'address2','certId2'),
		(3, 'ph_name3',33300000,'address3','certId3');


INSERT INTO dealer_members 
VALUES ('11223334v','ph_name1','dealer_member1', 'password1', 'certId1223', 111122234),
		('22223334v','ph_name1','dealer_member2', 'password2', 'certId1222', 222222234),
		('33223334v','ph_name1','dealer_member3', 'password3', 'certId1224', 333322234),
        ('44223334v','ph_name2','dealer_member4', 'password4', 'certId1225', 444422234),
		('55223334v','ph_name2','dealer_member5', 'password5', 'certId1226', 555522234),
		('66223334v','ph_name2','dealer_member6', 'password6', 'certId1227', 666622234),
        ('77223334v','ph_name3','dealer_member7', 'password7', 'certId1228', 777722234),
		('88223334v','ph_name3','dealer_member8', 'password8', 'certId1229', 888822234),
		('99223334v','ph_name3','dealer_member9', 'password9', 'certId1220', 999922234);


INSERT INTO delivery_people 
VALUES (1,'delivary_name1', 'nic1111'),
		(2,'delivary_name2', 'nic2222'),
		(3,'delivary_name3', 'nic3333');  
        
INSERT INTO customers 
VALUES (1,'customer_name1', 'password1', 58, '11111v', 111122234, 'delivery_address1'),
		(2,'customer_name2', 'password1', 64, '22222v', 333223445, 'delivery_address2'),
		(3,'customery_name3', 'password1', 70, '33333v', 556674444, 'delivery_address3');       
    
    
    -- INSERT INTO medicines 
-- VALUES (1,1, 'medi1', 'description1', 20200101, 20210101, 105.50),
-- 		(2,1, 'medi2', 'description2', 20200102, 20220102, 55.00),
-- 		(3,2, 'medi3','description3', 20200201, 20230201, 12.05);    
    
INSERT INTO stocks 
VALUES (1, 'ph_name1', 'med1', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(2, 'ph_name1', 'med2', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(3, 'ph_name1', 'med3', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (4, 'ph_name1', 'med4', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(5, 'ph_name1', 'med5', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(6, 'ph_name1', 'med6', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (7, 'ph_name1', 'med7', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(8, 'ph_name1', 'med8', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(9, 'ph_name1', 'med9', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (10, 'ph_name1', 'med10', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(11, 'ph_name1', 'med11', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(12, 'ph_name2', 'med3', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (13, 'ph_name2', 'med4', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(14, 'ph_name2', 'med5', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(15, 'ph_name2', 'med6', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (16, 'ph_name2', 'med7', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(17, 'ph_name2', 'med8', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(18, 'ph_name2', 'med9', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (19, 'ph_name2', 'med10', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(20, 'ph_name2', 'med12', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(21, 'ph_name2', 'med13', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (22, 'ph_name2', 'med11', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(23, 'ph_name2', 'med12', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(24, 'ph_name2', 'med13', 'description3', 20200201, 20230201, 12.05, 150, 1);


INSERT INTO orders_information 
VALUES (1,1, 'ph_name1', 20200101, 'url1'),
		(2,2, 'ph_name1', 20200101, 'url2'),
		(3,3, 'ph_name2', 20200101, 'url3');


INSERT INTO deliveries 
VALUES (1, 1, 1, '2020-11-14 08:00:00', '2020-11-14 08:40:00', 'picked up'),
		(2, 1, 2, '2020-11-14 09:00:00', '2020-11-14 09:20:00', 'delivered'),
		(3, 3, 3, '2020-11-14 10:00:00', '2020-11-14 11:00:00', 'delivered');
        
-- INSERT INTO order_medicines 
-- VALUES (1,1, 'medi1', 20),
-- 		(2,1, 'medi2', 30),
-- 		(3,3, 'medi3', 12);
        
INSERT INTO order_medicines 
VALUES (1, 'medi1', 20),
		(1, 'medi2', 30),
		(3, 'medi3', 12);
        
