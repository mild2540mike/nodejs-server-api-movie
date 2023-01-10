var sql = require('./BaseModel');

var Task = function (task) {
    this.task = task.task;
};

// 1 list all movies
Task.getMovieBy = function getMovieBy() {
    return new Promise(function (resolve, reject) {
        var str = "SELECT * FROM movies ";
        console.log("str",str);
        
        sql.query(str, function (err, res) {
            if (err) {
                console.log("error: ", err);
                const require = {
                    data: [],
                    error: err,
                    query_result: false,
                    server_result: true
                };
                resolve(require);
            }
            else {
                const require = {
                    data: res,
                    error: [],
                    query_result: true,
                    server_result: true
                };
                resolve(require);
            }
        });
    });
}

// 2.1 Redirect Booking
Task.getMovieByMovieCode = function getMovieByMovieCode(data) {
    return new Promise(function (resolve, reject) {
        var str = "SELECT * FROM movies WHERE movie_id = '" + data.movie_id + "' ";
        sql.query(str, function (err, res) {
            if (err) {
                console.log("error: ", err);
                const require = {
                    data: [],
                    error: err,
                    query_result: false,
                    server_result: true
                };
                resolve(require);
            }
            else {
                const require = {
                    data: res,
                    error: [],
                    query_result: true,
                    server_result: true
                };
                resolve(require);
            }
        });
    });
}

// 2.2 Select Date
Task.getMovieByDate = function getMovieByDate(data) {
    return new Promise(function (resolve, reject) {
        var str = "SELECT show_date FROM showtimes WHERE movie_id = '" + data.movie_id +"' GROUP BY show_date"
        sql.query(str, function (err, res) {
            if (err) {
                console.log("error: ", err);
                const require = {
                    data: [],
                    error: err,
                    query_result: false,
                    server_result: true
                };
                resolve(require);
            }
            else {
                const require = {
                    data: res,
                    error: [],
                    query_result: true,
                    server_result: true
                };
                resolve(require);
            }
        });
    });
}

// 2.3 Select Theater
Task.getMovieByTheater = function getMovieByTheater(data) {
    return new Promise(function (resolve, reject) {
        var str = "SELECT theater_name FROM showtimes t1"
        +" JOIN theaters t2 ON t1.theater_id = t2.theater_id"
        +" WHERE t1.movie_id = '" + data.movie_id +"' AND t1.show_date =  '" + data.show_date +"'  GROUP BY t1.theater_id"
        sql.query(str, function (err, res) {
            if (err) {
                console.log("error: ", err);
                const require = {
                    data: [],
                    error: err,
                    query_result: false,
                    server_result: true
                };
                resolve(require);
            }
            else {
                const require = {
                    data: res,
                    error: [],
                    query_result: true,
                    server_result: true
                };
                resolve(require);
            }
        });
    });
}

// 2.4 Select Time
Task.getMovieByTime = function getMovieByTimer(data) {
    return new Promise(function (resolve, reject) {
        var str = "SELECT show_time FROM showtimes WHERE movie_id = '" + data.movie_id +"' AND show_date = '" + data.show_date +"' GROUP BY show_time"
        sql.query(str, function (err, res) {
            if (err) {
                console.log("error: ", err);
                const require = {
                    data: [],
                    error: err,
                    query_result: false,
                    server_result: true
                };
                resolve(require);
            }
            else {
                const require = {
                    data: res,
                    error: [],
                    query_result: true,
                    server_result: true
                };
                resolve(require);
            }
        });
    });
}

// 2.5 display screen choose seats
Task.getMovieByScreen = function getMovieByScreen(data) {
    return new Promise(function (resolve, reject) {
        var str = "SELECT t1.seat_id, t1.seat_number, t1.showtime_id, t1.booking_id, t2.show_date, t2.show_time,"
        +" (SELECT theater_name FROM theaters WHERE theater_id = t2.theater_id) AS theater_name,"
        +" (SELECT movie_name FROM movies WHERE movie_id = t2.movie_id) AS movie_name,"
        +" (SELECT detail FROM movies WHERE movie_id = t2.movie_id) AS movie_detail,"
        +" (SELECT movie_image FROM movies WHERE movie_id = t2.movie_id) AS movie_image"
        +" FROM seats t1"
        +" JOIN showtimes t2 ON t1.showtime_id = t2.showtime_id"
        +" WHERE t2.showtime_id = (SELECT showtime_id FROM showtimes WHERE movie_id = '" + data.movie_id +"' AND show_date = '" + data.show_date +"' AND show_time = '" + data.show_time +"' )"
        sql.query(str, function (err, res) {
            if (err) {
                console.log("error: ", err);
                const require = {
                    data: [],
                    error: err,
                    query_result: false,
                    server_result: true
                };
                resolve(require);
            }
            else {
                const require = {
                    data: res,
                    error: [],
                    query_result: true,
                    server_result: true
                };
                resolve(require);
            }
        });
    });
}

