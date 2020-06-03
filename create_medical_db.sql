create database medical_db;
use medical_db;

CREATE TABLE medicines(
	id INT(5) AUTO_INCREMENT,
    dealerId int(5),
	medicine_name VARCHAR(100),
	description text(500),
    mdf_date DATE,
	exp_date DATE,
    unit_price float(6,2),
	PRIMARY KEY(id)
);

CREATE TABLE order_medicines(
	id INT(5) AUTO_INCREMENT,
    orders_informationId int(5),
	medicine_name VARCHAR(100),
    amount int(4),
	PRIMARY KEY(id)
);

CREATE TABLE dealers(
	id INT(5) AUTO_INCREMENT,
	dealer_name VARCHAR(50),
	dealer_nic VARCHAR(10),
	pharmacy_name VARCHAR(20),
	contact_number INT(10),
	pharmacy_address text(100),
	certificate_id TEXT(100),
	PRIMARY KEY(id)
);

-- one dealer has one stock
CREATE TABLE stocks(
	id INT(5) AUTO_INCREMENT,
    dealerId int(5),	
	medicine_name VARCHAR(100),
	description VARCHAR(500),
	stock_qty INT(5),
    available tinyint,
	PRIMARY KEY(dealerId)
);


CREATE TABLE delivery_people(
	id INT(5) AUTO_INCREMENT,
	name VARCHAR(100),
	nic VARCHAR(10),
	PRIMARY KEY(id)
);

CREATE TABLE deliveries(
	id INT(5) AUTO_INCREMENT,
    delivery_peopleId int(5),
	orders_informationId int(5),
	pickup_time time,
	delivered_time time,
	delivery_status enum("not delivered","picked up","delivered"),
	PRIMARY KEY(id)
);

CREATE TABLE customers(
	id INT AUTO_INCREMENT,
	name VARCHAR(50),
	age int(4),
	nic VARCHAR(10),
	contact_no int(10),
	delivery_address text(100),
	PRIMARY KEY(id)
);

CREATE TABLE orders_information(
	id INT AUTO_INCREMENT,
	customerId int(5),
	date date,
	pic_url text(50),
	PRIMARY KEY(id)
);

ALTER TABLE deliveries
ADD FOREIGN KEY (delivery_peopleId) REFERENCES delivery_people(id),
ADD FOREIGN KEY(orders_informationId) REFERENCES orders_information(id);

ALTER TABLE orders_information
ADD FOREIGN KEY (customerId) REFERENCES customers(id);

ALTER TABLE order_medicines
ADD FOREIGN KEY (orders_informationId) REFERENCES orders_information(id);

ALTER TABLE stocks
ADD FOREIGN KEY (dealerId) REFERENCES dealers(id);

ALTER TABLE medicines
ADD FOREIGN KEY (dealerId) REFERENCES dealers(id);

INSERT INTO dealers 
VALUES (1,'dealer1', 'ph1111', 'ph_name1',11100000,'address1','certId1'),
		(2,'dealer2', 'ph2222', 'ph_name2',22200000,'address2','certId2'),
		(3,'dealer3', 'ph3333', 'ph_name3',33300000,'address3','certId3');

INSERT INTO delivery_people 
VALUES (1,'delivary_name1', 'nic1111'),
		(2,'delivary_name2', 'nic2222'),
		(3,'delivary_name3', 'nic3333');  
        
INSERT INTO customers 
VALUES (1,'customer_name1', 58, '11111v', 111122234, 'delivery_address1'),
		(2,'customer_name2', 64, '22222v', 333223445, 'delivery_address2'),
		(3,'customery_name3', 70, '33333v', 556674444, 'delivery_address3');       
        
INSERT INTO medicines 
VALUES (1,1, 'medi1', 'description1', 20200101, 20210101, 105.50),
		(2,1, 'medi2', 'description2', 20200102, 20220102, 55.00),
		(3,2, 'medi3','description3', 20200201, 20230201, 12.05);          
        
INSERT INTO stocks 
VALUES (1, 1, 'med1', 'desc1', 200, 1),
 		(2, 2, 'med2', 'desc2',100, 1),
 		(3, 3, 'med3', 'desc3',150, 1);
        
INSERT INTO orders_information 
VALUES (1,1, 20200101, 'url1'),
		(2,2, 20200101, 'url2'),
		(3,3, 20200101, 'url3');
        
INSERT INTO deliveries 
VALUES (1, 1, 1, 080000, 084000, 'picked up'),
		(2, 1, 2, 090000, 092000, 'delivered'),
		(3, 3, 3, 100000, 110000, 'delivered');
        
INSERT INTO order_medicines 
VALUES (1,1, 'medi1', 20),
		(2,2, 'medi2', 30),
		(3,3, 'medi3', 12);
        

        
