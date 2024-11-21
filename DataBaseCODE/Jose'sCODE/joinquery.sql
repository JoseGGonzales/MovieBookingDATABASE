-- 1. Join Movies and Showtimes to get movie titles with their associated showtimes
SELECT Movies.Title, Showtimes.DateTime
FROM Movies
JOIN Showtimes ON Movies.MovieID = Showtimes.MovieID;

-- 2. Join Showtimes and Theaters to get showtimes with theater names and locations
SELECT Showtimes.DateTime, Theaters.Name AS TheaterName, Theaters.Location
FROM Showtimes
JOIN Theaters ON Showtimes.TheaterID = Theaters.TheaterID;

-- 3. Join Customers and Bookings to get customer names with their booking details
SELECT Customers.Name AS CustomerName, Bookings.SeatsBooked
FROM Customers
JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID;

-- 4. Join Bookings and Showtimes to get booking details along with the showtimes
SELECT Bookings.SeatsBooked, Showtimes.DateTime
FROM Bookings
JOIN Showtimes ON Bookings.ShowtimeID = Showtimes.ShowtimeID;

-- 5. Join Staff and Theaters to get staff details along with their assigned theaters
SELECT Staff.Name AS StaffName, Theaters.Name AS TheaterName
FROM Staff
JOIN Theaters ON Staff.TheaterID = Theaters.TheaterID;

-- 6. Join Customers and Reviews to get customer reviews and their ratings
SELECT Customers.Name AS CustomerName, Reviews.Rating, Reviews.Comment
FROM Customers
JOIN Reviews ON Customers.CustomerID = Reviews.CustomerID;

-- 7. Join Reviews and Theaters to get reviews with the theater names and ratings
SELECT Reviews.Rating, Reviews.Comment, Theaters.Name AS TheaterName
FROM Reviews
JOIN Theaters ON Reviews.TheaterID = Theaters.TheaterID;
