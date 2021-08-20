---------Creating Database---------
create database SpotifyApp
---------Creating Table--------
create table UsersProfile
(
  Id int identity(1,1) primary key,
  Username varchar(50),
  Country varchar(100),
  Email varchar(200)
)
--------inserting data-----------
insert into UsersProfile values('Lavanya','IN','Lavanya@gmail.com'),('Sai','IN','Sai@gmail.com'),('Lalitha','IN','Lalitha@gmail.com')
--------Retreiving Details--------
select * from UsersProfile;
-------Creating table for Playlist---------
create table Playlist_Table
(
 Id int ,
 Playlist_Id int identity (1,1) primary key,
 Playlist_Name varchar(50),
 foreign key (Id) references UsersProfile(Id),
)
---------INSERTING dETAILS-------
insert into Playlist_Table values(1,'Playlist1'),(2,'Playlist2'),(3,'Playlist3')
---------Retreiving Details-------
select * from Playlist_Table
----------Joins----------
select Username,Country,Email,Playlist_Name
from UsersProfile
INNER JOIN Playlist_Table on UsersProfile.Id= Playlist_Table.Id
Where Country='IN' order By(Email)
------Table for tracks--------
create table Tracks
(
  Id int ,
  Playlist_Id int,
  Track_Name varchar(50)
  foreign key (Id) references UsersProfile(Id),
  foreign key (Playlist_Id) references Playlist_Table(Playlist_Id)
)
------Inserting Details--------
insert into Tracks values(1,1,'Hello'),(2,2,'Hey'),(3,3,'Hi')
-------Retreiving Data---------
select * from Tracks
--------Joins--------
select Username,Country,Email,Playlist_Name,Track_Name 
from UsersProfile
Full JOIN Playlist_Table on UsersProfile.ID=Playlist_Table.ID 
Full JOIN Tracks on UsersProfile.ID=Tracks.ID where Username='Lavanya'