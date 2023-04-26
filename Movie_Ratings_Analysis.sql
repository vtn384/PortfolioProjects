SELECT * 
FROM movies m;

SELECT * 
FROM ratings r;


-- Top 10 Movies w/ Highest Average Ratings
SELECT m.title AS Title, AVG(r.rating) AS Average_Rating
FROM movies m 
JOIN ratings r 
ON m.movieId = r.movieId 
GROUP BY Title
ORDER BY Average_Rating DESC
LIMIT 10;

-- Top 10 Movies that Recieved the Most Ratings
SELECT m.title AS Title, COUNT(r.rating) AS Num_Ratings
FROM movies m 
JOIN ratings r 
ON m.movieId = r.movieId 
GROUP BY Title
ORDER BY Num_Ratings DESC 
LIMIT 10;

-- Average Rating for Each Genre
SELECT m.genres AS Genres, AVG(r.rating) AS Average_Rating
FROM movies m 
JOIN ratings r 
ON m.movieId = r.movieId 
GROUP BY Genres
ORDER BY Average_Rating DESC;

--  Top 10 Genres w/ the Highest Number of Movies
SELECT m.genres AS Genres, COUNT(*) AS Count
FROM movies m 
GROUP BY Genres 
ORDER BY Count DESC
LIMIT 10;
