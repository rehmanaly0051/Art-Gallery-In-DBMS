create database artgallery;
use artgallery;

-- Artwork table
CREATE TABLE Artwork (
  ArtworkID INT,
  Title VARCHAR(255) NOT NULL,
  Artist VARCHAR(255) NOT NULL,
  Medium_ VARCHAR(255),
  Dimensions VARCHAR(255),
  CreationYear int,
  Price DECIMAL(10, 2),
  Availability VARCHAR(50),
  primary key (ArtworkID)
);

-- Insert sample values into Artwork table
INSERT INTO Artwork (ArtworkID,Title, Artist, Medium_, Dimensions, CreationYear, Price, Availability)
VALUES
  (1,'The Starry Night', 'Vincent van Gogh', 'Oil on canvas', '73.7 cm × 92.1 cm', 1889, 2000000.00, 'Available'),
  (2,'Mona Lisa', 'Leonardo da Vinci', 'Oil on poplar panel', '77 cm × 53 cm', 1503, 10000000.00, 'Sold'),
  (3,'The Persistence of Memory', 'Salvador Dalí', 'Oil on canvas', '24 cm × 33 cm', 1931, 3000000.00, 'Available'),
  (4,'Guernica', 'Pablo Picasso', 'Oil on canvas', '349 cm × 776 cm', 1937, 5000000.00, 'Available'),
  (5,'The Scream', 'Edvard Munch', 'Oil, tempera, and pastel on cardboard', '91 cm × 73.5 cm', 1893, 1500000.00, 'Available'),
  (6,'Water Lilies', 'Claude Monet', 'Oil on canvas', '130 cm × 200 cm', 1916, 4000000.00, 'Sold'),
  (7,'The Birth of Venus', 'Sandro Botticelli', 'Tempera on canvas', '172.5 cm × 278.5 cm', 1486, 8000000.00, 'Available'),
  (8,'The Last Supper', 'Leonardo da Vinci', 'Tempera on gesso, pitch, and mastic', '460 cm × 880 cm', 1498, 12000000.00, 'Available'),
  (9,'Les Demoiselles d''Avignon', 'Pablo Picasso', 'Oil on canvas', '243.9 cm × 233.7 cm', 1907, 7000000.00, 'Sold'),
  (10,'The Birth of Adam', 'Michelangelo', 'Fresco', '280 cm × 570 cm', 1511, 9000000.00, 'Available');

-- Artist table
CREATE TABLE Artist (
  ArtistID INT,
  artworkID INT,
  name VARCHAR(255) NOT NULL,
  Address VARCHAR(255),
  Nationality VARCHAR(255),
  StyleGenre VARCHAR(255),
  Birthdate DATE,
  PRIMARY KEY (ArtistID),
  FOREIGN KEY (artworkID) REFERENCES artwork(artworkID)
);


-- Insert sample values into Artist table
INSERT INTO Artist(ArtistID,artworkID, Name, Address, Nationality, StyleGenre, Birthdate)
VALUES
  (1,1,'Vincent van Gogh', 'Netherlands', 'Dutch', 'Post-Impressionism', '1853-03-30'),
  (2,3,'Leonardo da Vinci', 'Italy', 'Italian', 'Renaissance', '1452-04-15'),
  (3,4,'Salvador Dalí', 'Spain', 'Spanish', 'Surrealism', '1904-05-11'),
  (4,5,'Pablo Picasso', 'Spain', 'Spanish', 'Cubism', '1881-10-25'),
  (5,7,'Edvard Munch', 'Norway', 'Norwegian', 'Expressionism', '1863-12-12'),
  (6,8,'Claude Monet', 'France', 'French', 'Impressionism', '1840-11-14'),
  (7,2,'Sandro Botticelli', 'Italy', 'Italian', 'Early Renaissance', '1445-03-01'),
  (8,9,'Michelangelo', 'Italy', 'Italian', 'High Renaissance', '1475-03-06'),
  (9,6,'jonathan', 'Italy', 'Italian', 'High Renaissance', '1475-03-07'),
  (10,10,'jack', 'france', 'french', 'Cubism', '1476-02-03');

-- Collector table
CREATE TABLE Collector (
  CollectorID INT,
  ArtworkID INT,
  Name VARCHAR(255) NOT NULL,
  Address VARCHAR(255),
  PhoneNumber VARCHAR(20),
  DateOfBirth DATE,
  PRIMARY KEY (CollectorID),
  FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID) 
);

