var MovieController = require('../controllers/MovieController');

module.exports = function (app) {

    // 1 list all movies
    app.post('/movie/getMovieBy', function (req, res) {
        console.log('/movie/getMovieBy', req.body)
        MovieController.getMovieBy(req.body, function (err, task) {
            if (err) {
                res.send(err);
            }
            res.send(task);
        });
    })
    // 2.1 Redirect Booking
    app.post('/movie/getMovieByMovieCode', function (req, res) {
        console.log('/movie/getMovieByMovieCode', req.body)
        MovieController.getMovieByMovieCode(req.body, function (err, task) {
            if (err) {
                res.send(err);
            }
            res.send(task);
        });
    })
    // 2.2 Select Date
    app.post('/movie/getMovieByDate', function (req, res) {
        console.log('/movie/getMovieByDate', req.body)
        MovieController.getMovieByDate(req.body, function (err, task) {
            if (err) {
                res.send(err);
            }
            res.send(task);
        });
    })
    // 2.3 Select Theater
    app.post('/movie/getMovieByTheater', function (req, res) {
        console.log('/movie/getMovieByTheater', req.body)
        MovieController.getMovieByTheater(req.body, function (err, task) {
            if (err) {
                res.send(err);
            }
            res.send(task);
        });
    })
    // 2.4 Select Time
    app.post('/movie/getMovieByTime', function (req, res) {
        console.log('/movie/getMovieByTime', req.body)
        MovieController.getMovieByTime(req.body, function (err, task) {
            if (err) {
                res.send(err);
            }
            res.send(task);
        });
    })
    // 2.5 display screen choose seats
    app.post('/movie/getMovieByScreen', function (req, res) {
        console.log('/movie/getMovieByScreen', req.body)
        MovieController.getMovieByScreen(req.body, function (err, task) {
            if (err) {
                res.send(err);
            }
            res.send(task);
        });
    })
    // 2.6 choose seats adn calculate price
    app.post('/movie/getMovieByBooking', function (req, res) {
        console.log('/movie/getMovieByBooking', req.body)
        MovieController.getMovieByBooking(req.body, function (err, task) {
            if (err) {
                res.send(err);
            }
            res.send(task);
        });
    })
    // Validate and Booking
    app.post('/movie/updateMovieByBookingCode', function (req, res) {
        console.log('/movie/updateMovieByBookingCode', req.body)
        MovieController.updateMovieByBookingCode(req.body, function (err, task) {
            if (err) {
                res.send(err);
            }
            res.send(task);
        });
    })
}