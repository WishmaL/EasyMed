USE medical_db0;

-- Customer Store Procedure
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `customerProcedure`(
IN _id int(11),
in _name varchar(50),
in _password varchar(45),
in _age int(4),
in _nic varchar(10),
in _contact_no int(10),
in _delivery_address text
)
BEGIN
	if _id = 0 then
			insert into customers(id, name, password, age, nic, contact_no, delivery_address)
			values(_id, _name, _password, _age, _nic, _contact_no, _delivery_address); 
            
            set _id = last_insert_id();
            
	else
			UPDATE customers
            set
            name = _name,
            password = _password,
            age = _age,
            nic = _nic,
            contact_no = _contact_no,
            delivery_address = _delivery_address
            where id = _id;
	end if;
    select _name as'name';
END//
DELIMITER ;

-- dealer_members Store Procedure
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `dealer_membersProcedure`(
in _isinsert int(1),
IN _nic int(5),
in _pharmacy_name varchar(20),
in _name varchar(50), 
in _password varchar(10),
in _certificate_id text, 
in _contact_number int(10)
)
BEGIN
	if _isinsert = 1 then
				insert into dealer_members (nic, pharmacy_name, name, password, certificate_id, contact_number)
				values(_nic, _pharmacy_name, _name, _password, _certificate_id, _contact_number);   
			
				-- set _id = last_insert_id();
            
	else
			UPDATE dealer_members
            set
            -- pharmacy_name = _pharmacy_name,
            name = _name,
            password = _password,
            certificate_id = _certificate_id,
            contact_number = _contact_number
            where nic = _nic and pharmacy_name = _pharmacy_name;
	end if;
    select _nic as'NIC', _name as 'name', _pharmacy_name as 'pharmacy', _contact_number as 'contact number', _certificate_id as 'certificate Id' ;
END//
DELIMITER ;
-- order_medicines Store Procedure
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `orderMedicines`(
  IN _customerId         int(5),
  IN _pharmacy_name      VARCHAR(20),
  IN _date         		 date,
  IN _pic_url         	 text(50),
  IN _medi_list          TEXT
)
BEGIN
    DECLARE strLen    INT DEFAULT 0;
    DECLARE SubStrLen INT DEFAULT 0;
    DECLARE newId int DEFAULT 0;
     DECLARE EXIT HANDLER FOR SQLEXCEPTION
     BEGIN
       ROLLBACK;
     END;
    START TRANSACTION;

    INSERT INTO orders_information (
		
      customerId,
      pharmacy_name,
      date,
      pic_url
     
    )
    VALUES (
      _customerId, 
      _pharmacy_name,
      _date,
      _pic_url
    ); 

	
	SET newId = last_insert_id();
    do_this:
      LOOP
        SET strLen = CHAR_LENGTH(_medi_list);

        INSERT INTO order_medicines (orders_informationId, medicine_name, amount) VALUES(newId,SUBSTRING_INDEX(_medi_list, ',', 1));

        SET SubStrLen = CHAR_LENGTH(SUBSTRING_INDEX(_medi_list, ',', 1))+2;
        SET _medi_list = MID(_medi_list, SubStrLen, strLen); -- cut the 1st list item out

        IF _medi_list = '' THEN
          LEAVE do_this;
        END IF;
      END LOOP do_this;

    COMMIT;
  END//
DELIMITER ;



