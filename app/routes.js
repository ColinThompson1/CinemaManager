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

    app.get('/admin', isEmployee, function (req, res) {

        var c = { //Data for dashboard overview panels
            num_tickets: undefined,
            num_users: undefined,
            num_conc: undefined,
            num_com:undefined
        };

        render = function () {
            res.render(VIEW_DIR_PRI + "admin.html", {
                user: req.user,
                adminPanel: true, //So navbar is generated with user profile and whatnot
                panelData: c
            });
        };

        //Grab data for dashboard overview panels
        sqlCon.query(
            "SELECT COUNT(ID) FROM tickets;",
            function (err, results) {
                if (err)
                    throw err;
                if (!results.length)
                    res.status(404);

                c.num_tickets = results[0]['COUNT(ID)'];

                sqlCon.query(
                    "SELECT COUNT(ID) FROM customers;",
                    function (err, results) {
                        if (err)
                            throw err;
                        if (!results.length)
                            res.status(404);

                        c.num_users = results[0]['COUNT(ID)'];

                        sqlCon.query(
                            "SELECT sum(ORDERED) FROM concessions;",
                            function (err, results) {
                                if (err)
                                    throw err;
                                if (!results.length)
                                    res.status(404);

                                c.num_conc = results[0]['sum(ORDERED)'];


                                sqlCon.query(
                                    "SELECT count(RATING) FROM review WHERE RATING > 7;",
                                    function (err, results) {
                                        if (err)
                                            throw err;
                                        if (!results.length)
                                            res.status(404);

                                        c.num_com = results[0]['count(RATING)'];

                                        render();

                                    }
                                );
                            }
                        );

                    }
                );

            }
        );


    });

    app.get('/concession_details', isEmployee, function (req, res) {
        res.render(VIEW_DIR_PRI + "concession_details.html", {
            user: req.user,
            adminPanel: true
        });
    })

    ;app.get('/movie_details', isEmployee, function (req, res) {
        res.render(VIEW_DIR_PRI + "movie_details.html", {
            user: req.user,
            adminPanel: true
        });
    })

    ;app.get('/statistics', isEmployee, function (req, res) {
        res.render(VIEW_DIR_PRI + "statistics.html", {
            user: req.user,
            adminPanel: true
        });
    })

    ;app.get('/user_details', isEmployee, function (req, res) {
        res.render(VIEW_DIR_PRI + "user_details.html", {
            user: req.user,
            adminPanel: true
        });
    });

// Authentication Routes =============================================

    app.get('/signout', function(req, res){
        req.logout();
        res.redirect('/');
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

// Graphs And Charts =============================================

    app.get('/rev-time-graph.js', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/data/rev-time-graph.js")
    });

    app.get('/movie-popularity.js', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/data/movie-popularity.js")
    });

    app.get('/user-dash-data.js', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/data/user-dash-data.js")
    });

    app.get('/movie-dash-data.js', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/data/movie-dash-data.js")
    });

    app.get('/concessions-data.js', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/data/concessions-data.js")
    });

    app.get('/concession-bar-graph.js', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/data/concession-bar-graph.js")
    });

    app.get('/concession-donut-graph.js', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/data/concession-donut-graph.js")
    });

    app.get('/comments-data.js', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/data/comments-data.js")
    });

    app.get('/customer-demographics-data.js', isEmployee, function (req, res) {
        res.sendFile(MAIN_DIR + "/private_assets/data/customer-demographics-data.js")
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

        sqlCon.query(
            "SELECT M.TITLE, COUNT(T.SHOWING_ID) " +
            "FROM MOVIE M, SHOWING S, TICKETS T " +
            "WHERE S.MOVIE_ID = M.ID AND T.SHOWING_ID = S.ID " +
            "GROUP BY M.TITLE",
            function (err, results) {

                if (err)
                    throw err;
                if (!results.length)
                    res.status(404);

                var graphData = [];
                for (var i = 0; i < results.length; i++) {
                    var row = results[i];

                    graphData.push({label: row.TITLE, value: row['COUNT(T.SHOWING_ID)']})
                }
                return res.json(graphData)
            }
        );
    });

    app.post('/concession-bar-data', isEmployee, function (req, res) {

        sqlCon.query(
            "SELECT ITEM, QUANTITY FROM concessions;",
            function (err, results) {

                if (err)
                    throw err;
                if (!results.length)
                    res.status(404);

                var graphData = [];
                for (var i = 0; i < results.length; i++) {
                    var row = results[i];

                    graphData.push({Item: row.ITEM, Quantity: row.QUANTITY})
                }
                return res.json(graphData)
            }
        );
    });

    app.post('/concession-donut-data', isEmployee, function (req, res) {

        sqlCon.query(
            "SELECT ITEM, ORDERED FROM concessions;",
            function (err, results) {

                if (err)
                    throw err;
                if (!results.length)
                    res.status(404);

                var graphData = [];
                for (var i = 0; i < results.length; i++) {
                    var row = results[i];

                    graphData.push({label: row.ITEM, value: row.ORDERED})
                }
                return res.json(graphData)
            }
        );
    });

    app.post('/ages-graph', isEmployee, function (req, res) {

        sqlCon.query(
            "SELECT BDATE FROM customers;",
            function (err, results) {

                if (err)
                    throw err;
                if (!results.length)
                    res.status(404);

                var graphData = [];
                for (var i = 0; i < results.length; i++) {
                    var row = results[i];

                }


                return res.json([{label: 'Ages 0-10', value: 5},
                    {label: 'Ages 11-20', value: 10},
                    {label: 'Ages 21-30', value: 17},
                    {label: 'Ages 31-40', value: 8},
                    {label: 'Ages 41-50', value: 4},
                    {label: 'Ages 50+', value: 6}])
            }
        );
    });

