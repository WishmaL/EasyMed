
-- 	THIS IS THE ONE, SHOULD USE TO CREATE THE TABLES AND INSERT DATA
-- Create the 'medical_database'
CREATE DATABASE medical_database;
USE medical_database;

CREATE TABLE stocks(
	id INT(5) AUTO_INCREMENT,	
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


CREATE TABLE order_medicines(
    orders_informationId INT(5),
	medicine_name VARCHAR(100),
    amount INT(4),
	PRIMARY KEY(orders_informationId, medicine_name)
);

-- Following queries will add foreign keys to relavant tables

ALTER TABLE deliveries
ADD FOREIGN KEY (delivery_peopleId) REFERENCES delivery_people(id)
ON DELETE CASCADE,
ADD FOREIGN KEY(orders_informationId) REFERENCES orders_information(id)
ON DELETE CASCADE;

ALTER TABLE orders_information
ADD FOREIGN KEY (customerId) REFERENCES customers(id)
ON DELETE CASCADE,
ADD FOREIGN KEY (pharmacy_name) REFERENCES dealers(pharmacy_name)
ON DELETE CASCADE;

ALTER TABLE order_medicines
ADD FOREIGN KEY (orders_informationId) REFERENCES orders_information(id)
ON DELETE CASCADE;

ALTER TABLE stocks
ADD FOREIGN KEY (pharmacy_name) REFERENCES dealers(pharmacy_name)
ON DELETE CASCADE;

ALTER TABLE dealer_members
ADD FOREIGN KEY (pharmacy_name) REFERENCES dealers(pharmacy_name)
ON DELETE CASCADE;

