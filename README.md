# nodejs-server-api-movie
How to install
-
-git clone https://github.com/mild2540mike/nodejs-server-api-movie.git
-cd ./nodejs-server-api-movie
-npm i && npm i nodemon -g
-nodemon server.js


Share api postman https://api.postman.com/collections/17305107-ccdfd7e6-846c-4381-8b6a-97accf973480?access_key=PMAT-01GPE88RCV3PJRDYK9MZF00X8M

Get movie List.
POST http://localhost:8080/movie/getMovieBy
===================================================================================================================================
Choose a Movie
POST http://localhost:8080/movie/getMovieByMovieCode
{
    "movie_id": "M0001"
}

Redirect Booking
POST http://localhost:8080/movie/getMovieByDate

choose date
http://localhost:8080/movie/getMovieByDate
{
    "movie_id": "M0002"
}

choose Theater
POST http://localhost:8080/movie/getMovieByTheater
{
     "movie_id": "M0002",
     "show_date": "2023-01-10"
}

choose Time
POST http://localhost:8080/movie/getMovieByTime
{
     "movie_id": "M0002",
     "show_date": "2023-01-10"
}

display screen choose seats
POST http://localhost:8080/movie/getMovieByScreen
{
     "movie_id": "M0002",
     "show_date": "2023-01-10",
     "show_time": "11:30:00"
}

choose seats Call price
POST http://localhost:8080/movie/getMovieByBooking
{
     "movie_id": "M0002",
     "show_date": "2023-01-10",
     "show_time": "11:30:00",
     "seat_number": ["A1", "A2","A3","A4","A5","A6","A7"]
}

Booking ticket
POST http://localhost:8080/movie/updateMovieByBookingCode
{
     "movie_id": "M0002",
     "show_date": "2023-01-10",
     "show_time": "11:30:00",
     "seat_number": ["A4", "A3", "A7"],
     "seat_id": ["SE0004", "SE0003", "SE0007"],
     "booking_id": "B0002"
}
