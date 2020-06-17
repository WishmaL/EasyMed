
-- Order medication from the desired pharmacy
-- Since id is auto increment, it is not mentioned here 

-- inserting a data to the orders_information and order_medicines tables 
-- once the customer request for order following table will get new record
INSERT INTO orders_information (customerId, date, pic_url)
VALUES(2, '2020-06-16 12:23:34', '_pic_url');


-- Once customer requested for and order, he can insert the medicines to following table
INSERT INTO order_medicines (orders_informationId, medicine_name, amount)
VALUES(2, 'med1', 10),
(2, 'med2', 12),
(2, 'med3', 30),
(2, 'med4', 20),
(2, 'med5', 10);
                    

-- find the desired pharmacy according to given medicine name
-- ex: Costomer wants to find the medicine named 'med1' available pharmacies
use medical_dbdel;

SELECT d.pharmacy_name AS 'Available pharmacies'
FROM dealers d 
INNER JOIN stocks s ON d.id = s.dealerId
WHERE s.medicine_name = 'med7' AND s.available = 1;

-- get unit prices for desired medicine name from desired dealer
SELECT unit_price
FROM stocks 
WHERE medicine_name='med1' AND dealerId = 1;

-- get unit prices for each ordered medication 

SELECT s.medicine_name, s.unit_price as unitPrice
FROM stocks s, order_medicines o
WHERE s.medicine_name IN (
	SELECT medicine_name
	FROM order_medicines 
	WHERE orders_informationId = 2
)AND o.orders_informationId = 2 AND s.dealerId = 1
GROUP BY  s.medicine_name;

-- get the delivery status

SELECT delivery_status
FROM deliveries
WHERE orders_informationId = 2;

-- CRUD customer

	-- create new profile
	INSERT INTO customers 
		VALUES (NULL,'new_customer','newpass', '55', '653212349v',0886667542,'new_address');
		
	-- read profile(displaying info in the website once logged in)
	SELECT name, age, nic, contact_no, delivery_address
	FROM customers
	WHERE id = 2;

	-- update profile
    UPDATE customers
	SET name = 'updtedName', password = 'updetdPass', age='56', nic='222222222v', contact_no='1234556700', delivery_address='updated_address'
	WHERE id=4; 
    
    -- delete customer
    DELETE FROM customers WHERE id=4;


-- order history based on date
SELECT id, dealer_name, date, pic_url
FROM orders_information
WHERE customerId = 2 AND date='2020-01-01';

-- order history of getting medication on date (customer id assigns automatically once logged in)

SELECT m.medicine_name, m.amount, i.date
FROM order_medicines m
INNER JOIN orders_information i ON i.id = m.orders_informationId
WHERE i.date='2020-01-01' AND i.customerId = 2
GROUP BY m.medicine_name;
    
-- display info about phamacy
SELECT pharmacy_name, contact_number, pharmacy_address, certificate_id
FROM dealers
WHERE pharmacy_name = 'ph_name1';    