-- Insert sample values into Collector table
INSERT INTO Collector (CollectorID,ArtworkID,Name, Address, PhoneNumber, DateOfBirth)
VALUES
  (1,2,'John Smith', '123 Main St, New York', '555-1234', '1978-09-15'),
  (2,3,'Emily Johnson', '456 Elm St, Los Angeles', '555-5678', '1985-07-27'),
  (3,4,'Michael Davis', '789 Oak St, Chicago', '555-9012', '1992-03-10'),
  (4,5,'Sarah Wilson', '321 Pine St, San Francisco', '555-3456', '1972-11-02'),
  (5,6,'Robert Thompson', '987 Maple St, Miami', '555-7890', '1988-06-19'),
  (6,7,'Laura Martinez', '654 Birch St, Houston', '555-2345', '1980-12-31'),
  (7,8,'Daniel Lee', '234 Cedar St, Seattle', '555-6789', '1995-04-08'),
  (8,9,'Jennifer Adams', '876 Walnut St, Boston', '555-0123', '1975-10-14'),
  (9,10,'William Harris', '543 Ash St, Denver', '555-4567', '1982-02-22'),
  (10,1,'Michelle Clark', '210 Spruce St, Atlanta', '555-8901', '1990-08-07');

-- Exhibition table
CREATE TABLE Exhibition (
  ExhibitionID INT,
  ArtworkID INT,
  ArtistID INT,
  Title VARCHAR(255) NOT NULL,
  StartDate DATE,
  EndDate DATE,
  Description TEXT,
  OwnerName VARCHAR(255),
  PRIMARY KEY(ExhibitionID),
  FOREIGN KEY(ArtworkID) REFERENCES Artwork(ArtworkID),
  FOREIGN KEY(ArtistID) REFERENCES Artist(ArtistID)
);

-- Insert sample values into Exhibition table
INSERT INTO Exhibition (ExhibitionID,ArtworkID,ArtistID,Title, StartDate, EndDate, Description, OwnerName)
VALUES
  (1,2,3,'Modern Art Exhibition', '2023-08-01', '2023-08-31', 'An exhibition showcasing modern artworks.', 'Gallery XYZ'),
  (2,3,4,'Impressionism Exhibition', '2023-07-15', '2023-09-15', 'An exhibition featuring famous Impressionist paintings.', 'Gallery ABC'),
  (3,4,5,'Surrealism Exhibition', '2023-07-01', '2023-07-31', 'An exhibition exploring the world of Surrealist art.', 'Gallery XYZ'),
  (4,5,6,'Renaissance Masters Exhibition', '2023-09-01', '2023-10-31', 'An exhibition showcasing masterpieces from the Renaissance era.', 'Gallery DEF'),
  (5,6,7,'Contemporary Art Exhibition', '2023-07-01', '2023-08-31', 'An exhibition highlighting contemporary art trends.', 'Gallery ABC'),
  (6,7,8,'Impressionist Landscapes Exhibition', '2023-10-01', '2023-11-30', 'An exhibition showcasing breathtaking landscapes by Impressionist painters.', 'Gallery ABC'),
  (7,8,9,'Abstract Art Exhibition', '2023-09-15', '2023-10-15', 'An exhibition exploring the world of abstract art through various mediums.', 'Gallery XYZ'),
  (8,9,10,'Photography Exhibition', '2023-08-01', '2023-08-31', 'An exhibition featuring captivating photographs by talented artists.', 'Gallery GHI'),
  (9,10,1,'Sculpture Exhibition', '2023-11-01', '2023-12-31', 'An exhibition showcasing intricate sculptures by renowned sculptors.', 'Gallery DEF'),
  (10,2,2,'Contemporary Portraits Exhibition', '2023-10-15', '2023-12-15', 'An exhibition highlighting contemporary portrait artworks capturing the essence of individuals.', 'Gallery JKL');

-- Gallery table
CREATE TABLE Gallery (
  GalleryID INT,
  ExhibitionID INT,
  Name VARCHAR(255) NOT NULL,
  Location VARCHAR(255),
  Description TEXT,
  PhoneNumber VARCHAR(20),
  PRIMARY KEY (GalleryID),
  FOREIGN KEY(ExhibitionID) REFERENCES Exhibition(ExhibitionID)
);