// Chart Data =============================================

    app.post('/user-dashboard', isEmployee, function (req, res) {

        //Fill with user dashboard data
        var data = {
            cust: [], //Customer chart info
            emp: [],
            adv: []
        };

        //Query for customer data
        sqlCon.query(
            "SELECT * FROM customers;",
            [],
            function (err, results) {
                if (err)
                    throw err;
                if (!results.length)
                    res.status(404);


                for (var i = 0; i < results.length; i++) {
                    var row = results[i];

                    data.cust.push({id: row.ID, fName: row.FNAME, lName: row.LNAME, bDay: row.BDATE, sex: row.SEX, address: row.ADDRESS, credit: row.CREDIT_CARD_NO, email: row.EMAIL, phone: row.PHONE_NO});
                }


                sqlCon.query(
                    "SELECT e.SSN, e.FNAME, e.LNAME, e.BDATE, e.SEX, e.ADDRESS, e.PHONE_NO, e.SALARY, e.EMAIL, d.DNAME " +
                    "FROM employee as e, department as d " +
                    "WHERE e.DNO = d.DNO",
                    [],
                    function (err, results) {
                        if (err)
                            throw err;
                        if (!results.length)
                            res.status(404);

                        for (var i = 0; i < results.length; i++) {
                            var row = results[i];

                            data.emp.push({ssn: row.SSN, fName: row.FNAME, lName: row.LNAME, bDay: row.BDATE, sex: row.SEX, address: row.ADDRESS, salary: row.SALARY, email: row.EMAIL, phone: row.PHONE_NO, dept: row.DNAME});
                        }

                        sqlCon.query(
                            "SELECT * FROM advertisers;",
                            [],
                            function (err, results) {
                                if (err)
                                    throw err;
                                if (!results.length)
                                    res.status(404);


                                for (var i = 0; i < results.length; i++) {
                                    var row = results[i];

                                    data.adv.push({
                                        id: row.ID,
                                        company: row.AD_COMPANY,
                                        name: row.REP_NAME,
                                        email: row.REP_EMAIL,
                                        phone: row.REP_PHONE_NO
                                    });
                                }

                                return res.json(data);
                            });
                    });
            }
        );


    });

    app.post('/movie-dashboard', isEmployee, function (req, res) {

        //Fill with movie dashboard data
        var data = {
            movie: [],
            ticket: [],
            showing: [],
            aud: []
        };

        //Query for movie data
        sqlCon.query(
            "SELECT * FROM movie;",
            [],
            function (err, results) {
                if (err)
                    throw err;
                if (!results.length)
                    res.status(404);


                for (var i = 0; i < results.length; i++) {
                    var row = results[i];

                    data.movie.push({id: row.ID,
                        title: row.TITLE,
                        release: row.RELEASE_DATE,
                        length: row.LENGTH,
                        earnings: row.EARNINGS,
                        airLength: row.AIR_LENGTH
                    });
                }


                sqlCon.query(
                    "SELECT t.ID, m.TITLE, t.SEAT_NO, t.SHOWING_ID, c.FNAME, c.LNAME " +
                    "from tickets as t, customers as c, movie as m, showing as s " +
                    "WHERE t.CUSTOMER_ID = c.ID AND t.SHOWING_ID = s.ID AND s.MOVIE_ID = m.ID " +
                    "ORDER BY t.ID",
                    [],
                    function (err, results) {
                        if (err)
                            throw err;
                        if (!results.length)
                            res.status(404);

                        for (var i = 0; i < results.length; i++) {
                            var row = results[i];

                            data.ticket.push({
                                id: row.ID,
                                movie: row.TITLE,
                                fName: row.FNAME,
                                lName: row.LNAME,
                                seat: row.SEAT_NO
                            });

                        }

                        sqlCon.query(
                            "SELECT s.ID, m.TITLE,s.START_TIME, s.PRICE, s.AUD_ID " +
                            "from movie as m, showing as s "  +
                            "WHERE s.MOVIE_ID = m.ID " +
                            "ORDER BY m.TITLE",
                            [],
                            function (err, results) {
                                if (err)
                                    throw err;
                                if (!results.length)
                                    res.status(404);


                                for (var i = 0; i < results.length; i++) {
                                    var row = results[i];

                                    data.showing.push({
                                        id: row.ID,
                                        movie: row.TITLE,
                                        start: row.START_TIME,
                                        price: row.PRICE,
                                        aud: row.AUD_ID
                                    });
                                }

                                sqlCon.query(
                                    "SELECT AUD_NO, SEAT_COUNT FROM auditorium",
                                    [],
                                    function (err, results) {
                                        if (err)
                                            throw err;
                                        if (!results.length)
                                            res.status(404);


                                        for (var i = 0; i < results.length; i++) {
                                            var row = results[i];

                                            data.aud.push({
                                                id: row.AUD_NO,
                                                seatCount: row.SEAT_COUNT
                                            });
                                        }

                                        return res.json(data);
                                    });
                            });
                    });
            }
        );


    });

    app.post('/concession-dashboard', isEmployee, function (req, res) {

        //Fill with user dashboard data
        var data = {
            conc: [] //Customer chart info
        };

        //Query for customer data
        sqlCon.query(
            "SELECT * FROM concessions;",
            [],
            function (err, results) {
                if (err)
                    throw err;
                if (!results.length)
                    res.status(404);


                for (var i = 0; i < results.length; i++) {
                    var row = results[i];

                    data.conc.push({
                        sku: row.SKU,
                        item: row.ITEM,
                        price:row.PRICE,
                        quantity: row.QUANTITY,
                        ordered: row.ORDERED,
                        barcode: row.BARCODE
                    });
                }

                return res.json(data);
            }
        );


    });

    app.post('/comments-dashboard', isEmployee, function (req, res) {

        //Fill with user dashboard data
        var data = {
            com: [] //Customer chart info
        };

        //Query for customer data
        sqlCon.query(
            "SELECT r.ID, m.TITLE, r.CONTENT, r.RATING " +
            "FROM movie as m, review as r " +
            "WHERE r.MOVIE_ID = m.ID " +
            "ORDER BY r.ID",
            [],
            function (err, results) {
                if (err)
                    throw err;
                if (!results.length)
                    res.status(404);


                for (var i = 0; i < results.length; i++) {
                    var row = results[i];

                    data.com.push({
                        id: row.ID,
                        movie: row.TITLE,
                        rating:row.RATING,
                        comment: row.CONTENT
                    });
                }

                return res.json(data);
            }
        );


    });