// 2.6 choose seats adn calculate price
Task.getMovieByBooking = function getMovieByBooking(data, seat_parem) {
    return new Promise(function (resolve, reject) {
        var str = "SELECT t1.seat_id, t1.seat_number, t1.showtime_id, t1.booking_id, t2.show_date, t2.show_time,"
        +" (SELECT price FROM tickets WHERE showtime_id = t2.showtime_id) AS price,"
        +" (SELECT price FROM tickets WHERE showtime_id = t2.showtime_id)*(SELECT COUNT(seat_number) FROM seats t1 JOIN showtimes t2 ON t1.showtime_id = t2.showtime_id WHERE t2.showtime_id = (SELECT showtime_id FROM showtimes WHERE movie_id = '" + data.movie_id +"' AND show_date = '" + data.show_date +"' AND show_time = '" + data.show_time +"') AND seat_number IN ('" + seat_parem +"')) AS total_price,"
        +" (SELECT COUNT(seat_number) FROM seats t1 JOIN showtimes t2 ON t1.showtime_id = t2.showtime_id WHERE t2.showtime_id = (SELECT showtime_id FROM showtimes WHERE movie_id = '" + data.movie_id +"' AND show_date = '" + data.show_date +"' AND show_time = '" + data.show_time +"') AND seat_number IN ('" + seat_parem +"')) AS seat_total,"
        +" (SELECT theater_name FROM theaters WHERE theater_id = t2.theater_id) AS theater_name,"
        +" (SELECT movie_name FROM movies WHERE movie_id = t2.movie_id) AS movie_name,"
        +" (SELECT detail FROM movies WHERE movie_id = t2.movie_id) AS movie_detail,"
        +" (SELECT movie_image FROM movies WHERE movie_id = t2.movie_id) AS movie_image"
        +" FROM seats t1"
        +" JOIN showtimes t2 ON t1.showtime_id = t2.showtime_id"
        +" WHERE t2.showtime_id = (SELECT showtime_id FROM showtimes WHERE movie_id = '" + data.movie_id +"' AND show_date = '" + data.show_date +"' AND show_time = '" + data.show_time +"')"
        +" AND t1.seat_number IN ('" + seat_parem +"')"
        sql.query(str, function (err, res) {
            if (err) {
                console.log("error: ", err);
                const require = {
                    data: [],
                    error: err,
                    query_result: false,
                    server_result: true
                };
                resolve(require);
            }
            else {
                const require = {
                    data: res,
                    error: [],
                    query_result: true,
                    server_result: true
                };
                resolve(require);
            }
        });
    });
}

// Validate before Booking
Task.getMovieByCheckBooking = function getMovieByCheckBooking(data, seat_parem, seatId_parem) {
    return new Promise(function (resolve, reject) {
        var str = "SELECT t1.booking_id FROM seats t1"
        +" JOIN showtimes t2 ON t1.showtime_id = t2.showtime_id"
        +" WHERE t2.showtime_id = (SELECT showtime_id FROM showtimes WHERE movie_id = '" + data.movie_id + "' AND show_date = '" + data.show_date + "' AND	show_time = '" + data.show_time + "')"
        +" AND t1.seat_number IN ('" + seat_parem +"')"
        +" AND t1.booking_id <>'' "
        sql.query(str, function (err, res) {
            if (err) {
                console.log("error: ", err);
                const require = {
                    data: [],
                    error: err,
                    query_result: false,
                    server_result: true
                };
                resolve(require);
            }
            else {
                resolve(res);
            }
        });
    });
}

// movie ticket booking
Task.updateMovieByBookingCode = function updateMovieByBookingCode(data, seat_parem, seatId_parem) {
    return new Promise(function (resolve, reject) {
        var str = " UPDATE seats"
        +" SET booking_id = '" + data.booking_id + "' "
        +" WHERE seat_number IN ('" + seat_parem +"') "
        +" AND seat_id IN ('" + seatId_parem +"') "
        console.log("updateMovieByBookingCode>>", str);
        sql.query(str, function (err, res) {
            if (err) {
                console.log("error: ", err);
                const require = {
                    data: [],
                    error: err,
                    query_result: false,
                    server_result: true
                };
                resolve(require);
            }
            else {
                const require = {
                    data: res,
                    error: [],
                    query_result: true,
                    server_result: true
                };
                resolve(require);
            }
        });
    });
}

Task.getLastCode = function getLastCode() {
    return new Promise(function (resolve, reject) {
        var str = "SELECT  IFNULL(CONCAT('M',LPAD( SUBSTRING(max(movie_id), 2, 5)+1,4,'0')), 'M0001')   AS last_code  FROM `movies`";
        sql.query(str, function (err, res) {
            if (err) {
                console.log("error: ", err);
                resolve(err);
            }
            else {
                resolve(res[0].last_code);
            }
        });
    });
}
module.exports = Task;