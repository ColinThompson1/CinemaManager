/**
 * Created by colinthompson on 2017-03-22.
 */
var express = require('express');
var app = express();
var bodyParser = require('body-parser');

// Create application/x-www-form-urlencoded parser
var urlencodedParser = bodyParser.urlencoded({ extended: false });

const PORT = 8081; //For simplicity, since you need root to make it on port 80
const HOSTNAME = "127.0.0.1";

app.use(express.static(__dirname +'/public')); //Serves static files to client

app.get('/', function (req, res) { //Callback for main page
    res.sendFile( __dirname + "/public/views/index.html");
});

app.post('/userlogin', urlencodedParser, function (req, res) {
    var employeeLogin = {
        email: req.body.email,
        password: req.body.password
    };

    console.log(employeeLogin);
    res.sendFile( __dirname + "/public/views/index.html");
});

var server = app.listen(PORT, HOSTNAME, function () {
    var host = server.address().address;
    var port = server.address().port;
    console.log("Example app listening at http://%s:%s", host, port)
});

