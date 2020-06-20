USE medical_database;

# Customers table
# Attributes: id(PK), name, password, age, nic, contact_no, delivery_address
# Customers are only searched using the id Therefore the automatically created PRIMARY KEY INDEX is used.



# Dealers table
# Attributes: id, pharmacy_name, contact_no, pharmacy_address, certificate_id
# Dealers are searched using the id, pharmacy_name.
CREATE INDEX pharmacy_name_index ON Dealers(pharmacy_name);

# Deliveries table
# Attributes: id, delivery_peopleId, orders_informationId, pickup_time, delivered_time, delivery_status
# Deliveries are searched using the id, delivery_peopleId and orders_informationId.
CREATE INDEX delivery_peopleId_index ON Deliveries(delivery_peopleId);
CREATE INDEX orders_informationId_index ON Deliveries(orders_informationId);

# Delivery_people table
# Attributes: id, name, nic
# Delivery_people are only searched using the id Therefore the automatically created PRIMARY KEY INDEX is used.

# Order_information
# Attributes: id, customer_id, pharmacy_name, date, pic_url
# Order_information is searched using the customer_id, pharmacy_name.
CREATE INDEX customer_id_index ON orders_information(customerId);
CREATE INDEX pharmacy_name_index ON orders_information(pharmacy_name);

# Order_medicines
# Attributes: orders_informationId, medicine_name, amount
# Order_information is searched using the orders_informationId, medicine_name.
CREATE INDEX composite_index ON order_medicines(orders_informationId, medicine_name);


# Stocks table
# Attributes: id, dealerId, pharmacy_name, medicine_name, description, mdf_date, exp_date, unit_price, stock_qty, available
# Stocks are searched using the pharmacy_name.
CREATE INDEX pharmacy_name_index ON stocks(pharmacy_name);