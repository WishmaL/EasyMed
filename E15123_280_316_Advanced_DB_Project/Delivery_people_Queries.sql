USE medical_database;

-- ----------------------------------------------------------------------------------------- 
-- UPDATE THE DELIVERIES TABLE

UPDATE deliveries
SET  pickup_time = '2020-11-14 08:00:00', delivered_time = '2020-11-14 08:40:00', delivery_status = 'delivered' 
WHERE delivery_peopleId=1 and orders_informationId = 1; 


-- ----------------------------------------------------------------------------------------- 
-- GET CUSTOMER INFO
-- DELIVERY_PEOPLE HAS ACCESS TO order_information table and customers

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
-- get the unit price
 SELECT unit_price
 FROM stocks 
 WHERE pharmacy_name = 'ph_name1' and medicine_name in (
 	select medicine_name
    from order_medicines
    where orders_informationId = 2
 );

-- ----------------------------------------------------------------------------------------- 
 -- get the amount
 select amount
 from order_medicines
 where orders_informationId = 2;

-- ----------------------------------------------------------------------------------------- 

-- Note: The total price can be calculated in the front-end



-- Shows the information by combining customer details and stock details

select 
	oi.id,
    oi.customerId,
    om.medicine_name,
    om.amount,
    s.unit_price*om.amount as 'Price for each medicine'
	
from 
	orders_information oi
	inner join order_medicines om on om.orders_informationId = oi.id,
    stocks s
    inner join order_medicines om1 on om1.medicine_name = s.medicine_name
    
    
where om.orders_informationId = 2 and s.medicine_name in (
	select medicine_name
    from order_medicines
    where orders_informationId = 2
)
group by om.medicine_name;
