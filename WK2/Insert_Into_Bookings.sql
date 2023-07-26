USE littlelemondb;

-- Task1: Little Lemon wants to populate the Bookings table of their database with some records of data

INSERT INTO Bookings (BookingID, TableNumber, BookingDate, CustomerID)
VALUES	(1, 5, "2022-10-10", 1),
	(2, 3, "2022-11-12", 3),
	(3, 2, "2022-10-11", 2),
	(4, 2, "2022-10-13", 1);