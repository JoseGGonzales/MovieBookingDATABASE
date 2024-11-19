-- Create database 
-- CREATE DATABASE MovieBookingSystem;
USE MovieBookingSystem;

-- Drop tables if they already exist
DROP TABLE IF EXISTS Bookings, Reviews, Customers, Showtimes, Staff, Theaters, Movies;

-- Now create the tables
CREATE TABLE Movies (
    MovieID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Genre VARCHAR(100),
    Duration INT
);

CREATE TABLE Theaters (
    TheaterID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Location VARCHAR(255),
    TotalSeats INT NOT NULL
);

CREATE TABLE Showtimes (
    ShowtimeID INT AUTO_INCREMENT PRIMARY KEY,
    MovieID INT,
    TheaterID INT,
    DateTime DATETIME,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID)
);

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    ShowtimeID INT,
    SeatsBooked INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ShowtimeID) REFERENCES Showtimes(ShowtimeID)
);

CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Role VARCHAR(100), -- e.g., Manager, Cashier, Cleaner
    TheaterID INT,
    HireDate DATE NOT NULL,
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID)
);

CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    TheaterID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5), -- Ratings from 1 to 5
    Comment TEXT,
    ReviewDate DATETIME NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID)
);

-- Insert sample movies into the Movies table
INSERT INTO Movies (Title, Genre, Duration) 
VALUES 
    ('Inception', 'Sci-Fi', 148),  
    ('Avatar', 'Action', 162),     
    ('The Dark Knight', 'Action', 152); 

-- Insert sample theaters into the Theaters table
INSERT INTO Theaters (Name, Location, TotalSeats) 
VALUES 
    ('Cinema 1', 'Downtown', 200),    
    ('Cinema 2', 'Uptown', 150),      
    ('Cinema 3', 'Midtown', 180);     

-- Insert sample showtimes into the Showtimes table
INSERT INTO Showtimes (MovieID, TheaterID, DateTime)
VALUES 
    (1, 1, '2024-11-20 18:30:00'),    
    (2, 2, '2024-11-20 20:30:00'),    
    (3, 3, '2024-11-21 17:00:00');    

-- Insert sample customers into the Customers table
INSERT INTO Customers (Name, Email)
VALUES 
    ('John Doe', 'john.doe@example.com'), 
    ('Jane Smith', 'jane.smith@example.com');  

-- Insert sample bookings into the Bookings table
INSERT INTO Bookings (CustomerID, ShowtimeID, SeatsBooked)
VALUES 
    (1, 1, 2),  
    (2, 2, 3);  

-- Insert sample staff into the Staff table
INSERT INTO Staff (Name, Role, TheaterID, HireDate)
VALUES 
    ('Alice Johnson', 'Manager', 1, '2023-05-01'),
    ('Bob Smith', 'Technician', 2, '2023-06-15'),
    ('Claire Lee', 'Cashier', 3, '2024-01-10');

-- Insert sample reviews into the Reviews table
INSERT INTO Reviews (CustomerID, TheaterID, Rating, Comment, ReviewDate)
VALUES 
    (1, 1, 5, 'Great experience, clean and well-maintained!', '2024-11-18 14:30:00'),
    (2, 2, 4, 'Good service but seats were a bit uncomfortable.', '2024-11-18 16:00:00');


