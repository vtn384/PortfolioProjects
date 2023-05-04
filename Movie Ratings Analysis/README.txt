This SQL code analyzes movie ratings data by querying two tables: movies and ratings.

The movies table contains information about movies, including the movie ID, title, and genres. 
The ratings table contains information about user ratings of movies, including the user ID, movie ID, rating, and timestamp.


The following queries were executed to analyze the movie ratings data:

SELECT * FROM movies m;: This query retrieves all rows from the movies table.

SELECT * FROM ratings r;: This query retrieves all rows from the ratings table.

SELECT m.title AS Title, AVG(r.rating) AS Average_Rating FROM movies m JOIN ratings r ON m.movieId = r.movieId GROUP BY Title ORDER BY Average_Rating DESC LIMIT 10;: This query retrieves the top 10 movies with the highest average ratings. It uses a join to combine information from the movies and ratings tables, groups the data by movie title, calculates the average rating for each movie, and sorts the results in descending order by average rating.

SELECT m.title AS Title, COUNT(r.rating) AS Num_Ratings FROM movies m JOIN ratings r ON m.movieId = r.movieId GROUP BY Title ORDER BY Num_Ratings DESC LIMIT 10;: This query retrieves the top 10 movies that received the most ratings. It uses a join to combine information from the movies and ratings tables, groups the data by movie title, counts the number of ratings for each movie, and sorts the results in descending order by number of ratings.

SELECT m.genres AS Genres, AVG(r.rating) AS Average_Rating FROM movies m JOIN ratings r ON m.movieId = r.movieId GROUP BY Genres ORDER BY Average_Rating DESC;: This query retrieves the average rating for each genre. It uses a join to combine information from the movies and ratings tables, groups the data by genre, calculates the average rating for each genre, and sorts the results in descending order by average rating.

SELECT m.genres AS Genres, COUNT(*) AS Count FROM movies m GROUP BY Genres ORDER BY Count DESC LIMIT 10;: This query retrieves the top 10 genres with the highest number of movies. It retrieves the genre and the count of movies in each genre from the movies table, groups the data by genre, counts the number of movies in each genre, and sorts the results in descending order by count.
