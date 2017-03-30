/**
 * Created by colinthompson on 2017-03-30.
 */

//Set Up
var path = require('path');


module.exports = function (app, passport) {

    app.get('/', function (req, res) { //Callback for main page
        res.sendFile("index.html", {root: path.join(__dirname, "../public/views/")});
    });

    // //Handler for User Login
    // app.post('/userlogin', urlencodedParser, function (req, res) {
    //     var employeeLogin = { //Credentials
    //         email: req.body.email,
    //         password: req.body.password
    //     };
    //
    //     console.log(employeeLogin);
    //     res.sendFile( __dirname + "/public/views/index.html");
    // });

};