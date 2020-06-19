
 -- following is useful for check the status of the delivery   
SELECT 
    orderNumber, 
    status
FROM
    orders
ORDER BY 
    FIELD(status,
        'In Process',
        'On Hold',
        'Cancelled',
        'Resolved',
        'Disputed',
        'Shipped');




        
-- THE STORE-PROCEDURE FOR INSERT VALUES TO TWO TABLES CONCURENTLY, BUT ONE VALUE PER EACH

CREATE PROCEDURE `orders_informationProcedure`(

IN _customerId int(5),
IN _date date,
IN _pic_url text(50),

-- IN _orders_informationId INT(11),
IN _orders_informationId VARCHAR(100),
IN _orders_informationId INT(4)

)
BEGIN

declare _orders_informationId int unsigned default 0;
	
		insert into orders_information (customerId, date, pic_url)
		values(_customerId, _date, _pic_url); 
	
		set _orders_informationId = last_insert_id();
        INSERT INTO order_medicines (orders_informationId, medicine_name, amount)
		VALUES(_orders_informationId, _medicine_name, _amount);    
	
    select _id as'id';
END



-- THE STORE PROCEDURE 