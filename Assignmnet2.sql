-- Create Users table
CREATE TABLE IF NOT EXISTS `Users` (
    `UserID` INT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `BirthDate` DATE DEFAULT NULL,
    `Gender` VARCHAR(10) DEFAULT NULL,
    `Education` VARCHAR(255) DEFAULT NULL,
    `CurrentLocation` VARCHAR(255) DEFAULT NULL,
    `Hometown` VARCHAR(255) DEFAULT NULL
) ENGINE=InnoDB;

-- Create Weddings table
CREATE TABLE IF NOT EXISTS `Weddings` (
    `WeddingID` INT AUTO_INCREMENT PRIMARY KEY,
    `Groom` INT NOT NULL,
    `Bride` INT NOT NULL,
    CONSTRAINT `fk_groom_id` FOREIGN KEY (`Groom`) REFERENCES `Users` (`UserID`) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `fk_bride_id` FOREIGN KEY (`Bride`) REFERENCES `Users` (`UserID`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Create WeddingEvents table
CREATE TABLE IF NOT EXISTS `WeddingEvents` (
    `EventID` INT AUTO_INCREMENT PRIMARY KEY,
    `WeddingID` INT NOT NULL,
    `EventType` ENUM('Main', 'Reception', 'Dinner') NOT NULL DEFAULT 'Main',
    `EventDate` DATE NOT NULL,
    `EventStartTime` TIME NOT NULL,
    `EventEndTime` TIME NOT NULL,
    `Location` VARCHAR(255) NOT NULL,
    `MusicBandID` INT,
    `CateringServiceID` INT,
    `HallID` INT,
    CONSTRAINT `fk_wedding_id` FOREIGN KEY (`WeddingID`) REFERENCES `Weddings` (`WeddingID`) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `fk_musicband_id` FOREIGN KEY (`MusicBandID`) REFERENCES `MusicBands` (`MusicBandID`) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `fk_cateringservice_id` FOREIGN KEY (`CateringServiceID`) REFERENCES `CateringServices` (`CateringServiceID`) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `fk_hall_id` FOREIGN KEY (`HallID`) REFERENCES `WeddingHalls` (`HallID`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Create CateringServices table
CREATE TABLE IF NOT EXISTS `CateringServices` (
    `CateringServiceID` INT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Contact` VARCHAR(255) NOT NULL,
    `Price` DECIMAL(10, 2) DEFAULT 0.0
) ENGINE=InnoDB;

-- Create MusicBands table
CREATE TABLE IF NOT EXISTS `MusicBands` (
    `MusicBandID` INT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Genre` VARCHAR(255) DEFAULT NULL,
    `Contact` VARCHAR(255) NOT NULL,
    `Price` DECIMAL(10, 2) DEFAULT 0.0
) ENGINE=InnoDB;

-- Create WeddingHalls table
CREATE TABLE IF NOT EXISTS `WeddingHalls` (
    `HallID` INT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Location` VARCHAR(255) NOT NULL,
    `Capacity` INT NOT NULL,
    `Price` DECIMAL(10, 2) DEFAULT 0.0
) ENGINE=InnoDB;

-- Create InvitationCardTemplates table
CREATE TABLE IF NOT EXISTS `InvitationCardTemplates` (
    `TemplateID` INT AUTO_INCREMENT PRIMARY KEY,
    `Theme` VARCHAR(255) DEFAULT NULL,
    `PoemOrText` TEXT DEFAULT NULL
) ENGINE=InnoDB;

-- Create InvitationCards table
CREATE TABLE IF NOT EXISTS `InvitationCards` (
    `InvitationID` INT AUTO_INCREMENT PRIMARY KEY,
    `WeddingID` INT NOT NULL,
    `TemplateID` INT NOT NULL,
    `RecipientName` VARCHAR(255) DEFAULT NULL,
    `Note` TEXT DEFAULT NULL,
    CONSTRAINT `fk_wedding_id` FOREIGN KEY (`WeddingID`) REFERENCES `Weddings` (`WeddingID`) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `fk_template_id` FOREIGN KEY (`TemplateID`) REFERENCES `InvitationCardTemplates` (`TemplateID`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Insert data into Users table
INSERT INTO `Users` (`Name`, `BirthDate`, `Gender`, `Education`, `CurrentLocation`, `Hometown`)
VALUES 
    ('John Doe', '1990-05-15', 'Male', 'Bachelor', 'New York', 'Los Angeles'),
    ('Jane Smith', '1985-10-20', 'Female', 'Master', 'Los Angeles', 'Chicago'),
    ('Alice Johnson', '1995-02-28', 'Female', 'Bachelor', 'Chicago', 'New York'),
    ('Michael Brown', '1982-09-10', 'Male', 'PhD', 'Houston', 'Dallas'),
    ('Emily Davis', '1993-07-05', 'Female', 'Bachelor', 'Miami', 'Orlando'),
    ('William Wilson', '1988-03-20', 'Male', 'Bachelor', 'Boston', 'Seattle'),
    ('Sophia Garcia', '1987-11-12', 'Female', 'Master', 'San Francisco', 'Los Angeles'),
    ('Jacob Martinez', '1992-06-30', 'Male', 'Bachelor', 'Dallas', 'San Antonio'),
    ('Olivia Anderson', '1986-04-18', 'Female', 'PhD', 'Chicago', 'New York'),
    ('Daniel Rodriguez', '1990-09-08', 'Male', 'Bachelor', 'Los Angeles', 'San Diego');

-- Insert data into Weddings table
INSERT INTO `Weddings` (`Groom`, `Bride`)
VALUES 
    (1, 2),
    (3, 4),
    (5, 6),
    (7, 8),
    (9, 10);

-- Insert data into WeddingEvents table
INSERT INTO `WeddingEvents` (`WeddingID`, `EventType`, `EventDate`, `EventStartTime`, `EventEndTime`, `Location`, `MusicBandID`, `CateringServiceID`, `HallID`)
VALUES 
    (1, 'Main', '2024-06-15', '17:00', '18:00', 'New York City Hall', NULL, NULL, NULL),
    (1, 'Reception', '2024-06-15', '18:00', '20:00', 'Central Park', NULL, 1, 1),
    (2, 'Main', '2024-07-20', '16:00', '17:30', 'Chicago Botanic Garden', 1, 2, 2),
    (2, 'Reception', '2024-07-20', '18:00', '20:30', 'Chicago Botanic Garden', 2, 2, 2),
    (3, 'Main', '2024-08-25', '18:00', '19:00', 'Houston Country Club', NULL, 3, 3),
    (3, 'Reception', '2024-08-25', '19:00', '21:00', 'Houston Country Club', 3, 3, 3),
    (4, 'Main', '2024-09-30', '15:30', '17:00', 'Miami Beach Resort', NULL, 4, 4),
    (4, 'Reception', '2024-09-30', '17:30', '20:00', 'Miami Beach Resort', 4, 4, 4),
    (5, 'Main', '2024-10-05', '14:00', '15:30', 'Boston Harbor Hotel', NULL, 5, 5),
    (5, 'Reception', '2024-10-05', '16:00', '18:00', 'Boston Harbor Hotel', 5, 5, 5);

-- Insert data into CateringServices table
INSERT INTO `CateringServices` (`Name`, `Contact`, `Price`)
VALUES 
    ('Delicious Catering', 'contact@deliciouscatering.com', 5000),
    ('Elegant Events Catering', 'info@elegantevents.com', 7500),
    ('Gourmet Galore Caterers', 'sales@gourmetgalore.com', 6000),
    ('Savor the Flavor Catering', 'hello@savortheflavor.com', 5500),
    ('Tasty Treats Catering', 'orders@tastytreats.com', 4800);

-- Insert data into MusicBands table
INSERT INTO `MusicBands` (`Name`, `Genre`, `Contact`, `Price`)
VALUES 
    ('The Wedding Singers', 'Pop, Rock', 'bookings@weddingsingers.com', 3000),
    ('Smooth Jazz Trio', 'Jazz', 'info@smoothjazztrio.com', 2500),
    ('Classical Ensemble', 'Classical', 'contact@classicalensemble.com', 2000),
    ('Salsa Rhythms Band', 'Latin', 'salsarhythms@gmail.com', 2800),
    ('Country Serenade', 'Country', 'bookings@countryserenade.com', 2200);

-- Insert data into WeddingHalls table
INSERT INTO `WeddingHalls` (`Name`, `Location`, `Capacity`, `Price`)
VALUES 
    ('Grand Ballroom', 'New York', 200, 8000),
    ('Garden Pavilion', 'Chicago', 150, 6000),
    ('Lakeview Terrace', 'Houston', 180, 7000),
    ('Oceanfront Hall', 'Miami', 250, 9000),
    ('Harbor View Room', 'Boston', 180, 7000);

-- Insert data into InvitationCardTemplates table
INSERT INTO `InvitationCardTemplates` (`Theme`, `PoemOrText`)
VALUES 
    ('Classic Elegance', 'You are cordially invited to celebrate the union of...'),
    ('Rustic Charm', 'Join us for an intimate gathering to celebrate...'),
    ('Modern Minimalist', 'Save the date for the wedding of...'),
    ('Vintage Romance', 'Love is in the air! Join us for the wedding of...'),
    ('Tropical Paradise', 'Escape to paradise with us as we exchange vows...');

-- Insert data into InvitationCards table
INSERT INTO `InvitationCards` (`WeddingID`, `TemplateID`, `RecipientName`, `Note`)
VALUES 
    (1, 1, 'Alice Johnson', 'Please join us in celebrating the wedding of John and Jane.'),
    (1, 1, 'Michael Brown', 'You are invited to witness the union of John and Jane.'),
    (2, 2, 'Andrew Wilson', 'Join us for an unforgettable evening of love and joy.'),
    (2, 2, 'Jessica Davis', 'You are cordially invited to the wedding of Emily and Michael.'),
    (3, 3, 'William Wilson', 'Save the date for the wedding of Emily and Michael.'),
    (3, 3, 'Sarah Lee', 'Join us in celebrating the love of Emily and Michael.'),
    (4, 4, 'Sophia Garcia', 'Please join us for a beachside wedding celebration.'),
    (4, 4, 'Jacob Martinez', 'You are invited to witness the marriage of Emily and Michael.'),
    (5, 5, 'Olivia Anderson', 'Join us as we celebrate the union of Emily and Michael.'),
    (5, 5, 'Daniel Rodriguez', 'You are cordially invited to the wedding of Emily and Michael.');

-- Create UserAudit table
CREATE TABLE IF NOT EXISTS `UserAudit` (
    `AuditID` INT AUTO_INCREMENT PRIMARY KEY,
    `UserID` INT,
    `Action` VARCHAR(255),
    `Timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Create trigger to check for event conflicts
DELIMITER //
CREATE TRIGGER `EventConflictCheckTrigger`
BEFORE INSERT ON `WeddingEvents`
FOR EACH ROW
BEGIN
    DECLARE conflict_count INT;
    SELECT COUNT(*)
    INTO conflict_count
    FROM `WeddingEvents`
    WHERE `WeddingID` = NEW.`WeddingID`
    AND (
        (NEW.`EventStartTime` < `EventEndTime` AND NEW.`EventStartTime` > `EventStartTime`)
        OR
        (NEW.`EventEndTime` < `EventEndTime` AND NEW.`EventEndTime` > `EventStartTime`)
    );

    IF conflict_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Event time conflict detected';
    END IF;
END //
DELIMITER ;

