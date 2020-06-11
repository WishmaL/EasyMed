var express = require('express');
var router = express.Router();
var db = require('../database/db');
const uuid = require('uuid');

// IMPORTANT ADD CONNECTION SCAPE TO IGNORE SQL INJECTIONS

//   fetch data
router.get('/getOrderMedicines', (req, res) => {
  let sql = 'SELECT * FROM order_medicines';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send(results);
  });
});

// ///////////////////////////////////////////
//   fetch specific user
router.get('/getOrderMedicine', (req, res) => {
  let sql = `SELECT * FROM order_medicines WHERE id = ?`;
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
router.post('/newOrderMedicine', (req, res) => {
  const newDealer = [
    // req.body.id,
    // uuid.v4(),
    'default',
    req.body.orders_informationId,
    req.body.medicine_name,
    req.body.amount
  ];

  let sql = `SET @id = ?; SET @orders_informationId = ?; SET @medicine_name = ?; SET @amount = ?; CALL order_medicineProcedure(@id, @orders_informationId, @medicine_name, @amount)`;
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
router.put('/updateOrderMedicine', (req, res, next) => {
  const update_medicine = [
    req.body.id,
    req.body.orders_informationId,
    req.body.medicine_name,
    req.body.amount,
    // req.body.id
  ];

  
  // let sql = `UPDATE order_medicines SET orders_informationId = ?, medicine_name = ?, amount =? WHERE id = ?`;
  let sql = `SET @id = ?; SET @orders_informationId = ?; SET @medicine_name = ?; SET @amount = ?; CALL order_medicineProcedure(@id, @orders_informationId, @medicine_name, @amount)`;

  let query = db.query(sql, update_medicine, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.json(results);
  });
});

// ///////////////////////////////////////////
// Delete a user
router.delete('/deleteOrderMedicine', (req, res) => {
  const deleteMed = [req.body.id];

  let sql = `DELETE FROM order_medicines WHERE id = ?`;
  let query = db.query(sql, deleteMed[0], (err, results) => {
    if (err) console.log(err);
    console.log(results);
    if (results.affectedRows)
      res.send(`Id = ${deleteMed[0]} successfully deleted!`);
    else res.status(200).send(`There is no id = ${deleteMed[0]}`);
  });
});

module.exports = router;
