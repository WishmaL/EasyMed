var express = require('express');
var router = express.Router();
var db = require('../database/db');
const uuid = require('uuid');

// IMPORTANT ADD CONNECTION SCAPE TO IGNORE SQL INJECTIONS

//   fetch data
router.get('/getMedicines', (req, res) => {
  let sql = 'SELECT * FROM medicines';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send(results);
  });
});

// ///////////////////////////////////////////
//   fetch specific user
router.get('/getMedicine', (req, res) => {
  let sql = `SELECT * FROM medicines WHERE id = ?`;
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
router.post('/newMedicine', (req, res) => {
  const newDealer = [
    // req.body.id,
    // uuid.v4(),
    'default',
    req.body.dealerId,
    req.body.medicine_name,
    req.body.description,
    req.body.mdf_date,
    req.body.exp_date,
    req.body.unit_price
  ];

  let sql = `SET @id = ?; SET @dealerId = ?; SET @medicine_name = ?; SET @description = ?; SET @mdf_date = ?; SET @exp_date = ?; SET @unit_price = ?; CALL cutomerProcedure(@id, @dealerId, @medicine_name, @description, @mdf_date, @exp_date, @unit_price)`;
  let query = db.query(
    sql,
    [newDealer[0], newDealer[1], newDealer[2], newDealer[3], newDealer[4], newDealer[5], newDealer[6]],
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
router.put('/updateMedicine', (req, res, next) => {
  const update_medicine = [
    req.body.dealerId,
    req.body.medicine_name,
    req.body.description,
    req.body.mdf_date,
    req.body.exp_date,
    req.body.unit_price,
    req.body.id
  ];

  
  let sql = `UPDATE customers SET dealerId = ?, medicine_name = ?, description =?, mdf_date = ?, exp_date = ?, unit_price = ? WHERE id = ?`;


  let query = db.query(sql, update_medicine, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.json(results);
  });
});

// ///////////////////////////////////////////
// Delete a user
router.delete('/deleteMedicine', (req, res) => {
  const deleteCustomer = [req.body.id];

  let sql = `DELETE FROM medicines WHERE id = ?`;
  let query = db.query(sql, deleteCustomer[0], (err, results) => {
    if (err) throw err;
    console.log('deleted');
    res.send('successfully deleted!');
  });
});

module.exports = router;
