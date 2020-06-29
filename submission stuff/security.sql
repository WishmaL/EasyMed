-- Security has to be done as follows
-- -------------------------------------------

/*
There are 4 user defined database roles from in the backend. Their jobs are as follows

admin_dealer: Handle delear related table. admin_dealer sas full access to the stocks table. He can read and update Dealers, Dealer_members table.
The reason for that is inorder to delete or insert new dealer or dealer memeber a higher level of access is required.

admin_customer: admin_customer can read, update customers table

admin_delivery: admin_delivery can read, update delivery_people table

admin_orders: Responsible for read, write, delete, insert orders and manage delevieris.

*/

CREATE USER 'admin_dealer'@'localhost' IDENTIFIED BY '123';
ALTER USER 'admin_dealer'@'localhost' IDENTIFIED BY '123';

CREATE USER 'admin_customer'@'localhost' IDENTIFIED BY '123';
ALTER USER 'admin_customer'@'localhost' IDENTIFIED BY '123';

CREATE USER 'admin_delivery'@'localhost' IDENTIFIED BY '123';
ALTER USER 'admin_delivery'@'localhost' IDENTIFIED BY '123';

CREATE USER 'admin_orders'@'localhost' IDENTIFIED BY '123';
ALTER USER 'admin_orders'@'localhost' IDENTIFIED BY '123';


GRANT ALL ON 
medical_db1.stocks TO 'admin_dealer'@'localhost';

GRANT SELECT, UPDATE ON
medical_db1.dealer_members TO 'admin_dealer'@'localhost';

GRANT SELECT, UPDATE ON
medical_db1.dealers TO 'admin_dealer'@'localhost';

GRANT SELECT, UPDATE ON
medical_db1.customers TO 'admin_customer'@'localhost';

GRANT SELECT, UPDATE ON 
medical_db1.delivery_people TO 'admin_delivery'@'localhost';

GRANT ALL ON 
medical_db1.deliveries TO 'admin_orders'@'localhost';

GRANT ALL ON 
medical_db1.order_information TO 'admin_orders'@'localhost';

GRANT ALL ON 
medical_db1.order_medicines TO 'admin_orders'@'localhost';



-- According to dealer_members perspective
	-- dealers has 
		-- full access to dealers table, stocks table.(they can be CRUD(=Create,Read,...etc))
        -- can CRUD deliveries

	-- delivery_people can't 
		-- access 'stocks' table
		-- access 'dealer_members' table
		-- but can read dealers table(edit/update/delete can't be done)

	-- customers can't
		-- edit/update/delete 'dealers' table but can be read
        -- edit/update/delete 'stocks' table but can be read
	  
-- According to customers perspective
	-- customers can 
		-- CRUD 'customers', 'order_information', 'order_medicines' tables
        -- can read 'deliveries'(edit/update/delete can't be done)
	
	-- delivery_people can't 
		-- edit/update/delete 'customers', 'order_information', 'order_medicines' tables
		-- but can read 'customers', 'order_information', 'order_medicines' tables
		
	-- dealer_members can't 
		-- edit/update/delete 'customers', 'order_information', 'order_medicines' tables
		-- but can read 'customers', 'order_information', 'order_medicines' tables
        
-- According to 'delivery_peoples' perspective
	-- 'delivery_peoples' can 
		-- CRUD 'delivery_peoples', 'deliveries', 'order_medicines' tables
        -- can read and update 'deliveries'
    
    -- customers 
		-- can't access edit/update/delete 'delivery_people' table, can be read
        
    -- dealers 
		-- can't access edit/update/delete 'delivery_people' table, can be read
    
    
    