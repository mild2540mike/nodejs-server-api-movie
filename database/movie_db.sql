-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for movie_db
CREATE DATABASE IF NOT EXISTS `movie_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `movie_db`;

-- Dumping structure for table movie_db.bookings
CREATE TABLE IF NOT EXISTS `bookings` (
  `booking_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ticket_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `customer_id` (`customer_id`),
  KEY `ticket_id` (`ticket_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table movie_db.bookings: ~3 rows (approximately)
INSERT INTO `bookings` (`booking_id`, `customer_id`, `ticket_id`, `payment_method`) VALUES
	('B0001', 'C0001', 'TI0001', 'cash'),
	('B0002', 'C0002', 'TI0002', 'credit cards'),
	('B0003', 'C0003', 'TI0001', 'online payment');

-- Dumping structure for table movie_db.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table movie_db.customers: ~4 rows (approximately)
INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `email`, `phone`) VALUES
	('C0001', 'Yanaranop', 'Naulrahaeng', 'Yanaranop@gmail.com', '0925396670'),
	('C0002', 'Lorry', 'Duker', 'lduker0@time.com', '0914356340'),
	('C0003', 'Dominick', 'Jorn', 'djorn1@paypal.com', '0816356342'),
	('C0004', 'Karlen', 'Garmans', 'fsantoro6@tmall.com', '0964355342');

-- Dumping structure for table movie_db.movies
CREATE TABLE IF NOT EXISTS `movies` (
  `movie_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `movie_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `release_date` date NOT NULL,
  `duration` time NOT NULL,
  `director` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `movie_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table movie_db.movies: ~4 rows (approximately)
INSERT INTO `movies` (`movie_id`, `movie_name`, `release_date`, `duration`, `director`, `detail`, `movie_image`) VALUES
	('M0001', 'The Avengers', '2023-01-01', '01:10:00', 'Joss Whedon', 'The Avengers, is a 2012 American superhero film based on the Marvel Comics superhero team of the same name. Produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures, it is the sixth film in the Marvel Cinematic Universe (MCU).', 'movie/f857a736-4cf3-4f3c-9acf-0671a790ef7f.jpg'),
	('M0002', 'Harry Potter and the Deathly Hallows', '2023-01-01', '02:00:00', 'David Yates', 'Harry Potter and the Deathly Hallows is a 2010 fantasy film directed by David Yates from a screenplay by Steve Kloves.[5] The film is the first of two cinematic parts based on the 2007 novel Harry Potter and the Deathly Hallows by J. K. Rowling.', 'movie/f857a736-4cf3-4f3c-9acf-0671a790ef7f.jpg'),
	('M0003', 'Avatar: The Way of Water', '2023-01-01', '01:40:00', 'James', 'Lorem is spir', 'movie/f857a736-4cf3-4f3c-9acf-0671a790ef7f.jpg'),
	('M0004', 'Avatar: The Way of Water', '2023-01-01', '01:40:00', 'James', 'Lorem is spir', 'movie/f857a736-4cf3-4f3c-9acf-0671a790ef7f.jpg');

-- Dumping structure for table movie_db.seats
CREATE TABLE IF NOT EXISTS `seats` (
  `seat_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `seat_number` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `showtime_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `booking_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`seat_id`),
  KEY `showtime_id` (`showtime_id`),
  CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`showtime_id`) REFERENCES `showtimes` (`showtime_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table movie_db.seats: ~100 rows (approximately)
INSERT INTO `seats` (`seat_id`, `seat_number`, `showtime_id`, `booking_id`) VALUES
	('SE0001', 'A1', 'S0002', ''),
	('SE0002', 'A2', 'S0002', ''),
	('SE0003', 'A3', 'S0002', 'B0002'),
	('SE0004', 'A4', 'S0002', 'B0002'),
	('SE0005', 'A5', 'S0002', ''),
	('SE0006', 'A6', 'S0002', ''),
	('SE0007', 'A7', 'S0002', 'B0002'),
	('SE0008', 'A8', 'S0002', ''),
	('SE0009', 'A9', 'S0002', ''),
	('SE0010', 'A10', 'S0002', ''),
	('SE0011', 'B1', 'S0002', ''),
	('SE0012', 'B2', 'S0002', ''),
	('SE0013', 'B3', 'S0002', ''),
	('SE0014', 'B4', 'S0002', ''),
	('SE0015', 'B5', 'S0002', ''),
	('SE0016', 'B6', 'S0002', ''),
	('SE0017', 'B7', 'S0002', ''),
	('SE0018', 'B8', 'S0002', ''),
	('SE0019', 'B9', 'S0002', ''),
	('SE0020', 'B10', 'S0002', ''),
	('SE0021', 'C1', 'S0002', ''),
	('SE0022', 'C2', 'S0002', ''),
	('SE0023', 'C3', 'S0002', ''),
	('SE0024', 'C4', 'S0002', ''),
	('SE0025', 'C5', 'S0002', ''),
	('SE0026', 'C6', 'S0002', ''),
	('SE0027', 'C7', 'S0002', ''),
	('SE0028', 'C8', 'S0002', ''),
	('SE0029', 'C9', 'S0002', ''),
	('SE0030', 'C10', 'S0002', ''),
	('SE0031', 'D1', 'S0002', ''),
	('SE0032', 'D2', 'S0002', ''),
	('SE0033', 'D3', 'S0002', ''),
	('SE0034', 'D4', 'S0002', ''),
	('SE0035', 'D5', 'S0002', ''),
	('SE0036', 'D6', 'S0002', ''),
	('SE0037', 'D7', 'S0002', ''),
	('SE0038', 'D8', 'S0002', ''),
	('SE0039', 'D9', 'S0002', ''),
	('SE0040', 'D10', 'S0002', ''),
	('SE0041', 'E1', 'S0002', ''),
	('SE0042', 'E2', 'S0002', ''),
	('SE0043', 'E3', 'S0002', ''),
	('SE0044', 'E4', 'S0002', ''),
	('SE0045', 'E5', 'S0002', ''),
	('SE0046', 'E6', 'S0002', ''),
	('SE0047', 'E7', 'S0002', ''),
	('SE0048', 'E8', 'S0002', ''),
	('SE0049', 'E9', 'S0002', ''),
	('SE0050', 'E10', 'S0002', ''),
	('SE0051', 'A1', 'S0005', ''),
	('SE0052', 'A2', 'S0005', ''),
	('SE0053', 'A3', 'S0005', ''),
	('SE0054', 'A4', 'S0005', ''),
	('SE0055', 'A5', 'S0005', ''),
	('SE0056', 'A6', 'S0005', ''),
	('SE0057', 'A7', 'S0005', ''),
	('SE0058', 'A8', 'S0005', ''),
	('SE0059', 'A9', 'S0005', ''),
	('SE0060', 'A10', 'S0005', ''),
	('SE0061', 'B1', 'S0005', ''),
	('SE0062', 'B2', 'S0005', ''),
	('SE0063', 'B3', 'S0005', ''),
	('SE0064', 'B4', 'S0005', ''),
	('SE0065', 'B5', 'S0005', ''),
	('SE0066', 'B6', 'S0005', ''),
	('SE0067', 'B7', 'S0005', ''),
	('SE0068', 'B8', 'S0005', ''),
	('SE0069', 'B9', 'S0005', ''),
	('SE0070', 'B10', 'S0005', ''),
	('SE0071', 'C1', 'S0005', ''),
	('SE0072', 'C2', 'S0005', ''),
	('SE0073', 'C3', 'S0005', ''),
	('SE0074', 'C4', 'S0005', ''),
	('SE0075', 'C5', 'S0005', ''),
	('SE0076', 'C6', 'S0005', ''),
	('SE0077', 'C7', 'S0005', ''),
	('SE0078', 'C8', 'S0005', ''),
	('SE0079', 'C9', 'S0005', ''),
	('SE0080', 'C10', 'S0005', ''),
	('SE0081', 'D1', 'S0005', ''),
	('SE0082', 'D2', 'S0005', ''),
	('SE0083', 'D3', 'S0005', ''),
	('SE0084', 'D4', 'S0005', ''),
	('SE0085', 'D5', 'S0005', ''),
	('SE0086', 'D6', 'S0005', ''),
	('SE0087', 'D7', 'S0005', ''),
	('SE0088', 'D8', 'S0005', ''),
	('SE0089', 'D9', 'S0005', ''),
	('SE0090', 'D10', 'S0005', ''),
	('SE0091', 'E1', 'S0005', ''),
	('SE0092', 'E2', 'S0005', ''),
	('SE0093', 'E3', 'S0005', ''),
	('SE0094', 'E4', 'S0005', ''),
	('SE0095', 'E5', 'S0005', ''),
	('SE0096', 'E6', 'S0005', ''),
	('SE0097', 'E7', 'S0005', ''),
	('SE0098', 'E8', 'S0005', ''),
	('SE0099', 'E9', 'S0005', ''),
	('SE0100', 'E10', 'S0005', '');

-- Dumping structure for table movie_db.showtimes
CREATE TABLE IF NOT EXISTS `showtimes` (
  `showtime_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `movie_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `theater_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `show_date` date NOT NULL,
  `show_time` time NOT NULL,
  PRIMARY KEY (`showtime_id`),
  KEY `movie_id` (`movie_id`),
  KEY `theater_id` (`theater_id`),
  CONSTRAINT `showtimes_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `showtimes_ibfk_2` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`theater_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table movie_db.showtimes: ~5 rows (approximately)
INSERT INTO `showtimes` (`showtime_id`, `movie_id`, `theater_id`, `show_date`, `show_time`) VALUES
	('S0001', 'M0001', 'T0001', '2023-01-09', '11:00:00'),
	('S0002', 'M0002', 'T0002', '2023-01-10', '11:30:00'),
	('S0003', 'M0002', 'T0002', '2023-01-10', '13:30:00'),
	('S0004', 'M0002', 'T0002', '2023-01-10', '17:30:00'),
	('S0005', 'M0002', 'T0001', '2023-01-10', '20:30:00');

-- Dumping structure for table movie_db.theaters
CREATE TABLE IF NOT EXISTS `theaters` (
  `theater_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `theater_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`theater_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table movie_db.theaters: ~2 rows (approximately)
INSERT INTO `theaters` (`theater_id`, `theater_name`, `location`) VALUES
	('T0001', 'theater1', '1st floor'),
	('T0002', 'theater2', '1st floor');

-- Dumping structure for table movie_db.tickets
CREATE TABLE IF NOT EXISTS `tickets` (
  `ticket_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `showtime_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ticket_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `showtime_id` (`showtime_id`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`showtime_id`) REFERENCES `showtimes` (`showtime_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table movie_db.tickets: ~2 rows (approximately)
INSERT INTO `tickets` (`ticket_id`, `showtime_id`, `ticket_type`, `price`) VALUES
	('TI0001', 'S0001', 'MStudent', 200.00),
	('TI0002', 'S0002', 'MPersonal', 300.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
