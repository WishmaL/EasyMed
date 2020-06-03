var express = require('express');
var router = express.Router();
var db = require('../database/db');
const uuid = require('uuid');

// IMPORTANT ADD CONNECTION SCAPE TO IGNORE SQL INJECTIONS

//   fetch data
router.get('/getCustomers', (req, res) => {
  let sql = 'SELECT * FROM customers';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send(results);
  });
});

// ///////////////////////////////////////////
//   fetch specific user
router.get('/getCustomer', (req, res) => {
  let sql = `SELECT * FROM customers WHERE id = ?`;
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
router.post('/newCustomer', (req, res) => {
  const newDealer = [
    // req.body.id,
    // uuid.v4(),
    req.body.name,
    req.body.age,
    req.body.nic,
    req.body.contact_no,
    req.body.delivery_address
  ];

  let sql = `SET @name = ?; SET @age = ?; SET @nic = ?; SET @contact_no = ?; SET @delivery_address = ?;  CALL cutomerProcedure(@name, @age, @nic, @contact_no, @delivery_address)`;
  let query = db.query(
    sql,
    [newDealer[0], newDealer[1], newDealer[2], newDealer[3], newDealer[4]],
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
router.put('/updateCustomer', (req, res, next) => {
  const update_customer = [
    req.body.name,
    req.body.age,
    req.body.nic,
    req.body.contact_no,
    req.body.delivery_address,
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
router.delete('/deleteCustomer', (req, res) => {
  const deleteCustomer = [req.body.id];

  let sql = `DELETE FROM customers WHERE id = ?`;
  let query = db.query(sql, deleteCustomer[0], (err, results) => {
    if (err) throw err;
    console.log('deleted');
    res.send('successfully deleted!');
  });
});

module.exports = router;
