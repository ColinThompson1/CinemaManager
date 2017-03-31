/**
 * Created by colinthompson on 2017-03-30.
 */

var LocalStrategy = require('passport-local').Strategy; //For authenticating email and password
var mysql = require('mysql');
var connection = require('./connection');

//Set up
var sqlCon = mysql.createConnection(connection)

module.exports = function (passport) {

    // Session Setup =============================================
    // Needed for persistent logins

    passport.serializeUser(function (user, done) {
        done(null, user.id);
    });

    passport.deserializeUser(function (id, done) {


    })


};