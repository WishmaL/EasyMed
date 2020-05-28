const express = require('express');
const bodyParser = require('body-parser');
var db = require('./database/db');
const port = process.env.PORT || 5000;
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

db.connect((err) => {
  if (err) {
    throw err;
  } else {
    console.log('Mysql connected......');
  }
});

var Dealers = require('./routes/Dealers.js')
app.use('/dealers',Dealers)

// var Notices = require('./routes/Notices.js')
// app.use('/notices',Notices)

// var Articles = require('./routes/Articles.js')
// app.use('/articles',Articles)

// var Graphs = require('./routes/Graphs.js')
// app.use('/graphs',Graphs)

// var Comments = require('./routes/Comments.js')
// app.use('/comments',Comments)

app.listen(port, () => {
  console.log('Server is running on port', port);
});

module.exports = app;
