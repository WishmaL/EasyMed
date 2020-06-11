var express = require('express');
var router = express.Router();
var db = require('../database/db');
const uuid = require('uuid');

// db.connect((err) => {
//   if (err) {
//     throw err;
//   } else {
//     console.log('Mysql connected......');
//   }
// });

// IMPORTANT ADD CONNECTION SCAPE TO IGNORE SQL INJECTIONS

//   fetch data
router.get('/getDealers', (req, res) => {
  let sql = 'SELECT * FROM dealers';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.send(results);
  });
});

// ///////////////////////////////////////////
//   fetch specific user
router.get('/getDealer', (req, res) => {
  let sql = `SELECT * FROM dealers WHERE id = ?`;
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
router.post('/newDealer', (req, res) => {
  const newDealer = [
    // req.body.id,
    // uuid.v4(),
    'default',
    req.body.dealer_name,
    req.body.dealer_nic,
    req.body.pharmacy_name,
    req.body.contact_number,
    req.body.pharmacy_address,
    req.body.certificate_id
  ];

  let sql = `SET @id = ?;SET @dealer_name = ?; SET @dealer_nic = ?; SET @pharmacy_name = ?; SET @contact_number = ?; SET @pharmacy_address = ?; SET @certificate_id = ?; CALL dealersProcedure(@id, @dealer_name, @dealer_nic, @pharmacy_name, @contact_number, @pharmacy_address, @certificate_id)`;
  let query = db.query(
    sql,
    [newDealer[0], newDealer[1], newDealer[2], newDealer[3], newDealer[4], newDealer[5], newDealer[6]],
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
router.put('/updateDealer', (req, res, next) => {
  const update_dealer = [
    req.body.id,
    req.body.dealer_name,
    req.body.dealer_nic,
    req.body.pharmacy_name,
    req.body.contact_number,
    req.body.pharmacy_address,
    req.body.certificate_id,
    // req.body.id,
  ];

  
  let sql = `SET @id = ?;SET @dealer_name = ?; SET @dealer_nic = ?; SET @pharmacy_name = ?; SET @contact_number = ?; SET @pharmacy_address = ?; SET @certificate_id = ?; CALL dealersProcedure(@id, @dealer_name, @dealer_nic, @pharmacy_name, @contact_number, @pharmacy_address, @certificate_id)`;


  let query = db.query(sql, update_dealer, (err, results) => {
    if (err) throw err;
    console.log(results);
    res.json(results);
  });
});

// ///////////////////////////////////////////
// Delete a user
router.delete('/deleteDealer', (req, res) => {
  const deleteDealer = [req.body.id];

  let sql = `DELETE FROM dealers WHERE id = ?`;
  let query = db.query(sql, deleteDealer[0], (err, results) => {
    if (err) console.log(err);
    console.log(results)
    if(results.affectedRows)
      res.send(`Id = ${deleteDealer[0]} successfully deleted!`);
    else
      res.status(200).send(`There is no id = ${deleteDealer[0]}`)
  });
});


module.exports = router;
