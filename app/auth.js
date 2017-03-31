/**
 * Created by colinthompson on 2017-03-30.
 */

var LocalStrategy = require('passport-local').Strategy; //For authenticating email and password
var mysql = require('mysql');
var connection = require('./connection');

//Set up mysql
var sqlCon = mysql.createConnection(connection);

module.exports = function (passport) {

// Session Setup ==============================================================
// Needed for persistent logins

    //Serialize user id to identify session
    passport.serializeUser(function (user, done) {
        done(null, user.id);
    });

    //Obtain user object based on session
    passport.deserializeUser(function (id, done) {
        //TODO: Query both customers and employees to obtain email and password and id
        var rows = undefined; //to be replaced
        var err = undefined;
        //Note: We will need to make id's between customers and employees unique,
        //possibly be prefixing them with a char. Just for passportjs functionality (not in the db)
        done(err, rows[0]);
    });

// Login ==============================================================

    passport.use(
        'login',
        new LocalStrategy({
            usernameField: 'email',
            passwordField: 'password',
            passReqToCallback: true
        },
        function (username, password, done) {
            //todo:query for username from cust and employees check password
        }
        )
    );

// Register ==============================================================

    passport.use(
        'login',
        new LocalStrategy({
                usernameField: 'email',
                passwordField: 'password',
                passReqToCallback: true
            },
            function (username, password, done) {
                //todo:same as login but for making accounts
            }
        )
    );

};