// Adding Stuff to Database =============================================

    app.post('/add-movie', isEmployee, function (req, res) {

        sqlCon.query(
            "INSERT INTO `movie` (`TITLE`, `RELEASE_DATE`, `LENGTH`, `EARNINGS`, `AIR_LENGTH`, `POSTER_PATH`) VALUES (?, ?, ?, ?, ?, ?);",
            [req.body.title, req.body.release, req.body.length, req.body.earning, req.body.air_length, req.body.img_link],
            function (err, results) {
                if (err) {
                    return res.json({err: true, msg: "Error adding to database"});
                }
                else
                    return res.json({err: false});
            }
        );

    });

    app.post('/add-showing', isEmployee, function (req, res) {

        sqlCon.query(
            "INSERT INTO `showing` (`START_TIME`, `PRICE`, `MOVIE_ID`, `AUD_ID`) VALUES (?, ?, ?, ?);",
            [req.body.start, req.body.price, req.body.movid, req.body.aud],
            function (err, results) {
                if (err) {
                    return res.json({err: true, msg: "Error adding to database"});
                }
                else
                    return res.json({err: false});
            }
        );

    });

    app.post('/add-employee', isEmployee, function (req, res) {

        sqlCon.query(
            "INSERT INTO `employee` (`SSN`, `FNAME`, `LNAME`, `BDATE`, `DNO`, `SEX`, `ADDRESS`, `PHONE_NO`, `SALARY`, `EMAIL`, `PASSWORD`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);",
            [req.body.ssn, req.body.fname, req.body.lname, req.body.bday, req.body.dept, req.body.sex, req.body.addr, req.body.phone, req.body.salary, req.body.email, req.body.pwd],
            function (err, results) {
                if (err) {
                    return res.json({err: true, msg: "Error adding to database"});
                }
                else
                    return res.json({err: false});
            }
        );

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