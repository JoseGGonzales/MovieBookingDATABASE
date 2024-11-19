-- Queries to test the data

-- View all movies
SELECT * FROM Movies;

-- View all theaters
SELECT * FROM Theaters;

-- Retrieve showtimes for the movie with MovieID 1 (Inception)
SELECT Showtimes.DateTime, Theaters.Name 
FROM Showtimes
JOIN Theaters ON Showtimes.TheaterID = Theaters.TheaterID
WHERE Showtimes.MovieID = 1;

-- View bookings for a customer (CustomerID 1)
SELECT Movies.Title, Bookings.SeatsBooked, Showtimes.DateTime
FROM Bookings
JOIN Showtimes ON Bookings.ShowtimeID = Showtimes.ShowtimeID
JOIN Movies ON Showtimes.MovieID = Movies.MovieID
WHERE Bookings.CustomerID = 1;

-- View all staff for a specific theater (TheaterID 1)
SELECT Staff.Name, Staff.Role, Staff.HireDate
FROM Staff
WHERE Staff.TheaterID = 1;

-- View reviews for a specific theater (TheaterID 1)
SELECT Customers.Name, Reviews.Rating, Reviews.Comment, Reviews.ReviewDate
FROM Reviews
JOIN Customers ON Reviews.CustomerID = Customers.CustomerID
WHERE Reviews.TheaterID = 1;
