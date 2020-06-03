var express = require('express');
var router = express.Router();
var db = require('../database/db');
const uuid = require('uuid');

// IMPORTANT ADD CONNECTION SCAPE TO IGNORE SQL INJECTIONS

//   fetch data
router.get('/getDeliveries', (req, res) => {
  let sql = 'SELECT * FROM deliveries';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send(results);
  });
});

// ///////////////////////////////////////////
//   fetch specific user
router.get('/getDelivery', (req, res) => {
  let sql = `SELECT * FROM deliveries WHERE id = ?`;
  let param = [req.body.id]
  let query = db.query(sql, param, (err, results) => {
    if (err) console.log('The error is ....>>', err);
    console.log(results);
    res.send(results);
  });
});

//   fetch specific user
// router.get('/getUser', (req, res) => {
//   let sql = `SELECT * FROM users WHERE id = ${req.body.id}`;
//   let query = db.query(sql, (err, results) => {
//     if (err) throw err;
//     console.log(results);
//     res.send(results);
//   });
// });

// ///////////////////////////////////////////
// insert a user
router.post('/newDelivery', (req, res) => {
  const newDealer = [
    // req.body.id,
    // uuid.v4(),
    'default',
    req.body.delivery_peopleId,
    req.body.orders_informationId,
    req.body.pickup_time,
    req.body.delivered_time,
    req.body.delivery_status
  ];

  let sql = `SET @id = ?; SET @delivery_peopleId = ?; SET @orders_informationId = ?; SET @pickup_time = ?; SET @delivered_time = ?; SET @delivery_status = ?;  CALL deliveriesProcedure(@id, @delivery_peopleId, @orders_informationId, @pickup_time, @delivered_time, @delivery_status)`;
  let query = db.query(
    sql,
    [newDealer[0], newDealer[1], newDealer[2], newDealer[3], newDealer[4], newDealer[5]],
    (err, results) => {
      if (err) throw err;

      results.forEach((element) => {
        if (element.constructor == Array) {
            // msg is a procedure's part
          var msg = element[0].msg;
          res.send('Inserted element id : ' + msg);
          console.log(element[0]);
        }
      });
    }
  );
});

// ////////////////////////////////////////////
// update a user
router.put('/updateDelivery', (req, res, next) => {
  const update_customer = [
    req.body.delivery_peopleId,
    req.body.orders_informationId,
    req.body.pickup_time,
    req.body.delivered_time,
    req.body.delivery_status,
    req.body.id
  ];

  
  let sql = `UPDATE customers SET name = ?, age = ?, nic =?, contact_no = ?, delivery_address = ? WHERE id = ?`;


  let query = db.query(sql, update_customer, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.json(results);
  });
});

// ///////////////////////////////////////////
// Delete a user
router.delete('/deleteDelivery', (req, res) => {
  const deleteCustomer = [req.body.id];

  let sql = `DELETE FROM deliveries WHERE id = ?`;
  let query = db.query(sql, deleteCustomer[0], (err, results) => {
    if (err) throw err;
    console.log('deleted');
    res.send('successfully deleted!');
  });
});

module.exports = router;
