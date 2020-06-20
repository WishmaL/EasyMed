USE medical_database;

-- dealers allow to read the data only from 'deliveries' table
-- following is useful for check the status of all deliveries  

 -- -----------------------------------------------------------------------------------------  
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
  

 -- -----------------------------------------------------------------------------------------
 -- FOLLOWING RESULTS THE ORDER INFO DETAILS OF EACH DEALER
 
SELECT 
 	orders_information.customerId,
 	orders_information.date,
 	orders_information.pic_url
FROM
     dealers d
 	INNER JOIN orders_information USING(pharmacy_name)
WHERE orders_information.pharmacy_name = 'ph_name1';

 -- ----------------------------------------------------------------------------------------- 
 
 
 
 -- -----------------------------------------------------------------------------------------
 
 
 -- INSERT DATA TO THE DELIVERIES TABLE
 
  call deliveriesProcedure(0, 3, 5, '2020-02-02 10:10:10','', 'picked up');  
 
 -- UPDATE DATA OF THE DELIVERIES TABLE
  call deliveriesProcedure(18, 3, 5, '2020-02-02 10:10:10','2020-02-02 12:30:10', 'delivered');  	
 
 -- FOLLOWING WILL DELETE A DELIVERY FROM deliveries TABLE WHICH HAVE BEEN COMPLETED(i.e. id = 4)
 -- THE PROCESS OF FINDING THE ID VALUE CAN BE IBTAIN IN FRONT-END
 
	DELETE FROM deliveries
	WHERE delivery_status = 'delivered' and id = 18;


 
 -- -----------------------------------------------------------------------------------------
 -- FOLLOWING SHOWS THE DELIVERY STATUS OF THE ORDER

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

  -- -----------------------------------------------------------------------------------------  
        
  -- FOLLOWING SHOWS THE INFO OF RECORDS OF 'DELIVERD' STATUS       
    
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
       
-- SAME QUERY PATTERN GOES WITH OTHER STATUS TYPES...

 -- -----------------------------------------------------------------------------------------  
        
-- FOLLOWING SHOWS THE CUSTOMER AND DELIVERY INFO OF RECORDS OF PARTICULAR CUSTOMER
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

 -- ----------------------------------------------------------------------------------------- 
-- CRUD dealer_members 
	 -- get login 
	 SELECT name
	 from dealer_members
	 WHERE name = 'dealer_member1' AND password = 'password1';
	 
	 -- get registered
	 -- First argument decide this is update or delete
	 call dealer_membersProcedure(1, '1111111', 'ph_name1', 'dealer_memberNew', 'passnew', 'certId1223', 111122234);  
        
        
	 -- update profile
	 -- First argument decide this is update or delete
     call dealer_membersProcedure(0,'1111111', 'ph_name1', 'dealer_memberup', 'passnew', 'certId1223', 111122234);  
     
     
	 -- delete profile
	 DELETE FROM dealer_members WHERE nic = '1111111';
 
 -- ----------------------------------------------------------------------------------------- 
 -- search medicine info based on medicine name
SELECT medicine_name, description, mdf_date, exp_date, unit_price, stock_qty, available
from stocks
WHERE medicine_name = 'med1';

-- ----------------------------------------------------------------------------------------- 
 -- UPDATE THE STOCK TABLE
UPDATE stocks
SET  description = 'updetd_descr', mdf_date='2020-06-19', exp_date='2022-09-19', unit_price='10.00', stock_qty='120', available = 1
WHERE pharmacy_name='ph_name1' and medicine_name = 'med1'; 
 
 -- ----------------------------------------------------------------------------------------- 
 -- CREATE NEW MEDICINE (by dealer_name1)
INSERT INTO stocks 
VALUES (NULL, 'ph_name1', 'med111', 'description111', 20200101, 20210101, 105.50, 200, 1);

 