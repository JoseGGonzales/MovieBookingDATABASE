-- Use Case: Insert New Movie
-- A new movie has recently been released. Add the information about the movie to the database.
INSERT INTO Movies (Title, Genre, Duration) VALUES
('Finding nemo', 'fantasy', 169);

-- Use case: delete movie
DELETE FROM Movies WHERE MovieID = 14;

-- Use Case: Insert New Showtime
-- A new time slot for the movie has become available. Add the new showtime for the movie in the database.

-- First, retrieve the MovieID for 'Interstellar'
SELECT MovieID INTO @MovieID FROM Movies WHERE Title = 'Interstellar';

-- Assume the showtime is at '2023-11-05 20:00:00' at 'Central Cinema' (TheaterID = 1)
INSERT INTO Showtimes (MovieID, TheaterID, DateTime) VALUES
(@MovieID, 1, '2023-11-05 20:00:00');

-- Use Case: Insert New Booking
-- Customers are interested in booking a showtime for a movie. Add a booking for a movie at any time slot in the database.

-- Assume CustomerID = 1 (John Doe) wants to book 2 seats for the new showtime

-- First, retrieve the ShowtimeID for the new showtime
SELECT ShowtimeID INTO @ShowtimeID FROM Showtimes
WHERE MovieID = @MovieID AND TheaterID = 1 AND DateTime = '2023-11-05 20:00:00';

-- Insert the booking into the Bookings table
INSERT INTO Bookings (CustomerID, ShowtimeID, SeatsBooked) VALUES
(1, @ShowtimeID, 2);

-- Use Case: Update Movie Details
-- A movie has incorrect details or some details may have changed. Update the details for this movie in the database.

-- Assuming MovieID is known (e.g., MovieID = @MovieID)
UPDATE Movies
SET Genre = 'Adventure, Drama, Sci-Fi', Duration = 169
WHERE MovieID = @MovieID;

-- Use Case: Delete Booking
-- Customer has accidentally made a booking for the wrong time. Delete the booking for that showtime in the database.

-- Assume BookingID = 5 is the incorrect booking
DELETE FROM Bookings
WHERE BookingID = 5;

-- Or delete based on CustomerID and ShowtimeID
DELETE FROM Bookings
WHERE CustomerID = 1 AND ShowtimeID = @ShowtimeID;

-- Use Case: Generate Report on Showtimes
-- Admin wants to look at a report for all the showtimes. Display a report for the time slots for the movies in the database.

SELECT
    S.ShowtimeID,
    M.Title AS MovieTitle,
    T.Name AS TheaterName,
    S.DateTime
FROM
    Showtimes S
JOIN Movies M ON S.MovieID = M.MovieID
JOIN Theaters T ON S.TheaterID = T.TheaterID
ORDER BY
    S.DateTime, M.Title;

-- Use Case: Retrieve Available Seats for Showtime
-- Customer wants to view the available seats for a particular showtime. Display the available seats for that showtime in the database.

-- Assume the customer is interested in ShowtimeID = @ShowtimeID

SELECT
    S.ShowtimeID,
    M.Title AS MovieTitle,
    T.Name AS TheaterName,
    T.TotalSeats,
    IFNULL(B.TotalBookedSeats, 0) AS SeatsBooked,
    T.TotalSeats - IFNULL(B.TotalBookedSeats, 0) AS AvailableSeats
FROM
    Showtimes S
JOIN Movies M ON S.MovieID = M.MovieID
JOIN Theaters T ON S.TheaterID = T.TheaterID
LEFT JOIN (
    SELECT ShowtimeID, SUM(SeatsBooked) AS TotalBookedSeats
    FROM Bookings
    GROUP BY ShowtimeID
) B ON S.ShowtimeID = B.ShowtimeID
WHERE
    S.ShowtimeID = @ShowtimeID;

-- Use Case: Add New Staff Member
-- Add a new staff member to the database.
INSERT INTO Staff (Name, Role, TheaterID, HireDate)
VALUES ('Juan Carlos', 'Manager', 1, '2023-12-01');

-- Use Case: Update Staff Member Role
-- Update the role of an existing staff member.
UPDATE Staff
SET Role = 'Senior Manager'
WHERE StaffID = 3;

-- Use Case: View Reviews for a Theater
-- Retrieve reviews for a particular theater.
SELECT
    Customers.Name AS CustomerName,
    Reviews.Rating,
    Reviews.Comment,
    Reviews.ReviewDate
FROM Reviews
JOIN Customers ON Reviews.CustomerID = Customers.CustomerID
WHERE Reviews.TheaterID = 1
ORDER BY Reviews.ReviewDate DESC;
