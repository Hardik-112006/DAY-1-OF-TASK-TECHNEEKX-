CREATE DATABASE IF NOT EXISTS spotifyclone;

USE spotifyclone;

CREATE TABLE users(
user_id INT PRIMARY KEY NOT NULL,
user_name VARCHAR(50),
email VARCHAR(50) UNIQUE
);

INSERT INTO users
VALUES
(1,'alice@gmail.com','Alice'),
(2,'bob@gmail.com','Bob'),
(3,'charlie@gmail.com','Charlie');

CREATE TABLE Artist (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(100),
    genre VARCHAR(50)
);

INSERT INTO Artist VALUES
(101,'Arijit Singh','Romantic'),
(102,'Shreya Ghoshal','Melody'),
(103,'Atif Aslam','Pop');

CREATE TABLE Songs (
    song_id INT PRIMARY KEY,
    song_name VARCHAR(100),
    language VARCHAR(50),
    genre VARCHAR(50),
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

INSERT INTO Songs VALUES
(1001,'Tum Hi Ho','Hindi','Romantic',101),
(1002,'Raabta','Hindi','Romantic',101),
(1003,'Sun Raha Hai','Hindi','Melody',102),
(1004,'Jeena Jeena','Hindi','Pop',103);

CREATE TABLE Playlist (
    playlist_id INT PRIMARY KEY,
    playlist_name VARCHAR(100),
    song_count INT
);

INSERT INTO Playlist VALUES
(201,'Love Songs',2),
(202,'Road Trip',2),
(203,'Favorites',3);

CREATE TABLE Listen_To (
    user_id INT,
    song_id INT,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

INSERT INTO Listen_To VALUES
(1,1001),
(1,1002),
(2,1001),
(2,1004),
(3,1002),
(3,1003);

CREATE TABLE Playlist_Song (
    playlist_id INT,
    song_id INT,
    PRIMARY KEY (playlist_id, song_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

INSERT INTO Playlist_Song VALUES
(201,1001),
(201,1002),
(202,1003),
(202,1004),
(203,1001),
(203,1002),
(203,1004);

SELECT * FROM Users;
SELECT * FROM Artist;
SELECT * FROM Songs;
SELECT * FROM Playlist;
SELECT * FROM Listen_To;
SELECT * FROM Playlist_Song;