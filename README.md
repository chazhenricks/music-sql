# Introduction to SQL with Music History

## Setup

mkdir -p ~/workspace/csharp/exercises/music-sql && cd $_
touch queries.sql
Note: The .sql extension is common practice for files storing SQL queries
Installation of SQLite (if needed)

To get started, type the following command to check if you already have SQLite installed.

$ sqlite3
And you should see:
```
SQLite version 3.7.15.2 2014-08-15 11:53:05
Enter ".help" for instructions
Enter SQL statements terminated with a ";"
sqlite>
```
If you do not see above result, then it means you do not have SQLite installed on your machine. Follow the appropriate instructions below.


Download the musichistory.db file, and then copy it to the folder that you created for this exercise. That file is the database. It contains all of the tables and data.

## Instructions

Open up the database file in the DB Browser for SQLite application to see it.
Go ahead and click around a little bit to familarize yourself with the database.
When you're ready to start the exercise, click the tab labeled "Execute SQL", type in your query and run it.
For each of the following exercises, provide the appropriate query. Yes, even the ones that are expressed in the form of questions. Everything from class and the Sqlite documentation for SQL keywords and functions is fair game.

1. Query all of the entries in the Genre table

1. Using the INSERT statement, add one of your favorite artists to the Artist table.

1. Using the INSERT statement, add one, or more, albums by your artist to the Album table.

1. Using the INSERT statement, add some songs that are on that album to the Song table.

1. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

_Reminder: Direction of join matters. Try the following statements and see the difference in results.
SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;_

1. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

1. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

1. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

1. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

1. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

1. Modify the previous query to also display the title of the album.