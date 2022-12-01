-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2022 at 03:54 PM
-- Server version: 8.0.31-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ParcijalniIspit3`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProsjekPlacaZaposlenika` ()  BEGIN 
SELECT 
AVG(place) `Prosjek placa svih zaposlenika` 
FROM place; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `odjeli`
--

CREATE TABLE `odjeli` (
  `odjeliID` int UNSIGNED NOT NULL,
  `imeOdjela` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `odjeli`
--

INSERT INTO `odjeli` (`odjeliID`, `imeOdjela`) VALUES
(1, 'računovodstvo'),
(2, 'prodaja'),
(3, 'marketing');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `placa` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`zaposlenikID`, `placa`, `odDatuma`, `doDatuma`) VALUES
(1, 8000, '2020-03-05', '2022-12-12'),
(2, 9000, '2020-06-29', '2022-12-12'),
(3, 3500, '2020-01-11', '2022-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `RadnoMjesto`
--

CREATE TABLE `RadnoMjesto` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `RadnoMjesto` varchar(255) NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `RadnoMjesto`
--

INSERT INTO `RadnoMjesto` (`zaposlenikID`, `RadnoMjesto`, `odDatuma`, `doDatuma`) VALUES
(1, 'tajnik', '2019-02-01', '2022-01-01'),
(2, 'administrator', '2018-12-12', '2021-06-06'),
(3, 'savjetnik', '2017-03-03', '2021-07-07');

-- --------------------------------------------------------

--
-- Table structure for table `voditeljOdjela`
--

CREATE TABLE `voditeljOdjela` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `odjeliID` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `voditeljOdjela`
--

INSERT INTO `voditeljOdjela` (`zaposlenikID`, `odjeliID`, `odDatuma`, `doDatuma`) VALUES
(1, 3, '2001-02-02', '2022-08-08'),
(2, 2, '2003-02-02', '2020-10-10'),
(3, 1, '2004-01-01', '2021-07-07');

-- --------------------------------------------------------

--
-- Table structure for table `zaposlenici`
--

CREATE TABLE `zaposlenici` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `datumRodjenja` date NOT NULL,
  `spol` varchar(255) NOT NULL,
  `datumZaposlenja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `zaposlenici`
--

INSERT INTO `zaposlenici` (`zaposlenikID`, `ime`, `prezime`, `datumRodjenja`, `spol`, `datumZaposlenja`) VALUES
(1, 'marko', 'markovic', '2001-02-01', 'muški', '2022-11-12'),
(2, 'ivan', 'rakitic', '1988-03-24', 'muški', '2021-07-12'),
(3, 'mila', 'horvat', '1979-10-10', 'ženski', '2022-12-08');

-- --------------------------------------------------------

--
-- Table structure for table `zaposleniciOdjeli`
--

CREATE TABLE `zaposleniciOdjeli` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `odjeliID` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `zaposleniciOdjeli`
--

INSERT INTO `zaposleniciOdjeli` (`zaposlenikID`, `odjeliID`, `odDatuma`, `doDatuma`) VALUES
(1, 1, '2019-05-05', '2022-01-01'),
(2, 2, '2016-06-05', '2021-08-07'),
(3, 3, '2012-08-05', '2022-09-17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `odjeli`
--
ALTER TABLE `odjeli`
  ADD PRIMARY KEY (`odjeliID`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`zaposlenikID`,`odDatuma`);

--
-- Indexes for table `RadnoMjesto`
--
ALTER TABLE `RadnoMjesto`
  ADD PRIMARY KEY (`zaposlenikID`,`RadnoMjesto`,`odDatuma`);

--
-- Indexes for table `voditeljOdjela`
--
ALTER TABLE `voditeljOdjela`
  ADD PRIMARY KEY (`zaposlenikID`,`odjeliID`),
  ADD KEY `odjeliID` (`odjeliID`);

--
-- Indexes for table `zaposlenici`
--
ALTER TABLE `zaposlenici`
  ADD PRIMARY KEY (`zaposlenikID`);

--
-- Indexes for table `zaposleniciOdjeli`
--
ALTER TABLE `zaposleniciOdjeli`
  ADD PRIMARY KEY (`zaposlenikID`,`odjeliID`),
  ADD KEY `odjeliID` (`odjeliID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `place_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE;

--
-- Constraints for table `RadnoMjesto`
--
ALTER TABLE `RadnoMjesto`
  ADD CONSTRAINT `RadnoMjesto_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE;

--
-- Constraints for table `voditeljOdjela`
--
ALTER TABLE `voditeljOdjela`
  ADD CONSTRAINT `voditeljOdjela_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE,
  ADD CONSTRAINT `voditeljOdjela_ibfk_2` FOREIGN KEY (`odjeliID`) REFERENCES `odjeli` (`odjeliID`) ON DELETE CASCADE;

--
-- Constraints for table `zaposleniciOdjeli`
--
ALTER TABLE `zaposleniciOdjeli`
  ADD CONSTRAINT `zaposleniciOdjeli_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE,
  ADD CONSTRAINT `zaposleniciOdjeli_ibfk_2` FOREIGN KEY (`odjeliID`) REFERENCES `odjeli` (`odjeliID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
