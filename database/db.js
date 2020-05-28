const mysql = require('mysql');

var db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
//   change the following name
  database: 'medical_db',
  multipleStatements: true
});

module.exports = db; 
