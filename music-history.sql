select * 
from Genre;
select * 
from Artist;
select * 
from Album;
select * 
from Song;

--Query all the enteries in the Genre Table

select g.Label, g.GenreId
from Genre g;

--Using the INSERT statement, add one of your favorite artist to the Artist table. 
insert into Artist
values(null, "The Rolling Stones", 1963);
insert into Artist(ArtistName, YearEstablished)
values("AC/DC", 1973);


--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
insert into Album
values(null, "Exile On Main St", 1971, 50, "Rolling Stones", 28,2);

--Using the INSERT statement, add some songs that are on that album to the Song table.
insert into Song
values(null,"Tumblin Dice", 3, 1971, 2, 28,23 );


select Title
from Album 
where artistId = 1
and Title = "Point of Entry";


select a.ArtistName, al.Title
from Artist a, Album al
where a.ArtistId = al.ArtistId
order by al.ReleaseDate desc;

/*Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.*/


select s.Title as "Song Title", al.Title as "Album Title", a.ArtistName as "Artist"
from Song s, Album al, Artist a
where s.AlbumId = al.AlbumId
and s.ArtistId = a.ArtistId;


select s.Title as "Song Title", al.Title as "Album Title", a.ArtistName as "Artist"
from Song s
left join Album al
on s.AlbumId = al.AlbumId
left join Artist a
on s.ArtistId = a.ArtistId


--Displays all albums, regardless of of there is a song associated with it. 
select s.Title as "Song",
		al.Title as "Album"
from Album al
left join Song s on s.AlbumId = al.AlbumId;


--Displays all albums that do not have a song. 
select s.Title as "Song",
		al.Title as "Album"
from Album al
left join Song s on s.AlbumId = al.AlbumId
where s.Title IS NULL;






/*Write a SELECT statement to display how many songs exist for each album. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/

select al.Title, count(s.AlbumId) as "Number Of Tracks"
from Album al, Song s
where al.AlbumId = s.AlbumId
group by al.Title;

--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

select a.ArtistName as "Artist", count(s.ArtistId) as "Number of Tracks"
from Artist a, Song s
where a.ArtistId = s.ArtistId
group by a.ArtistName;






--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

select g.Label as "Genre", count(s.GenreId) as "Number of Tracks"
from Genre g , Song s
where g.GenreId = s.GenreId
group by g.Label; 



--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

select al.Title as "Album" , a.ArtistName as "Artist", al.AlbumLength as "Duration"
from Album al, Artist a
where al.AlbumLength = (SELECT max(al.AlbumLength) from Album al)
and al.ArtistId = a.ArtistId;


--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

select s.Title as "Song Title", a.ArtistName as "Artist", s.SongLength as "Duration"
from Song s, Artist a
where s.SongLength = (SELECT max(s.SongLength) from Song s)
and s.ArtistId = a.ArtistId;


--Modify the previous query to also display the title of the album.

select s.Title as "Song Title", a.ArtistName as "Artist", al.Title as "Album", s.SongLength as "Duration"
from Song s, Artist a, Album al
where s.SongLength = (SELECT max(s.SongLength) from Song s)
and s.ArtistId = a.ArtistId
and s.AlbumId = al.AlbumId;
