USE medical_db1;

-- not needed
--  -- following is useful for check the status of the delivery   
-- SELECT 
--     orderNumber, 
--     status
-- FROM
--     orders
-- ORDER BY 
--     FIELD(status,
--         'In Process',
--         'On Hold',
--         'Cancelled',
--         'Resolved',
--         'Disputed',
--         'Shipped');


-- UPDATE THE DELIVERIES TABLE

UPDATE deliveries
SET  pickup_time = '2020-11-14 08:00:00', delivered_time = '2020-11-14 08:40:00', delivery_status = 'delivered' 
WHERE delivery_peopleId=1 and orders_informationId = 1; 

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
 
 -- UPTO THIS STAGE THE QUERIES ARE DONE
 
 
-- Get the price that should be collected from the customers
-- not completed yet


-- SELECT s.medicine_name, s.unit_price as unitPrice, s.unit_price*o.amount as total
-- FROM stocks s, order_medicines o
-- WHERE s.medicine_name IN (
-- 	SELECT medicine_name
-- 	FROM order_medicines 
-- 	WHERE orders_informationId = 2
-- )AND o.amount IN(
-- 	SELECT amount
-- 	FROM order_medicines 
-- 	WHERE orders_informationId = 2
-- )
-- AND o.orders_informationId = 2 AND s.dealerId = 1
-- GROUP BY  s.dealerId = 1;



-- get the unit price
-- SELECT unit_price
-- FROM stocks 
-- WHERE dealerId = 1 and medicine_name in (
-- 	select medicine_name
--     from order_medicines
--     where orders_informationId = 2
-- );

-- -- get the amount
-- select amount
-- from order_medicines
-- where orders_informationId = 2;

 
 
 
 
 
 
select 
	oi.id,
	oi.customerId,
	om.medicine_name,
	om.amount,
	s.unit_price,
	s.unit_price*om.amount as 'Price for each medicine'
-- SUM(s.unit_price*om.amount) as 'total'
-- total) as net
from 
	stocks s,
	orders_information oi
	inner join order_medicines om on om.orders_informationId = oi.id
where om.orders_informationId = 2 and s.medicine_name in (
	select medicine_name
	from order_medicines
	where orders_informationId = 2
);
--  group by om.medicine_name;
 
 select 
	oi.id,
    oi.customerId,
    om.medicine_name,
    om.amount,
    s.unit_price,
    s.unit_price*om.amount as 'Price for each medicine'
	-- SUM(s.unit_price*om.amount) as 'total'
    -- total) as net
from 
	orders_information oi
	inner join order_medicines om on om.orders_informationId = oi.id,
    stocks s
    inner join order_medicines om1 on om1.medicine_name = s.medicine_name
    
    -- group by om1.medicine_name
where om.orders_informationId = 2 and s.medicine_name in (
	select medicine_name
    from order_medicines
    where orders_informationId = 2
);
-- group by s.unit_price, mo1.amount;