-- Insert sample values into Gallery table
INSERT INTO Gallery (GalleryID,ExhibitionID,Name, Location, Description, PhoneNumber) VALUES
  (1,2,'Gallery XYZ', '123 Main St, New York', 'A contemporary art gallery promoting emerging artists.', '555-1234'),
  (2,3,'Gallery ABC', '456 Elm St, Los Angeles', 'A gallery showcasing diverse art styles and genres.', '555-5678'),
  (3,4,'Gallery DEF', '789 Oak St, Chicago', 'A gallery specializing in Renaissance and classical art.', '555-9012'),
  (4,5,'Gallery GHI', '321 Pine St, San Francisco', 'A gallery dedicated to promoting local artists.', '555-3456'),
  (5,6,'Gallery JKL', '987 Maple St, Miami', 'A gallery featuring avant-garde and experimental art.', '555-7890'),
  (6,7,'Gallery MNO', '210 Elmwood Ave, Boston', 'A gallery highlighting contemporary sculpture and installations.', '555-2345'),
  (7,8,'Gallery PQR', '543 Oak St, Seattle', 'A gallery showcasing abstract and expressionist paintings.', '555-6789'),
  (8,9,'Gallery STU', '876 Pine St, Houston', 'A gallery specializing in photography and digital art.', '555-0123'),
  (9,10,'Gallery VWX', '234 Cedar St, Denver', 'A gallery promoting indigenous and folk art.', '555-4567'),
  (10,1,'Gallery YZ', '654 Walnut St, Atlanta', 'A gallery dedicated to showcasing art from emerging young artists.', '555-8901');


-- Auction table
CREATE TABLE Auction (
  AuctionID INT,
  ArtworkId INT,
  Title VARCHAR(255) NOT NULL,
  AuctionDate DATE,
  Description TEXT,
  PRIMARY KEY(AuctionID),
  FOREIGN KEY(ArtworkId) REFERENCES Artwork(ArtworkId)
);

-- Insert sample values into Auction table
-- Insert sample values into Auction table
INSERT INTO Auction (AuctionID,ArtworkId,Title, AuctionDate, Description)
VALUES
  (1,2,'Modern Art Auction', '2023-09-15', 'An auction featuring a wide range of modern art pieces.'),
  (2,3,'Impressionist Auction', '2023-08-31', 'An auction focused on Impressionist paintings by renowned artists.'),
  (3,4,'Contemporary Art Auction', '2023-07-15', 'An auction showcasing cutting-edge contemporary artworks.'),
  (4,5,'Photography Auction', '2023-10-01', 'An auction dedicated to fine art photography.'),
  (5,6,'Abstract Art Auction', '2023-09-30', 'An auction featuring abstract artworks in various mediums.'),
  (6,7,'Old Masters Auction', '2023-08-15', 'An auction highlighting masterpieces from the Renaissance and Baroque periods.'),
  (7,8,'Asian Art Auction', '2023-11-30', 'An auction focused on traditional and contemporary Asian artworks.'),
  (8,9,'Surrealist Art Auction', '2023-10-15', 'An auction showcasing surrealistic artworks by renowned artists.'),
  (9,10,'Modern Sculpture Auction', '2023-07-31', 'An auction dedicated to modern sculpture and installations.'),
  (10,1,'Impressionist Landscape Auction', '2023-11-15', 'An auction featuring breathtaking landscape paintings by Impressionist artists.');


-- Customer table
CREATE TABLE Customer (
  CustomerID INT,
  CustomerName VARCHAR(255) NOT NULL,
  Address VARCHAR(255),
  PhoneNumber VARCHAR(20),
  Email VARCHAR(255),
  PRIMARY KEY(CustomerID)
);

-- Insert sample values into Customer table
INSERT INTO Customer (CustomerID,CustomerName, Address, PhoneNumber, Email)
VALUES
  (1,'Alice Johnson', '123 Main St, New York', '555-1234', 'alice@example.com'),
  (2,'Bob Smith', '456 Elm St, Los Angeles', '555-5678', 'bob@example.com'),
  (3,'Catherine Davis', '789 Oak St, Chicago', '555-9012', 'catherine@example.com'),
  (4,'David Wilson', '321 Pine St, San Francisco', '555-3456', 'david@example.com'),
  (5,'Emma Thompson', '987 Maple St, Miami', '555-7890', 'emma@example.com'),
  (6,'Frank Martinez', '654 Birch St, Houston', '555-2345', 'frank@example.com'),
  (7,'Grace Lee', '234 Cedar St, Seattle', '555-6789', 'grace@example.com'),
  (8,'Henry Adams', '876 Walnut St, Boston', '555-0123', 'henry@example.com'),
  (9,'Isabella Harris', '543 Ash St, Denver', '555-4567', 'isabella@example.com'),
  (10,'Jacob Clark', '210 Spruce St, Atlanta', '555-8901', 'jacob@example.com');

