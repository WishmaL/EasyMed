const express = require('express');
const bodyParser = require('body-parser');
var db = require('./database/db');
const port = process.env.PORT || 5000;
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

db.connect((err) => {
  if (err) {
    throw err;
  } else {
    console.log('Mysql connected......');
  }
});

var Dealers = require('./routes/Dealers.js')
app.use('/dealers',Dealers)

var Customers = require('./routes/Customers.js')
app.use('/customers',Customers)

var Deliveries = require('./routes/Deliveries.js')
app.use('/deliveries',Deliveries)

var Delivery_people = require('./routes/Delivery_people.js')
app.use('/delivery_people',Delivery_people) 

var Medicines = require('./routes/Medicines.js')
app.use('/medicines',Medicines)

var Order_medicines = require('./routes/Order_medicines.js')
app.use('/order_medicines',Order_medicines)

var Orders_Information = require('./routes/Orders_Information.js')
app.use('/orders_information',Orders_Information)

var Stocks = require('./routes/Stocks.js')
app.use('/stocks',Stocks)

app.listen(port, () => {
  console.log('Server is running on port', port);
});

module.exports = app;
