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

    app.get('/concessions', function (req, res) { //Callback for movies display
        res.render(VIEW_DIR_PUB + "concessions.html", {
            user : req.user,
            adminPanel: false
        });
    });

    //Request for movie information
    app.post('/movietitles', function (req, res) {
        sqlCon.query("SELECT * FROM movie",
            function (err, results) {
                if (err)
                    throw err;
                else {
                    var movies = [];

                    for(var i=0; i < results.length; i++)
                        movies.push({ID: results[i].ID, TITLE: results[i].TITLE, RELEASE_DATE: results[i].RELEASE_DATE,
                            LENGTH: results[i].LENGTH, EARNINGS: results[i].EARNINGS, AIR_LENGTH:[i].AIR_LENGTH,
                            POSTER_PATH: results[i].POSTER_PATH});

                    return res.json(movies);
                }
            })
    });

    //Request for concession information
    app.post('/concessionInfo', function (req, res) {
        sqlCon.query("SELECT * FROM concessions",
            function (err, results) {
                if (err)
                    throw err;
                else {
                    var concessions = [];

                    for(var i=0; i < results.length; i++)
                        concessions.push({SKU: results[i].SKU, ITEM: results[i].ITEM, PRICE: results[i].PRICE,
                            BARCODE: results[i].BARCODE, IMG_PATH: results[i].IMG_PATH});

                    return res.json(concessions);
                }
            })
    });

    app.post('/bookmovie', function (req, res) {
        var movieID = req.body.movieID;
        if (!movieID){
            return res.status(400);
        }else {

            sqlCon.query("SELECT * FROM movie WHERE ID = '" + movieID + "'",
                [movieID],
                function (err, results) {
                    if (err)
                        throw err;
                    else {
                        if (!results.length) {
                            return res.json({err:"A movie by that name does not exist"})
                        }

                        return res.json({ID: results[0].ID, TITLE: results[0].TITLE, RELEASE_DATE: results[0].RELEASE_DATE,
                            LENGTH: results[0].LENGTH, EARNINGS: results[0].EARNINGS, AIR_LENGTH:[0].AIR_LENGTH,
                            POSTER_PATH: results[0].POSTER_PATH, SUMMARY: results[0].SUMMARY});
                    }
                })
        }

    });

    app.post('/concessionItem', function (req, res) {
        var conSKU = req.body.concessionSKU;
        if (!conSKU){
            return res.status(400);
        }else {

            sqlCon.query("SELECT * FROM concessions WHERE SKU = '" + conSKU + "'",
                [conSKU],
                function (err, results) {
                    if (err)
                        throw err;
                    else {
                        if (!results.length) {
                            return res.json({err:"A concession by that name does not exist"})
                        }

                        return res.json({SKU: results[0].SKU, ITEM: results[0].ITEM, PRICE: results[0].PRICE,
                            BARCODE: results[0].BARCODE, IMG_PATH: results[0].IMG_PATH});

                    }
                })
        }

    });

    app.post('/movieReview', function (req, res) {
        var movieID = req.body.movieID;
        if (!movieID){
            return res.status(400);
        }else {

            sqlCon.query("SELECT * FROM review WHERE MOVIE_ID=" + movieID,
                [movieID],
                function (err, results) {
                    if (err)
                        throw err;
                    else {
                        if (!results.length) {
                            return res.json({err:"A movie by that name does not exist"})
                        }

                        var reviews = [];

                        for(var i=0; i < results.length; i++)
                            reviews.push({CONTENT: results[i].CONTENT, RATING: results[i].RATING});

                        return res.json(reviews);
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