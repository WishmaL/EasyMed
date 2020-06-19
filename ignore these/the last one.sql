use medical_dbdel; 
 
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

where om.orders_informationId = 2 and s.medicine_name in (
	select medicine_name
    from order_medicines
    where orders_informationId = 2
    group by medicine_name
);
-- group by s.unit_price;