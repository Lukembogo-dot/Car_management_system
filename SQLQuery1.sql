CREATE TABLE Car (
    CarID INT PRIMARY KEY,
    CarModel VARCHAR(100),
    Manufacturer VARCHAR(100),
    Year INT,
    Color VARCHAR(50),
    RentalRate DECIMAL(10,2),
    Availability VARCHAR(20)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Address VARCHAR(200)
);

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    CarID INT,
    CustomerID INT,
    RentalStartDate DATE,
    RentalEndDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CarID) REFERENCES Car(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

CREATE TABLE Insurance (
    InsuranceID INT PRIMARY KEY,
    CarID INT,
    InsuranceProvider VARCHAR(100),
    PolicyNumber VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
);

CREATE TABLE Location (
    LocationID INT PRIMARY KEY,
    CarID INT,
    LocationName VARCHAR(100),
    Address VARCHAR(200),
    ContactNumber VARCHAR(15),
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
);

CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY,
    CarID INT,
    CustomerID INT,
    ReservationDate DATE,
    PickupDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (CarID) REFERENCES Car(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Maintenance (
    MaintenanceID INT PRIMARY KEY,
    CarID INT,
    MaintenanceDate DATE,
    Description VARCHAR(200),
    Cost DECIMAL(10,2),
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
);


INSERT INTO Car VALUES 
(1, 'Toyota Vitz', 'Toyota', 2020, 'Red', 3000.00, 'Available'),
(2, 'Nissan Note', 'Nissan', 2019, 'Blue', 2800.00, 'Available'),
(3, 'Mazda Demio', 'Mazda', 2021, 'White', 3500.00, 'Unavailable'),
(4, 'Honda Fit', 'Honda', 2022, 'Silver', 4000.00, 'Available'),
(5, 'Subaru Impreza', 'Subaru', 2021, 'Black', 5000.00, 'Unavailable');


INSERT INTO Customer VALUES
(1, 'Luke', 'Mbogo', 'luke@mail.com', '070000001', 'Nairobi'),
(2, 'Mary', 'Wanjiru', 'mary@mail.com', '070000002', 'Thika'),
(3, 'John', 'Otieno', 'john@mail.com', '070000003', 'Kisumu'),
(4, 'Grace', 'Njeri', 'grace@mail.com', '070000004', 'Nakuru'),
(5, 'Paul', 'Kamau', 'paul@mail.com', '070000005', 'Embu');

INSERT INTO Booking VALUES
(1, 2, 1, '2025-09-20', '2025-09-25', 25000),
(2, 3, 2, '2025-09-22', '2025-09-26', 26000),
(3, 1, 3, '2025-09-25', '2025-09-30', 22500),
(4, 4, 4, '2025-09-15', '2025-09-18', 18600),
(5, 5, 5, '2025-09-10', '2025-09-12', 11600);

INSERT INTO Payment VALUES
(1, 1, '2025-09-20', 25000, 'M-Pesa'),
(2, 2, '2025-09-22', 26000, 'Credit Card'),
(3, 3, '2025-09-25', 22500, 'Bank Transfer'),
(4, 4, '2025-09-15', 18600, 'Cash'),
(5, 5, '2025-09-10', 11600, 'M-Pesa');

INSERT INTO Insurance VALUES
(1, 1, 'APA Insurance', 'APA-2025-001', '2025-01-01', '2025-12-31'),
(2, 2, 'Jubilee', 'JUB-2025-002', '2025-02-01', '2026-01-31'),
(3, 3, 'Britam', 'BRIT-2025-003', '2025-03-01', '2026-02-28'),
(4, 4, 'CIC Insurance', 'CIC-2025-004', '2025-04-01', '2026-03-31'),
(5, 5, 'Madison', 'MAD-2025-005', '2025-05-01', '2026-04-30');

INSERT INTO Location VALUES
(1, 1, 'Nairobi Branch', 'Waiyaki Way, Nairobi', '0711222333'),
(2, 2, 'Thika Branch', 'Thika Road, Thika', '0722333444'),
(3, 3, 'Kisumu Branch', 'Oginga Odinga St, Kisumu', '0744555666'),
(4, 4, 'Nakuru Branch', 'Kenyatta Ave, Nakuru', '0700111222'),
(5, 5, 'Mombasa Branch', 'Moi Ave, Mombasa', '0733777888');

INSERT INTO Reservation VALUES
(1, 1, 1, '2025-09-10', '2025-09-15', '2025-09-20'),
(2, 3, 2, '2025-09-12', '2025-09-18', '2025-09-22'),
(3, 4, 3, '2025-09-14', '2025-09-20', '2025-09-25'),
(4, 2, 4, '2025-09-16', '2025-09-21', '2025-09-24'),
(5, 5, 5, '2025-09-18', '2025-09-23', '2025-09-26');

INSERT INTO Maintenance VALUES
(1, 5, '2025-09-05', 'Oil change and engine check', 4500.00),
(2, 2, '2025-08-20', 'Brake replacement', 8000.00),
(3, 4, '2025-08-28', 'Tire rotation and cleaning', 3000.00),
(4, 3, '2025-09-02', 'Engine diagnostics', 5500.00),
(5, 1, '2025-09-10', 'Body polishing', 2500.00);


-- Show all cars and their bookings using inner JOIN
SELECT c.CarModel, b.RentalStartDate, b.RentalEndDate, cu.FirstName
FROM Booking b
JOIN Car c ON b.CarID = c.CarID
JOIN Customer cu ON b.CustomerID = cu.CustomerID;

-- Available cars only
SELECT * FROM Car WHERE Availability = 'Available';

UPDATE Car
SET RentalRate = 3200.00
WHERE CarModel = 'Toyota Vitz';

DELETE FROM Reservation WHERE ReservationID = 3;

SELECT * FROM Reservation;

SELECT * FROM car;