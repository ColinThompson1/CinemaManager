/**
 * Created by colinthompson on 2017-03-22.
 */
var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var mysql = require("mysql");

var connection = mysql.createConnection({
    server: "localhost",
    database: "cinema",
    user: "root",
    password: "marklin",
    port: 3306
});

// Create application/x-www-form-urlencoded parser
var urlencodedParser = bodyParser.urlencoded({ extended: false });

const PORT = 8081; //For simplicity, since you need root to make it on port 80
const HOSTNAME = "127.0.0.1";

app.use(express.static(__dirname +'/public')); //Serves static files to client

app.get('/', function (req, res) { //Callback for main page
    res.sendFile( __dirname + "/public/views/index.html");
});

//Handler for User Login
app.post('/userlogin', urlencodedParser, function (req, res) {
    var employeeLogin = { //Credentials
        email: req.body.email,
        password: req.body.password
    };

    console.log(employeeLogin);
    res.sendFile( __dirname + "/public/views/index.html");

    //AUTHENTICATE wITH DB

});

//Run the server
var server = app.listen(PORT, HOSTNAME, function () {
    var host = server.address().address;
    var port = server.address().port;
    console.log("Example app listening at http://%s:%s", host, port)
});

connection.connect(function(err) {
    if (err){
        console.error('error connecting: ' + err.stack);
        return;
    }

    console.log('connected as id ' + connection.threadId);
});

connection.query({
    sql: 'SELECT FNAME FROM EMPLOYEE'
},
    function (error, results, fields) {
        // error will be an Error if one occurred during the query
        // results will contain the results of the query
        // fields will contain information about the returned results fields (if any)

        console.log(results);
    }
);