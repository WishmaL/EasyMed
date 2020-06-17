-- dealers allow to read the data only from 'deliveries' table
-- following is useful for check the status of all deliveries  
 
 -- ----------------------------------------------------------------------------------------- 
 -- correct 
 -- get the customer information based on EACH DEALER(each dealer can see their own orders)
SELECT 
c.name, 
c.age,
c.contact_no,
c.delivery_address,
oi.date,
oi.pic_url
FROM
    dealers d
	INNER JOIN orders_information USING(dealer_name),
    customers c
	INNER JOIN orders_information oi ON oi.customerId = c.id
WHERE oi.dealer_name = 'dealer1'
GROUP BY oi.pic_url
ORDER BY oi.date DESC; 
  
 -- /correct
 
 
 -- -----------------------------------------------------------------------------------------
 -- FOLLOWING RESULTS THE ORDER INFO DETAILS OF EACH DEALER
   -- correct 
SELECT 
 	orders_information.customerId,
 	orders_information.date,
 	orders_information.pic_url
FROM
     dealers d
 	INNER JOIN orders_information USING(dealer_name)
WHERE orders_information.dealer_name = 'dealer1';

    -- /correct
 -- ----------------------------------------------------------------------------------------- 
 
 
 -- -----------------------------------------------------------------------------------------
 -- FOLLOWING SHOWS THE DELIVERY STATUS OF THE ORDER
 -- correct
SELECT 
     orders_informationId, 
    delivery_status
FROM
    deliveries
ORDER BY 
   FIELD(delivery_status,
        'not delivered',
		'picked up',
        'delivered');

   -- /correct      
   
  -- -----------------------------------------------------------------------------------------  
        
  -- FOLLOWING SHOWS THE INFO OF RECORDS OF 'DELIVERD' STATUS       
   -- correct      
-- GET INFO BASED ON EACH CATEGORY
-- DELIVERED
SELECT 
    orders_informationId, 
    delivery_status
FROM
     deliveries
     
ORDER BY 
		FIELD(delivery_status,
        'delivered');        
        -- same goes with other status...
 -- /correct

 -- -----------------------------------------------------------------------------------------  
        
  -- FOLLOWING SHOWS THE CUSTOMER AND DELIVERY INFO OF RECORDS OF PARTICULAR CUSTOMER
 -- correct
-- GET DELIVERY STATUS OF A PARTICULAR CUSTOMER
SELECT 
	d.delivery_status, 
	c.name,
	c.contact_no,
	c.delivery_address,
	oi.date
FROM
	deliveries d
	INNER JOIN orders_information ON orders_information.id = d.orders_informationId,
	customers c
	INNER JOIN orders_information oi ON oi.customerId = c.id
WHERE c.name = 'customery_name3'
GROUP BY oi.date;

 -- /correct
 
 
 -- get login 
 SELECT dealer_name
 from dealers
 WHERE dealer_name = 'dealer1' AND password = 'password1';
 
 -- get registered
INSERT INTO dealers (dealer_name, password, dealer_nic, pharmacy_name, contact_number, pharmacy_address, certificate_id)
VALUES ('dealer1', 'password1', 'ph1111', 'ph_name1',11100000,'address1','certId1');
    
 -- update profile
UPDATE dealers
SET name = 'updtedName', password = 'updetdPass', age='56', nic='222222222v', contact_no='1234556700', delivery_address='updated_address'
WHERE id=4; 
 
 -- delete profile
 DELETE FROM dealers WHERE id=4;
 
 -- search medicine info based on medicine name
SELECT medicine_name, description, mdf_date, exp_date, unit_price, stock_qty, available
from stocks
WHERE medicine_name = 'med1';

 -- UPDATE THE STOCK TABLE
UPDATE stocks
SET  description = 'updetd_descr', mdf_date='2020-06-19', exp_date='2022-09-19', unit_price='10.00', stock_qty='120', available = 1
WHERE dealerId=1 and medicine_name = 'med1'; 
 
 -- CREATE NEW MEDICINE (by dealer_name1)
INSERT INTO stocks 
VALUES (NULL, 1, 'med111', 'description111', 20200101, 20210101, 105.50, 200, 1);

 