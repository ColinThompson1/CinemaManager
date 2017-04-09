/**
 * Created by colinthompson on 2017-03-30.
 */

module.exports = function (app, passport) {


    var mysql = require('mysql');
    var connection = require('./connection');

    //Set up mysql
    var sqlCon = mysql.createConnection(connection);

    const VIEW_DIR_PUB = "public/views/pages/";
    const VIEW_DIR_PRI = "private_assets/views/pages/";
    const MAIN_DIR = __dirname.substring(0, (__dirname.lastIndexOf('/')));

// Routes =============================================

    app.get('/', function (req, res) { //Callback for main pages
        res.render(VIEW_DIR_PUB + "index.html", {
            user : req.user,
            adminPanel: false //Whether the navbar should be customized for the admin panel or not
        });
    });

    app.get('/movies', function (req, res) { //Callback for movies display
        res.render(VIEW_DIR_PUB + "movies.html", {
            user : req.user,
            adminPanel: false
        });
    });

    //Request for movie information
    app.get('/movietitle', function (req, res) {
        var movie = req.body.movieTitle;
        if (!movie)
            return res.status(400);
        else {
            sqlCon.query("", //todo: Mark, put your query here.
                [movie],
                function (err, results) {
                if (err)
                    throw err;
                else {
                    if (!results.length) {
                        return res.json({err:"A movie by that name does not exist"})
                    }

                    return res.json({movie: results[0]})
                }
            })
        }

    });

    app.get('/signout', function(req, res){
        req.logout();
        res.redirect('/');
    });

    app.get('/admin', isEmployee, function (req, res) {
        res.render(VIEW_DIR_PRI + "admin.html", {
            user: req.user,
            adminPanel: true //So navbar is generated with user profile and whatnot
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

// Graphs =============================================

    app.get('/rev-time-graph.js', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/data/rev-time-graph.js")
    });

    app.get('/movie-popularity.js', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/data/movie-popularity.js")
    });


// Graph Data =============================================

    app.post('/rev-time-graph-data', isEmployee, function (req, res) {

        sqlCon.query(
            "SELECT TITLE, EARNINGS FROM movie WHERE RELEASE_DATE < CURRENT_DATE();",
            function (err, results) {

                if (err)
                    throw err;
                if (!results.length)
                    res.status(404);

                var graphData = [];
                for (var i = 0; i < results.length; i++) { //Creates a list of string literals
                    var row = results[i];

                    graphData.push({Title: row.TITLE, Revenue: row.EARNINGS})
                }
                return res.json(graphData)
            }
        );
    });

    app.post('/popularity-graph-data', isEmployee, function (req, res) {

        return res.json({label: 'Mona', value: 109023}, {label: 'Finding Dory', value: 125345}, {label: 'Doctor Strange', value: 348982});
        //todo: add query
        // sqlCon.query(
        //     "",
        //     function (err, results) {
        //
        //         if (err)
        //             throw err;
        //         if (!results.length)
        //             res.status(404);
        //
        //         var graphData = [];
        //         for (var i = 0; i < results.length; i++) { //Creates a list of string literals
        //             var row = results[i];
        //
        //             graphData.push({Title: row.TITLE, Revenue: row.EARNINGS})
        //         }
        //         return res.json(graphData)
        //     }
        // );
    });

// CSS and JS Routing =============================================

    app.get('/sb-admin-2.min.css', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/css/sb-admin-2.min.css")
    });

    app.get('/morris-data.js', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/data/morris-data.js")
    });

    app.get('/sb-admin-2.min.js', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/js/sb-admin-2.min.js")
    });

    app.get('/admin.css', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/css/admin.css")
    });

// Other Middleware =============================================

    //Checks if the client has valid employee credentials
    function isEmployee(req, res, next) {
        if ((req.user) && (req.user.SSN)) {
            next();
        } else {
            res.status(403);
            res.send("YOU SHALL NOT PASS");
        }
    }


};