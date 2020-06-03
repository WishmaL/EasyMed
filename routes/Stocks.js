var express = require('express');
var router = express.Router();
var db = require('../database/db');
const uuid = require('uuid');

// IMPORTANT ADD CONNECTION SCAPE TO IGNORE SQL INJECTIONS

//   fetch data
router.get('/getStocks', (req, res) => {
  let sql = 'SELECT * FROM stocks';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send(results);
  });
});

// ///////////////////////////////////////////
//   fetch specific user
router.get('/getStock', (req, res) => {
  let sql = `SELECT * FROM stocks WHERE id = ?`;
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
router.post('/newStock', (req, res) => {
  const newDealer = [
    // req.body.id,
    // uuid.v4(),
    'default',
    req.body.dealerId,
    req.body.medicine_name,
    req.body.description,
    req.body.stock_qty,
    req.body.available
  ];

  let sql = `SET @id = ?; SET @dealerId = ?; SET @medicine_name = ?; SET @description = ?; SET @stock_qty = ?; SET @available = ?; CALL stocksProcedure(@id, @dealerId, @medicine_name, @description, @stock_qty, @available)`;
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
router.put('/updateStocks', (req, res, next) => {
  const update_medicine = [
    req.body.dealerId,
    req.body.medicine_name,
    req.body.description,
    req.body.stock_qty,
    req.body.available,
    req.body.id
  ];

  
  let sql = `UPDATE stocks SET dealerId = ?, medicine_name = ?, description = ?, stock_qty =?, available =? WHERE id = ?`;


  let query = db.query(sql, update_medicine, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.json(results);
  });
});

// ///////////////////////////////////////////
// Delete a user
router.delete('/deleteStocks', (req, res) => {
  const deleteCustomer = [req.body.id];

  let sql = `DELETE FROM stocks WHERE id = ?`;
  let query = db.query(sql, deleteCustomer[0], (err, results) => {
    if (err) throw err;
    console.log('deleted');
    res.send('successfully deleted!');
  });
});

module.exports = router;
