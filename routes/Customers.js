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
router.post('/getCustomer', (req, res) => {
  let sql = `SELECT * FROM customers WHERE name = ? AND password = ?`;
  let param = [req.body.name, req.body.password];
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
    'default',
    req.body.name,
    req.body.password,
    req.body.age,
    req.body.nic,
    req.body.contact_no,
    req.body.delivery_address,
  ];

  let sql = `SET @id = ?;SET @name = ?; SET @password = ?; SET @age = ?; SET @nic = ?; SET @contact_no = ?; SET @delivery_address = ?; CALL customerProcedure(@id, @name, @password, @age, @nic, @contact_no, @delivery_address)`;

  console.log(newDealer[0]);
  let query = db.query(
    sql,
    [
      newDealer[0],
      newDealer[1],
      newDealer[2],
      newDealer[3],
      newDealer[4],
      newDealer[5],
      newDealer[6],
    ],
    (err, results) => {
      if (err) throw err;

      results.forEach((element) => {
        if (element.constructor == Array) {
          // msg is a procedure's part
          var msg = element[0].name;
          res.send('Inserted element name : ' + msg);
          console.log(element[0]);
        }
      });
    }
  );
});

// ////////////////////////////////////////////
// update a user
router.put('/updateCustomer', (req, res, next) => {
  // router.put('/updateCustomer/:id', (req, res, next) => {
  const update_customer = [
    req.body.id,
    req.body.name,
    req.body.password,
    req.body.age,
    req.body.nic,
    req.body.contact_no,
    req.body.delivery_address,
    // req.body.id,
  ];

  // let sql = `UPDATE customers SET name = ?, age = ?, nic =?, contact_no = ?, delivery_address = ? WHERE id = ${req.params.id}`;

  let sql = `SET @id = ?;SET @name = ?;SET @password = ?; SET @age = ?; SET @nic = ?; SET @contact_no = ?; SET @delivery_address = ?; CALL customerProcedure(@id, @name, @password, @age, @nic, @contact_no, @delivery_address)`;

  // console.log(sql)

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
    if (err) console.log(err);
    console.log(results);
    if (results.affectedRows)
      res.send(`Id = ${deleteCustomer[0]} successfully deleted!`);
    else res.status(200).send(`There is no id = ${deleteCustomer[0]}`);
  });
});

module.exports = router;
