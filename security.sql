-- Security has to be done as follows
-- -------------------------------------------

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
    
    
    