-- Order table
CREATE TABLE Ordertable (
  OrderID INT,
  OrderNumber INT,
  OrderType VARCHAR(255),
  OrderDescription TEXT,
  OrderCustomerID INT,
  FOREIGN KEY (OrderCustomerID) REFERENCES Customer(CustomerID),
  PRIMARY KEY(OrderID)
);

-- Insert sample values into Order table
INSERT INTO OrderTable (OrderID,OrderNumber, OrderType, OrderDescription, OrderCustomerID)
VALUES
  (1,1001, 'Artwork Purchase', 'Ordering "The Starry Night" by Vincent van Gogh', 1),
  (2,1002, 'Commissioned Artwork', 'Ordering a custom painting', 3),
  (3,1003, 'Print Purchase', 'Ordering a limited edition print', 5),
  (4,1004, 'Artwork Purchase', 'Ordering "Mona Lisa" by Leonardo da Vinci', 2),
  (5,1005, 'Artwork Rental', 'Renting an artwork for a special event', 4),
  (6,1006, 'Artwork Purchase', 'Ordering "The Persistence of Memory" by Salvador Dalí', 1),
  (7,1007, 'Artwork Purchase', 'Ordering "Guernica" by Pablo Picasso', 6),
  (8,1008, 'Artwork Purchase', 'Ordering "The Scream" by Edvard Munch', 7),
  (9,1009, 'Artwork Purchase', 'Ordering "Water Lilies" by Claude Monet', 9),
  (10,1010, 'Artwork Purchase', 'Ordering "The Birth of Venus" by Sandro Botticelli', 10);


-- User table


  CREATE TABLE User_ (
  UserID INT,
  UserName VARCHAR(255),
  UserPhoneNumber VARCHAR(20),
  Address VARCHAR(255),
  Email VARCHAR(255),
  PRIMARY KEY(UserID)
);

-- Insert sample values into User table
INSERT INTO User_ (UserID,UserName, UserPhoneNumber, Address, Email)
VALUES
  (1,'JohnDoe', '555-1234', '123 Main St, New York', 'john@example.com'),
  (2,'JaneSmith', '555-5678', '456 Elm St, Los Angeles', 'jane@example.com'),
  (3,'MikeJohnson', '555-9012', '789 Oak St, Chicago', 'mike@example.com'),
  (4,'SarahWilson', '555-3456', '321 Pine St, San Francisco', 'sarah@example.com'),
  (5,'RobertThompson', '555-7890', '987 Maple St, Miami', 'robert@example.com'),
  (6,'LauraMartinez', '555-2345', '654 Birch St, Houston', 'laura@example.com'),
  (7,'DanielLee', '555-6789', '234 Cedar St, Seattle', 'daniel@example.com'),
  (8,'JenniferAdams', '555-0123', '876 Walnut St, Boston', 'jennifer@example.com'),
  (9,'WilliamHarris', '555-4567', '543 Ash St, Denver', 'william@example.com'),
  (10,'MichelleClark', '555-8901', '210 Spruce St, Atlanta', 'michelle@example.com');
  
  -- Login table
CREATE TABLE Login (
  ID INT,
  UserID INT,
  Username VARCHAR(255),
  Password VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY(ID),
  FOREIGN KEY (UserID) REFERENCES User_(UserID)
);

-- Insert sample values into Login table
INSERT INTO Login (ID,Username, Password,UserID)
VALUES
  (1,'john_doe', 'password123',2),
  (2,'jane_smith', 'pass456',4),
  (3,'mike_johnson', 'abc123',1),
  (4,'sarah_wilson', 'def456',3),
  (5,'robert_thompson', 'password789',6),
  (6,'laura_martinez', 'pass987',5),
  (7,'daniel_lee', 'xyz123',7),
  (8,'jennifer_adams', 'pass789',8),
  (9,'william_harris', 'qwe123',9),
  (10,'michelle_clark', 'pass890',10);