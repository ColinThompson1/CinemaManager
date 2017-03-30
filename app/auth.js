/**
 * Created by colinthompson on 2017-03-30.
 */

var LocalStrategy = require('passport-local').Strategy; //For authenticating email and password

module.exports = function (passport) {

    // Session Setup =============================================
    // Needed for persistent logins

    passport.serializeUser(function (user, done) {

    })


};