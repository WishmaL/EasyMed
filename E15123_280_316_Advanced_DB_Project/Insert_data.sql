USE medical_database;


INSERT INTO dealers 
VALUES (1, 'ph_name1',11100000,'address1','certId1'),
		(2, 'ph_name2',22200000,'address2','certId2'),
		(3, 'ph_name3',33300000,'address3','certId3');


INSERT INTO dealer_members 
VALUES ('11223334v','ph_name1','dealer_member1', 'password1', 'certId1223', 111122234),
		('22223334v','ph_name1','dealer_member2', 'password2', 'certId1222', 222222234),
		('33223334v','ph_name1','dealer_member3', 'password3', 'certId1224', 333322234),
        ('44223334v','ph_name2','dealer_member4', 'password4', 'certId1225', 444422234),
		('55223334v','ph_name2','dealer_member5', 'password5', 'certId1226', 555522234),
		('66223334v','ph_name2','dealer_member6', 'password6', 'certId1227', 666622234),
        ('77223334v','ph_name3','dealer_member7', 'password7', 'certId1228', 777722234),
		('88223334v','ph_name3','dealer_member8', 'password8', 'certId1229', 888822234),
		('99223334v','ph_name3','dealer_member9', 'password9', 'certId1220', 999922234);


INSERT INTO delivery_people 
VALUES (1,'delivary_name1', 'nic1111'),
		(2,'delivary_name2', 'nic2222'),
		(3,'delivary_name3', 'nic3333');  
        
INSERT INTO customers 
VALUES (1,'customer_name1', 'password1', 58, '11111v', 111122234, 'delivery_address1'),
		(2,'customer_name2', 'password1', 64, '22222v', 333223445, 'delivery_address2'),
		(3,'customery_name3', 'password1', 70, '33333v', 556674444, 'delivery_address3');       
    
    
INSERT INTO stocks 
VALUES (1, 'ph_name1', 'med1', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(2, 'ph_name1', 'med2', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(3, 'ph_name1', 'med3', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (4, 'ph_name1', 'med4', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(5, 'ph_name1', 'med5', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(6, 'ph_name1', 'med6', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (7, 'ph_name1', 'med7', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(8, 'ph_name1', 'med8', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(9, 'ph_name1', 'med9', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (10, 'ph_name1', 'med10', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(11, 'ph_name1', 'med11', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(12, 'ph_name2', 'med3', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (13, 'ph_name2', 'med4', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(14, 'ph_name2', 'med5', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(15, 'ph_name2', 'med6', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (16, 'ph_name2', 'med7', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(17, 'ph_name2', 'med8', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(18, 'ph_name2', 'med9', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (19, 'ph_name2', 'med10', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(20, 'ph_name2', 'med12', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(21, 'ph_name2', 'med13', 'description3', 20200201, 20230201, 12.05, 150, 1),
        (22, 'ph_name2', 'med11', 'description1', 20200101, 20210101, 105.50, 200, 1),
 		(23, 'ph_name2', 'med12', 'description2', 20200102, 20220102, 55.00, 100, 1),
 		(24, 'ph_name2', 'med13', 'description3', 20200201, 20230201, 12.05, 150, 1);


INSERT INTO orders_information 
VALUES (1,1, 'ph_name1', 20200101, 'url1'),
		(2,2, 'ph_name1', 20200101, 'url2'),
		(3,3, 'ph_name2', 20200101, 'url3');


INSERT INTO deliveries 
VALUES (1, 1, 1, '2020-11-14 08:00:00', '2020-11-14 08:40:00', 'picked up'),
		(2, 1, 2, '2020-11-14 09:00:00', '2020-11-14 09:20:00', 'delivered'),
		(3, 3, 3, '2020-11-14 10:00:00', '2020-11-14 11:00:00', 'delivered');
        
        
INSERT INTO order_medicines 
VALUES (1, 'medi1', 20),
		(1, 'medi2', 30),
		(3, 'medi3', 12);
        

INSERT INTO delivery_people(name, nic) 
	VALUES ('user4', 'nic2124'),
    ('user5', 'nic2125'),
    ('user6', 'nic2126'),
    ('user7', 'nic2127'),
    ('user8', 'nic2128');

-- Additional data for orders_information    
INSERT INTO orders_information(customerId, pharmacy_name, date, pic_url) 
	VALUES (3, 'ph_name1', '2020-01-01', 'url4'),
    (1, 'ph_name3', '2020-02-01', 'url5'),
    (2, 'ph_name1', '2020-02-01', 'url6'),
    (2, 'ph_name2', '2020-03-11', 'url7'),
    (3, 'ph_name2', '2020-03-21', 'url8'),
    (1, 'ph_name1', '2020-04-01', 'url9'),
    (2, 'ph_name3', '2020-04-03', 'url10');
    
INSERT INTO order_medicines (orders_informationId, medicine_name, amount)
	VALUES(2, 'med1', 10),
	(2, 'med2', 12),
	(2, 'med3', 30),
	(2, 'med4', 20),
	(2, 'med5', 10);

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