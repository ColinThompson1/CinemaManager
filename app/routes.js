/**
 * Created by colinthompson on 2017-03-30.
 */

module.exports = function (app, passport) {

    app.get('/', function (req, res) { //Callback for main pages
        res.render("index.html", {
            user : req.user
        });

    });

    app.get('/movies', function (req, res) { //Callback for movies display
        res.render("movies.html", {
            user : req.user
        });
    });


    app.post('/userlogin', function (req, res, next) {
        passport.authenticate('local-login', function (err, user, info) {
            if (err) {
               return next(err);
            } else if (!user) {
                return res.json({flashInfo: req.flash('login')}); //respond with info
            } else {
                req.logIn(user, function (err) {

                    if (err) return next(err);

                    return res.json({refresh: true})

                })
            }


        })(req, res, next);

    });

    app.post('/register', function (req, res, next) {
        passport.authenticate('local-register', function (err, user, info) {
            if (err) {
                return next(err);
            } else if (!user) {
                return res.json({flashInfo: req.flash('register')}); //respond with err info
            } else {
                req.logIn(user, function (err) {

                    if (err) return next(err);

                    return res.json({refresh: true})

                })
            }

        })(req, res, next);

    });

};