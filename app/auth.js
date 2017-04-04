/**
 * Created by colinthompson on 2017-03-30.

 User Auth Issues (for sake of time)
 - Form entries aren't rigorously tested (they are against sql injections though)
 - User ID and SSN would no longer be unique when the number of customers reaches the ssn values
 - passwords not hashed (for sake of being able to easily preload database with data)

 Additionally:
 - Database should have been modeled to make customer and employee a subclass of a person type to at the very least simplify auth.
 - Use lowercase column names in the future

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
        if (user.ID) //User logging in is a customer OR employee - check both
            done(null, user.ID);
        else
            done(null, user.SSN);
    });

    //Obtain user object based on session user id
    passport.deserializeUser(function (id, done) {

        connection.query(
            "SELECT * FROM customers WHERE EMAIL = ?",
            [id],
            function (err, results, field) {
                done(err, results[0]);
            }
        );
    });

// Login ==============================================================

    passport.use(
        'login',
        new LocalStrategy({
            usernameField: 'email',
            passwordField: 'password',
            passReqToCallback: true
        },
        function (req, email, password, done) {

            //Query for customer credentials
            connection.query("SELECT * FROM customers WHERE EMAIL = ?",
                [email],
                function (err, results, field) {
                    if (err) {
                        return done(err); //Error accessing database
                    } else {
                        if (results.length == 0) { //Could possibly be an employee logging in

                            //Query for employee credentials
                            connection.query("SELECT * FROM employee WHERE EMAIL = ?",
                                [email],
                                function (err, results, field) {
                                    if (err) {
                                        return done(err); //Query failed
                                    } else {
                                        if (results.length == 0) //Does it exist in employee either?
                                            return done(null, false, req.flash("login", "A user by that name does not exist!"));

                                        return passwordCheck(results[0]); //Verify password

                                    }

                                }

                            )
                        }

                        return passwordCheck(results[0]);
                    }
                });

            //Determines the validity of a password and returns the corresponding verify callback function
            var passwordCheck = function (result) {
                if (result.PASSWORD == password)
                    return done(null, result);
                else
                    return done(null, false, req.flash("login", "Incorrect Password"));

            };
        }
        )
    );

// Register ==============================================================

    passport.use(
        'register',
        new LocalStrategy({
                usernameField: 'email',
                passwordField: 'password',
                passReqToCallback: true
            },
            function (req, email, password, done) {
                //Grab form data
                var data = [req.body.fname, req.body.lname, req.body.bday, req.body.gender, email, password] //Form data

                //Check that input isnt empty
                if (data.includes("")) {
                    console.log("User %s registed with empty form", email);
                    return done(null, false, req.flash("register", "Please make sure not to leave anything blank"));
                }

                //Check that we arent making a duplicate account
                connection.query(
                    "SELECT * FROM customer WHERE EMAIL = ?",
                    [email],
                    function (err, results, field) {
                        if (err) {
                            done(err);
                        }

                        //Check if the email has been taken
                        if (results.length > 0) {
                            done(null, false, req.flash("register", "That email has already been taken"));
                        } else {

                            //User for session
                            var newUser = {
                                EMAIL: data[4],
                                PASSWORD: data[5],
                                FNAME:data[0],
                                LNAME: data[1],
                                BDAY: data[2],
                                SEX: data[3]
                            };

                            connection.query(
                                "INSERT INTO customer(FNAME, LNAME, BDATE, SEX, EMAIL, `PASSWORD`) " +
                                "VALUES (?, ?, STR_TO_DATE(?, '%m/%d/%y'), ?, ?, ?)",
                                data,
                                function (err, results) {
                                    newUser.ID = results.insertId; //Add ID
                                    return done(null, newUser);
                                }
                            )

                        }

                    })


            }
        )
    );

};



