
-- 	THIS IS THE ONE, SHOULD USE TO CREATE THE TABLES AND INSERT DATA

CREATE DATABASE medical_dbdel;
USE medical_dbdel;

-- CREATE TABLE medicines(
-- 	id INT(11) AUTO_INCREMENT,
--     stockId INT(5),
-- 	medicine_name VARCHAR(100),
-- 	description TEXT(500),

-- 	PRIMARY KEY(id)
-- );

CREATE TABLE stocks(
	id INT(5) AUTO_INCREMENT,
    dealerId INT(5),	
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
	dealer_name VARCHAR(50)NOT NULL UNIQUE,
	password VARCHAR(10),
	dealer_nic VARCHAR(10),
	pharmacy_name VARCHAR(20),
	contact_number INT(10),
	pharmacy_address TEXT(100),
	certificate_id TEXT(100),
	PRIMARY KEY(id)
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
    dealer_name VARCHAR(50),
	date DATE,
	pic_url TEXT(50),
	PRIMARY KEY(id)
);

CREATE TABLE order_medicines(
	id INT(11) AUTO_INCREMENT,
    orders_informationId INT(5),
	medicine_name VARCHAR(100),
    amount INT(4),
	PRIMARY KEY(id)
);


ALTER TABLE deliveries
ADD FOREIGN KEY (delivery_peopleId) REFERENCES delivery_people(id),
ADD FOREIGN KEY(orders_informationId) REFERENCES orders_information(id);


ALTER TABLE orders_information
ADD FOREIGN KEY (customerId) REFERENCES customers(id),
ADD FOREIGN KEY (dealer_name) REFERENCES dealers(dealer_name);

ALTER TABLE order_medicines
ADD FOREIGN KEY (orders_informationId) REFERENCES orders_information(id);


ALTER TABLE stocks
ADD FOREIGN KEY (dealerId) REFERENCES dealers(id);

-- ALTER TABLE medicines
-- ADD FOREIGN KEY (stockId) REFERENCES stocks(id);

INSERT INTO dealers 
VALUES (1,'dealer1', 'password1', 'ph1111', 'ph_name1',11100000,'address1','certId1'),
		(2,'dealer2', 'password2', 'ph2222', 'ph_name2',22200000,'address2','certId2'),
		(3,'dealer3', 'password3', 'ph3333', 'ph_name3',33300000,'address3','certId3');

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
VALUES (1, 1, 'med1', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(2, 1, 'med2', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(3, 1, 'med3', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (4, 1, 'med4', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(5, 1, 'med5', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(6, 1, 'med6', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (7, 1, 'med7', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(8, 1, 'med8', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(9, 1, 'med9', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (10, 1, 'med10', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(11, 1, 'med11', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(12, 2, 'med3', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (13, 2, 'med4', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(14, 2, 'med5', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(15, 2, 'med6', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (16, 2, 'med7', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(17, 2, 'med8', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(18, 2, 'med9', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (19, 2, 'med10', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(20, 2, 'med12', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(21, 2, 'med13', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (22, 2, 'med11', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(23, 2, 'med12', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(24, 2, 'med13', 'description3', 20200201, 20230201, 12.05, 150, 1);


INSERT INTO orders_information 
VALUES (1,1, 'dealer1', 20200101, 'url1'),
		(2,2, 'dealer1', 20200101, 'url2'),
		(3,3, 'dealer2', 20200101, 'url3');


INSERT INTO deliveries 
VALUES (1, 1, 1, '2020-11-14 08:00:00', '2020-11-14 08:40:00', 'picked up'),
		(2, 1, 2, '2020-11-14 09:00:00', '2020-11-14 09:20:00', 'delivered'),
		(3, 3, 3, '2020-11-14 10:00:00', '2020-11-14 11:00:00', 'delivered');
        
INSERT INTO order_medicines 
VALUES (1,1, 'medi1', 20),
		(2,1, 'medi2', 30),
		(3,3, 'medi3', 12);
        

        
