-- create database Moviebookingdb;

Use Moviebookingdb;

Drop table if exists Bookings; 
Drop table if exists customers; 
Drop table if exists  Showtimes;
Drop table if exists  Theaters;
Drop table if exists  Movies;

Create table Movies 
(
    MovieID Int auto_increment primary key,
    Title varchar(100) Not null,
    Genre Varchar(50),
    Duration Int
);

Create table Theaters 
(
    TheaterID Int auto_increment primary key,
    Name Varchar(100),
    Location Varchar(100),
    TotalSeats int
);
Create table Showtimes
 (
    ShowtimeID Int auto_increment primary key,
    MovieID Int,
    TheaterID int,
    DateTime DATETIME,
    Foreign key (MovieID) references Movies(MovieID),
    Foreign key (TheaterID) references Theaters(TheaterID)
);
create table Customers 
(
	CustomerID int auto_increment primary key,
    name varchar(100) not null,
    email varchar(100) unique

);

create table Bookings
(
	BookingID int auto_increment primary key,
    CustomerID int,
    ShowtimeID int,
    SeatsBooked int,
    foreign key (CustomerID) references Customers(CustomerID),
    foreign key (ShowtimeID) references Showtimes(ShowtimeID)
);




