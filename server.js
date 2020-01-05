const express = require('express');
const app = express();
const port = 3000;
var mysql = require('mysql');

//  Connection to database
const connection = mysql.createConnection({
    host:       'pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com',
    user:       'admin',
    password:   'super_secret_password',
    database:   'pricing'
});

//  Initialize the app
const app = express();

//  

//  Start the server
app.listen(port, () => {
    console.log("Visit http://localhost:${port} to access the frontend");
});
