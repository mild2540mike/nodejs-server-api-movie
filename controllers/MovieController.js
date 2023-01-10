var MovieModel = require('../models/MovieModel');

var Task = function (task) {
    this.task = task.task;
};
// 1 list all movies
Task.getMovieBy = async function getMovieBy(data, result) {
    var MovieList = await MovieModel.getMovieBy(data);
    result(MovieList);
}
// 2.1 Redirect Booking
Task.getMovieByMovieCode = async function getMovieByMovieCode(data, result) {
    var Movie = await MovieModel.getMovieByMovieCode(data);
    result(Movie);
}
// 2.2 Select Date
Task.getMovieByDate = async function getMovieByDate(data, result) {
    var Movie = await MovieModel.getMovieByDate(data);
    result(Movie);
}
// 2.3 Select Theater
Task.getMovieByTheater = async function getMovieByTheater(data, result) {
    var Movie = await MovieModel.getMovieByTheater(data);
    result(Movie);
}
// 2.4 Select Time 
Task.getMovieByTime = async function getMovieByTime(data, result) {
    var Movie = await MovieModel.getMovieByTime(data);
    result(Movie);
}
// 2.5 display screen choose seats
Task.getMovieByScreen = async function getMovieByScreen(data, result) {
    var Movie = await MovieModel.getMovieByScreen(data);
    result(Movie);
}
// 2.6 choose seats adn calculate price
Task.getMovieByBooking = async function getMovieByBooking(data, result) {
    var seat_parem = data.seat_number.join("','").toString();
    var Movie = await MovieModel.getMovieByBooking(data, seat_parem);
    result(Movie);
}
// How to manage many traffic.
Task.updateMovieByBookingCode = async function updateMovieByBookingCode(data, result) {
    var seat_parem = data.seat_number.join("','").toString();
    var seatId_parem = data.seat_id.join("','").toString();
    var res = await MovieModel.getMovieByCheckBooking(data, seat_parem, seatId_parem);
    
    function isObjectEmpty(res) {
        return Object.keys(res).length === 0;
    }
    if (isObjectEmpty(res)) {
        var response = await MovieModel.updateMovieByBookingCode(data, seat_parem, seatId_parem);
        result(response);
    } else {
        const require = {
            data: "Not available because duplicate ticket booking",
            error: [],
            query_result: false,
            server_result: true
        };
        result(require);
    }
}

module.exports = Task;