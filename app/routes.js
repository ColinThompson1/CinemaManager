/**
 * Created by colinthompson on 2017-03-30.
 */

module.exports = function (app, passport) {

    app.get('/', function (req, res) { //Callback for main pages
        res.render("index.html");
    });

    app.get('/movies', function (req, res) { //Callback for movies display
        res.render("movies.html");
    });

    //Handler for User Login
    app.post('/userlogin',
        passport.authenticate('local-login', {
            failureFlash:true
        },
        function (req, res) {

            if (req.user) {
                console.log("User " + req.user + " logged in");
                res.redirect("index.html"); //redirect but this time will render as logged in
            } else {
                console.log("Login Attempt");
                res.json({flashInfo: req.flash('login')}); //respond with info
            }

        }
        )
    );

};