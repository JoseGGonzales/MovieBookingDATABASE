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

-- insert data into tables
INSERT INTO Movies (Title, Genre, Duration) 
VALUES 
    ('Interstellar', 'Sci-Fi', 169),  
    ('Frozen', 'Animation', 102),    
    ('The Godfather', 'Crime', 175),  
    ('Titanic', 'Romance', 195),    
    ('The Avengers', 'Action', 143), 
    ('The Lion King', 'Animation', 88), 
    ('Joker', 'Drama', 122),  
    ('Toy Story 4', 'Animation', 100), 
    ('Avengers: Endgame', 'Action', 181),  
    ('Black Panther', 'Action', 134);

INSERT INTO Theaters (Name, Location, TotalSeats) 
VALUES 
    ('Cinema 1', 'Westside', 220),    
    ('Cinema 2', 'Eastside', 170),   
    ('Cinema 3', 'Southside', 200),    
    ('Cinema 4', 'Northside', 180),   
    ('Cinema 5', 'Central Park', 300),    
    ('Cinema 6', 'Downtown', 250),
    ('Cinema 7', 'Lakeside', 190),
    ('Cinema 8', 'City Square', 220),  
    ('Cinema 9', 'Uptown',200),
    ('Cinema 10','UHD',180);
    
INSERT INTO Showtimes (MovieID, TheaterID, DateTime)
VALUES 
    (4, 4, '2024-11-22 19:00:00'),    
    (5, 5, '2024-11-22 21:30:00'),    
    (6, 3, '2024-11-23 15:00:00'), 
    (7, 6, '2024-11-23 18:00:00'), 
    (8, 7, '2024-11-24 20:30:00'), 
    (9, 8, '2024-11-25 15:00:00'), 
    (10, 1, '2024-11-25 18:30:00'), 
    (2, 9, '2024-11-25 16:30:00'), 
    (3, 10, '2024-11-26 19:30:00'),
    (1, 9, '2024-11-27 18:00:00');

    
INSERT INTO Customers (Name, Email)
VALUES 
    ('Mike Johnson', 'mike.johnson@fake.com'), 
    ('Sophia Brown', 'sophia.brown@fake.com'),
    ('Daniel White', 'daniel.white@fake.com'),
    ('Emma Watson', 'emma.watson@fake.com'), 
    ('Oliver King', 'oliver.king@fake.com'), 
    ('Amelia Davis', 'amelia.davis@fake.com'), 
    ('Liam Harris', 'liam.harris@fake.com'),
    ('Emily Brown', 'emily.brown@fake.com'), 
    ('Nathan Scott', 'nathan.scott@fake.com'),
    ('Jose Gonzales','Jose.gonzales@fake.com  ');
    
INSERT INTO Bookings (CustomerID, ShowtimeID, SeatsBooked)
VALUES 
    (3, 4, 4),  
    (4, 5, 2),  
    (5, 6, 3),  
    (6, 7, 2),  
    (7, 8, 3),  
    (8, 9, 4),  
    (9, 10, 5), 
    (1, 2, 3),
    (3, 6, 7),
    (2, 3, 4);
    
INSERT INTO Staff (Name, Role, TheaterID, HireDate)
VALUES 
    ('Alice Johnson', 'Manager', 1, '2023-05-01'),
    ('Bob Smith', 'Technician', 2, '2023-06-15'),
    ('Claire Lee', 'Cashier', 3, '2024-01-10'),
    ('Emily Davis', 'Manager', 4, '2022-12-01'),
    ('James Wilson', 'Cleaner', 5, '2023-03-10'),
    ('Karen Scott', 'Cashier', 6, '2024-02-15'),
    ('Jack Brown', 'Technician', 7, '2023-04-01'),
    ('Chloe Green', 'Manager', 8, '2022-08-15'),
    ('Lucas Gray', 'Cashier', 9, '2024-03-12'),
    ('Ethan Hall', 'Projectionist', 10, '2023-07-01');

    
INSERT INTO Reviews (CustomerID, TheaterID, Rating, Comment, ReviewDate)
VALUES 
    (1, 1, 5, 'Great experience, clean and well-maintained!', '2024-11-18 14:30:00'),
    (2, 2, 4, 'Good service but seats were a bit uncomfortable.', '2024-11-18 16:00:00'),
    (3, 3, 5, 'Excellent movie and theater ambiance!', '2024-11-19 13:00:00'),
    (4, 4, 3, 'Average experience, could be better.', '2024-11-19 15:30:00'),
    (5, 5, 4, 'Great movie selection and snacks.', '2024-11-19 18:00:00'),
    (6, 6, 4, 'Seats were comfortable but sound was too loud.', '2024-11-19 19:00:00'),  
    (7, 7, 3, 'Theater was too cold, but movie was great.', '2024-11-20 14:30:00'),  
    (8, 8, 5, 'Amazing! Highly recommend this theater.', '2024-11-21 11:00:00'),  
    (9, 1, 4, 'Good service and clean theater.', '2024-11-21 15:00:00'),
    (2, 10, 5, 'Best cinematic experience I\'ve had!', '2024-11-22 20:30:00');   

