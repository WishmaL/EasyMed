
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

select d.pharmacy_name as 'Available pharmacies'
from dealers d 
inner join stocks s on d.id = s.dealerId
where s.medicine_name = 'med7' AND s.available = 1;

-- get unit prices for desired medicine name from desired dealer
select unit_price
from stocks 
where medicine_name='med1' and dealerId = 1;

-- get unit prices for each ordered medication 

select s.medicine_name, s.unit_price as unitPrice
from stocks s, order_medicines o
where s.medicine_name in (
	select medicine_name
	from order_medicines 
	where orders_informationId = 2
)AND o.orders_informationId = 2 AND s.dealerId = 1
group by  s.medicine_name;

-- get the delivery status

select delivery_status
from deliveries
where orders_informationId = 2;

-- CRUD customer

	-- create new profile
	INSERT INTO customers 
		VALUES (NULL,'new_customer','newpass', '55', '653212349v',0886667542,'new_address');
		
	-- read profile(displaying info in the website once logged in)
	select name, age, nic, contact_no, delivery_address
	from customers
	where id = 2;

	-- update profile
    UPDATE customers
	SET name = 'updtedName', password = 'updetdPass', age='56', nic='222222222v', contact_no='1234556700', delivery_address='updated_address'
	WHERE id=4; 
    
    -- delete customer
    DELETE FROM customers WHERE id=4;


-- order history based on date
select id, dealer_name, date, pic_url
from orders_information
where customerId = 2 and date='2020-01-01';

-- order history of getting medication on date (customer id assigns automatically once logged in)

select m.medicine_name, m.amount, i.date
from order_medicines m
inner join orders_information i on i.id = m.orders_informationId
where i.date='2020-01-01' and i.customerId = 2
group by m.medicine_name;
    
    






