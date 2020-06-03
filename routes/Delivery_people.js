var express = require('express');
var router = express.Router();
var db = require('../database/db');
const uuid = require('uuid');

// IMPORTANT ADD CONNECTION SCAPE TO IGNORE SQL INJECTIONS

//   fetch data
router.get('/getDeliveryPeople', (req, res) => {
  let sql = 'SELECT * FROM delivery_people';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send(results);
  });
});

// ///////////////////////////////////////////
//   fetch specific user
router.get('/getDeliveryPerson', (req, res) => {
  let sql = `SELECT * FROM delivery_people WHERE id = ?`;
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
router.post('/newDeliveryPerson', (req, res) => {
  const newDealer = [
    // req.body.id,
    // uuid.v4(),
    'default',
    req.body.name,
    req.body.nic
  ];

  let sql = `SET @id = ?; SET @name = ?; SET @nic = ?; CALL delivery_peopleProcedure(@id, @name, @nic)`;
  let query = db.query(
    sql,
    [newDealer[0], newDealer[1], newDealer[2]],
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
router.put('/updateDeliveryPerson', (req, res, next) => {
  const update_medicine = [
    req.body.name,
    req.body.nic,
    req.body.id
  ];

  
  let sql = `UPDATE delivery_people SET name = ?, nic = ? WHERE id = ?`;


  let query = db.query(sql, update_medicine, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.json(results);
  });
});

// ///////////////////////////////////////////
// Delete a user
router.delete('/deleteDeliveryPerson', (req, res) => {
  const deleteCustomer = [req.body.id];

  let sql = `DELETE FROM delivery_people WHERE id = ?`;
  let query = db.query(sql, deleteCustomer[0], (err, results) => {
    if (err) throw err;
    console.log('deleted');
    res.send('successfully deleted!');
  });
});

module.exports = router;
