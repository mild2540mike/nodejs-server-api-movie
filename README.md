# nodejs-server-api-movie
How to install
-
-git clone https://github.com/mild2540mike/nodejs-server-api-movie.git
-cd ./nodejs-server-api-movie
-npm i && npm i nodemon -g
-nodemon server.js


Share api postman https://api.postman.com/collections/17305107-ccdfd7e6-846c-4381-8b6a-97accf973480?access_key=PMAT-01GPE88RCV3PJRDYK9MZF00X8M

1) Get movie List.
http://localhost:8080/movie/getMovieBy

Respone with a list of movies
{
    "data": [
        {
            "movie_id": "M0001",
            "movie_name": "The Avengers",
            "release_date": "2022-12-31T17:00:00.000Z",
            "duration": "01:10:00",
            "director": "Joss Whedon",
            "actors": "Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson",
            "movie_image": "movie/f857a736-4cf3-4f3c-9acf-0671a790ef7f.jpg"
        },
        {
            "movie_id": "M0002",
            "movie_name": "Harry Potter and the Deathly Hallows: Part 2",
            "release_date": "2022-12-31T17:00:00.000Z",
            "duration": "02:00:00",
            "director": "David Yates",
            "actors": "Daniel Radcliffe, Rupert Grint, Emma Watson, Ralph Fiennes, Michael Gambon",
            "movie_image": "movie/f857a736-4cf3-4f3c-9acf-0671a790ef7f.jpg"
        }
    ],
    "error": [],
    "query_result": true,
    "server_result": true
}
===================================================================================================================================

2) Booking ticket.

2.1) Choose a Movie
http://localhost:8080/movie/getMovieByMovieCode

{
    "movie_id": "M0001"
}

Respone with a one movie booking
{
    "data": [
        {
            "movie_id": "M0001",
            "movie_name": "The Avengers",
            "release_date": "2022-12-31T17:00:00.000Z",
            "duration": "01:10:00",
            "director": "Joss Whedon",
            "actors": "Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson",
            "movie_image": "movie/f857a736-4cf3-4f3c-9acf-0671a790ef7f.jpg"
        }
    ],
    "error": [],
    "query_result": true,
    "server_result": true
}

2.2) Choose a Movie Show date
http://localhost:8080/movie/getMovieByDate

{
    "movie_id": "M0001",
    "show_date": "2023-01-09"
}

Respone with a one movie show date booking  

===================================================================================================================================

3) Cancel booking.


===================================================================================================================================
4) Show available seat.

===================================================================================================================================
5) How to manage many traffic.

