const express = require('express');
const port = 3000;
var mysql = require('mysql');

//  Connection to database
const connection = mysql.createConnection({
    host:       'pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com',
    user:       'admin',
    password:   'prashant',
    database:   'pricing'
});

//  Initialize the app
const app = express();

app.get('/api/selectmealplan', function(req, res) {
    connection.connect();
    connection.query("SELECT * FROM MealPlans", function (error, results, fields) {
        if (error) throw error;
        res.send(results)
    });
    connection.end();
});

app.get('/api/selectpaymentplan', function(req, res) {
    connection.connect();
    connection.query("SELECT * FROM PaymentPlans", function (error, results, fields) {
        if (error) throw error;
        res.send(results)
    });
    connection.end();
});

//  Start the server
app.listen(port, () => {
    console.log(`Listening on port: ${port}`);
});
