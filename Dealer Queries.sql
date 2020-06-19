USE medical_db1;

-- dealers allow to read the data only from 'deliveries' table
-- following is useful for check the status of all deliveries  

 -- ----------------------------------------------------------------------------------------- 
 -- correct 
 -- get the customer information based on each phamacy(each dealer can see their own orders)
SELECT 
c.name, 
c.age,
c.contact_no,
c.delivery_address,
oi.date,
oi.pic_url
FROM
    dealers d
	INNER JOIN orders_information USING(pharmacy_name),
    customers c
	INNER JOIN orders_information oi ON oi.customerId = c.id
WHERE oi.pharmacy_name = 'ph_name1'
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
 	INNER JOIN orders_information USING(pharmacy_name)
WHERE orders_information.pharmacy_name = 'ph_name1';

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
 
-- CRUD dealer_members 
	 -- get login 
	 SELECT name
	 from dealer_members
	 WHERE name = 'dealer_member1' AND password = 'password1';
	 
	 -- get registered
	INSERT INTO dealer_members (nic, pharmacy_name, name, password, certificate_id, contact_number)
	VALUES ('00223334v','ph_name3','dealer_member0', 'password0', 'certId1200', 000022234);
		
	 -- update profile
	UPDATE dealer_members
	SET nic = '00223334v', pharmacy_name = 'ph_name3', name='dealer_member0', password='password0u', certificate_id='certId120u', contact_number='000022230'
	WHERE nic='00223334v'; 
	 
	 -- delete profile
	 DELETE FROM dealer_members WHERE nic = '00223334v';
 
 -- search medicine info based on medicine name
SELECT medicine_name, description, mdf_date, exp_date, unit_price, stock_qty, available
from stocks
WHERE medicine_name = 'med1';

 -- UPDATE THE STOCK TABLE
UPDATE stocks
SET  description = 'updetd_descr', mdf_date='2020-06-19', exp_date='2022-09-19', unit_price='10.00', stock_qty='120', available = 1
WHERE pharmacy_name='ph_name1' and medicine_name = 'med1'; 
 
 -- CREATE NEW MEDICINE (by dealer_name1)
INSERT INTO stocks 
VALUES (NULL, 'ph_name1', 'med111', 'description111', 20200101, 20210101, 105.50, 200, 1);

 