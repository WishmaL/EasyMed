-- Additional data for delivery_people
use medical_dbdel;

INSERT INTO delivery_people(name, nic) 
	VALUES ('user4', 'nic2124'),
    ('user5', 'nic2125'),
    ('user6', 'nic2126'),
    ('user7', 'nic2127'),
    ('user8', 'nic2128');

-- Additional data for orders_information    
INSERT INTO orders_information(customerId, date, pic_url) 
	VALUES (3,'2020-01-01', 'url4'),
    (1,'2020-02-01', 'url5'),
    (2,'2020-02-01', 'url6'),
    (2,'2020-03-11', 'url7'),
    (3,'2020-03-21', 'url8'),
    (1,'2020-04-01', 'url9'),
    (2,'2020-04-03', 'url10');

-- Additional data for deliveries    
INSERT INTO deliveries (delivery_peopleId, orders_informationId, pickup_time, delivered_time, delivery_status)
	VALUES (1,3, '2020-06-05 14:29:36', '', 'not delivered'),
			(2,3, '2020-06-05 11:29:36', '', 'picked up'),
			(1,3, '2020-06-05 14:29:26', '', 'picked up'),
			(3,3, '2020-03-05 14:29:36', '2020-03-06 14:29:36', 'delivered'),
            (2,3, '2020-03-15 14:29:36', '2020-06-17 14:29:36', 'delivered'),
            (2,3, '2020-06-05 12:29:36', '', 'not delivered'),
            (5,3, '2020-06-05 14:29:36', '2020-06-05 14:29:36', 'delivered'),
            (3,3, '2020-06-05 14:19:36', '2020-06-05 14:29:36', 'delivered'),
            (4,3, '2020-06-05 14:29:30', '', 'picked up'),
            (5,3, '2020-06-05 08:29:36', '', 'not delivered'),
			(4,3, '2020-06-05 13:29:36', '', 'not delivered'),
            (3,3, '2020-06-05 14:30:11', '', 'picked up'),
            (5,3, '2020-06-05 16:29:36', '', 'picked up');