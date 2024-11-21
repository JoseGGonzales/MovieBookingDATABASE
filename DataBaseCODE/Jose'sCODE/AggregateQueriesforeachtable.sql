-- 1. Aggregate Query for Movies: Count total number of movies
SELECT COUNT(*) AS TotalMovies FROM Movies;

-- 2. Aggregate Query for Theaters: Average number of seats across theaters
SELECT AVG(TotalSeats) AS AverageSeats FROM Theaters;

-- 3. Aggregate Query for Showtimes: Count total showtimes scheduled
SELECT COUNT(*) AS TotalShowtimes FROM Showtimes;

-- 4. Aggregate Query for Customers: Count total customers
SELECT COUNT(*) AS TotalCustomers FROM Customers;

-- 5. Aggregate Query for Bookings: Sum of all seats booked
SELECT SUM(SeatsBooked) AS TotalSeatsBooked FROM Bookings;

-- 6. Aggregate Query for Staff: Count total staff members
SELECT COUNT(*) AS TotalStaff FROM Staff;

-- 7. Aggregate Query for Reviews: Average rating across all reviews
SELECT AVG(Rating) AS AverageRating FROM Reviews;
