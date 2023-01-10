# nodejs-server-api-movie
How to install
-
-git clone https://github.com/mild2540mike/nodejs-server-api-movie.git
-cd ./nodejs-server-api-movie
-npm i && npm i nodemon -g
-nodemon server.js


Share api postman https://api.postman.com/collections/17305107-ccdfd7e6-846c-4381-8b6a-97accf973480?access_key=PMAT-01GPE88RCV3PJRDYK9MZF00X8M

1) Get movie List.
POST http://localhost:8080/movie/getMovieBy
===================================================================================================================================
2.1) Choose a Movie
POST http://localhost:8080/movie/getMovieByMovieCode
{
    "movie_id": "M0001"
}
2.2) Redirect Booking
POST http://localhost:8080/movie/getMovieByDate

2.3) choose date
http://localhost:8080/movie/getMovieByDate
{
    "movie_id": "M0002"
}

2.4) 
POST 
===================================================================================================================================
3) Cancel booking.

===================================================================================================================================
4) Show available seat.

===================================================================================================================================
5) How to manage many traffic.
