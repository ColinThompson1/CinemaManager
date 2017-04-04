/**
 * Created by colinthompson on 2017-03-22.
 */

'use strict';

// Set Up =============================================
var express = require('express');
var session = require('express-session');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var morgan = require('morgan');
var ejs = require('ejs');
var app = express();

var passport = require('passport');
var flash = require('connect-flash');

const PORT = 8081; //For simplicity, since you need root to make it on port 80
const HOSTNAME = "127.0.0.1";

// Config =============================================

require('./app/auth')(passport); //Configure passport

app.use(morgan('dev')); //Logs to the console
app.use(cookieParser()); //Cookies for Auth
app.use(bodyParser.urlencoded({
    extended: true
})); //Get info from html forms
app.use(bodyParser.json());

app.set('view engine', 'html'); //Use the template module to render html
app.engine('html', ejs.renderFile);
app.set('views', __dirname  + "/public/views/pages"); //Instruct the engine of the location of the views


app.use(session({
    secret: 'hashmeupsomethinggood',
    resave: true,
    saveUninitialized: true
})); //Set default values
app.use(passport.initialize());
app.use(passport.session()); //Login sessions
app.use(flash()); //For 'Flashing' messages back to client


app.use(express.static(__dirname +'/public')); //Serves static files to client

// Routing =============================================

//Initialize routing with application and configured passport
require('./app/routes.js')(app, passport);

// Run ==================================================

//Run the server
var server = app.listen(PORT, HOSTNAME, function () {
    var host = server.address().address;
    var port = server.address().port;
    console.log("Example app listening at http://%s:%s", host, port)
});

//SQL Testing

// var con = require('./app/connection');
// var mysql = require('mysql');
//
// var connection = mysql.createConnection(con);
//
//
// connection.connect(function(err) {
//     if (err){
//         console.error('error connecting: ' + err.stack);
//         return;
//     }
//
//     console.log('connected as id ' + connection.threadId);
// });
//
// connection.query({
//     sql: 'SELECT FNAME FROM EMPLOYEE'
// },
//     function (error, results, fields) {
//         // error will be an Error if one occurred during the query
//         // results will contain the results of the query
//         // fields will contain information about the returned results fields (if any)
//
//         console.log(results);
//     }
// );