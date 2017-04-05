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
        console.log("[Auth] Checking login session of " + user.EMAIL);
        if (user.ID) //User logging in is a customer OR employee - check both
            done(null, user.ID);
        else
            done(null, user.SSN);
    });

    //Obtain user object based on session user id
    passport.deserializeUser(function (id, done) {
        console.log("[Auth] Deserializing user " + id);
        var query;
        if (id.toString().length < 9) { //Not the best way of doing things
            query = "SELECT * FROM customers WHERE ID = ?"
        } else {
            query = "SELECT * FROM customers WHERE SSN = ?"
        }
        sqlCon.query(query,
            [id],
            function (err, results) {
                done(err, results[0]);
            }
        );
    });

// Login ==============================================================

    passport.use(
        'local-login',
        new LocalStrategy({
            usernameField: 'email',
            passwordField: 'password',
            passReqToCallback : true
        },
        function (req, email, password, done) {
            console.log("[Auth] Checking Login of " + email);
            //Query for customer credentials
            sqlCon.query("SELECT * FROM customers WHERE EMAIL = ?",
                [email],
                function (err, results) {
                    if (err) {
                        console.log("[Auth] Error Accessing Database");
                        return done(err); //Error accessing database
                    } else {
                        if (results.length == 0) { //Could possibly be an employee logging in
                            console.log("[Auth] Checking employee table");
                            //Query for employee credentials
                            sqlCon.query("SELECT * FROM employee WHERE EMAIL = ?",
                                [email],
                                function (err, results) {
                                    if (err) {
                                        return done(err); //Query failed
                                    } else {
                                        if (results.length == 0) {//Does it exist in employee either?
                                            console.log("[Auth] Could not find user");
                                            return done(null, false, req.flash("login", "A user by that name does not exist!"));
                                        }
                                        console.log("test");
                                        return passwordCheck(results[0]); //Verify password

                                    }

                                }

                            )
                        } else {
                            return passwordCheck(results[0]);
                        }
                    }
                });

            //Determines the validity of a password and returns the corresponding verify callback function
            var passwordCheck = function (result) {
                console.log("[Auth] Verifying Password of " + email);
                if (result.PASSWORD == password) {
                    console.log("[Auth] Password of " + email + " verified");
                    return done(null, result);
                } else {
                    console.log("[Auth] Password of " + email + " incorrect");
                    return done(null, false, req.flash("login", "Incorrect Password"));
                }
            };
        }
        )
    );

// Register ==============================================================

    passport.use(
        'local-register',
        new LocalStrategy({
                usernameField: 'email',
                passwordField: 'password',
                passReqToCallback : true
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
                sqlCon.query(
                    "SELECT * FROM customer WHERE EMAIL = ?",
                    [email],
                    function (err, results) {
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

                            sqlCon.query(
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



