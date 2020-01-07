const express = require('express');
const app = express();
const port = 3030;
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

//  Routing
app.get('/', function (req, res) {
    res.send("homepage")
});

app.get('/selectmealplan', function(req, res) {
    connection.connect();
    connection.query(, function (error, results, fields) {
        if (error) throw error;
        res.send(results)
    });
    connection.end();
});

//  Start the server
app.listen(port, () => {
    console.log("Visit http://localhost:${port} to access the frontend");
});
