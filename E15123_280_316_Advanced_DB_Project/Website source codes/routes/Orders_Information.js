var express = require('express');
var router = express.Router();
var db = require('../database/db');
const uuid = require('uuid');

// IMPORTANT ADD CONNECTION SCAPE TO IGNORE SQL INJECTIONS

//   fetch data
router.get('/getOrdersInfo', (req, res) => {
  let sql = 'SELECT * FROM orders_information';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send(results);
  });
});

// ///////////////////////////////////////////
//   fetch specific user
router.get('/getOrdersInfo_1', (req, res) => {
  let sql = `SELECT * FROM orders_information WHERE id = ?`;
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
router.post('/newOrdersInfo', (req, res) => {
  const newDealer = [
    // req.body.id,
    // uuid.v4(),
    'default',
    req.body.customerId,
    req.body.date,
    req.body.pic_url
  ];

  let sql = `SET @id = ?; SET @customerId = ?; SET @date = ?; SET @pic_url = ?;  CALL orders_informationProcedure(@id, @customerId, @date, @pic_url)`;
  let query = db.query(
    sql,
    [newDealer[0], newDealer[1], newDealer[2], newDealer[3]],
    (err, results) => {
      if (err) throw err;

      results.forEach((element) => {
        if (element.constructor == Array) {
            // msg is a procedure's part
          var id = element[0].id;
          res.send('Inserted element id : ' + id);
          console.log(element[0]);
        }
      });
    }
  );
});

// ////////////////////////////////////////////
// update a user
router.put('/updateOrdersInfo', (req, res, next) => {
  const update_OrdersInfo = [
    req.body.id,
    req.body.customerId,
    req.body.date,
    req.body.pic_url,
    // req.body.id
  ];

  
  // let sql = `UPDATE orders_information SET customerId = ?, date = ?, pic_url = ? WHERE id = ?`;
  let sql = `SET @id = ?; SET @customerId = ?; SET @date = ?; SET @pic_url = ?;  CALL orders_informationProcedure(@id, @customerId, @date, @pic_url)`;

  let query = db.query(sql, update_OrdersInfo, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.json(results);
  });
});

// ///////////////////////////////////////////
// Delete a user
router.delete('/deleteOrdersInfo', (req, res) => {
  const deleteOrdersInfo = [req.body.id];

  let sql = `DELETE FROM orders_information WHERE id = ?`;
  let query = db.query(sql, deleteOrdersInfo[0], (err, results) => {
    if (err) console.log(err);
    console.log(results);
    if (results.affectedRows)
      res.send(`Id = ${deleteOrdersInfo[0]} successfully deleted!`);
    else res.status(200).send(`There is no id = ${deleteOrdersInfo[0]}`);
  });
});

module.exports = router;
