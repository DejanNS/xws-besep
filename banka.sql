-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 18, 2013 at 09:39 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `banka`
--

-- --------------------------------------------------------

--
-- Table structure for table `klijent`
--

CREATE TABLE IF NOT EXISTS `klijent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `brojRacuna` varchar(255) DEFAULT NULL,
  `naziv` varchar(255) DEFAULT NULL,
  `trenutniStatus` varchar(255) DEFAULT NULL,
  `trenutnoStanje` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `klijent`
--

INSERT INTO `klijent` (`id`, `version`, `brojRacuna`, `naziv`, `trenutniStatus`, `trenutnoStanje`) VALUES
(1, 0, '310-0400100071221-35', 'Klijent1', 'AKTIVAN', '10000'),
(2, 0, '310-0000000000011-83', 'Klijent2', 'AKTIVAN', '20000');

-- --------------------------------------------------------

--
-- Table structure for table `nalog_za_placanje`
--

CREATE TABLE IF NOT EXISTS `nalog_za_placanje` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `datumNaloga` datetime DEFAULT NULL,
  `datumValute` datetime DEFAULT NULL,
  `duznik` varchar(255) DEFAULT NULL,
  `hitno` tinyint(1) DEFAULT NULL,
  `idNaloga` varchar(255) DEFAULT NULL,
  `iznos` double DEFAULT NULL,
  `modelOdobrenja` int(11) DEFAULT NULL,
  `modelZaduzenja` int(11) DEFAULT NULL,
  `oznakaValute` varchar(255) DEFAULT NULL,
  `pozivNaBrojOdobrenja` varchar(255) DEFAULT NULL,
  `pozivNaBrojZaduzenja` varchar(255) DEFAULT NULL,
  `primalac` varchar(255) DEFAULT NULL,
  `racunDuznika` varchar(255) DEFAULT NULL,
  `racunPoverioca` varchar(255) DEFAULT NULL,
  `svrhaPlacanja` varchar(255) DEFAULT NULL,
  `razlog` varchar(255) DEFAULT NULL,
  `statusNaloga` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `nalog_za_placanje`
--

INSERT INTO `nalog_za_placanje` (`id`, `version`, `datumNaloga`, `datumValute`, `duznik`, `hitno`, `idNaloga`, `iznos`, `modelOdobrenja`, `modelZaduzenja`, `oznakaValute`, `pozivNaBrojOdobrenja`, `pozivNaBrojZaduzenja`, `primalac`, `racunDuznika`, `racunPoverioca`, `svrhaPlacanja`, `razlog`, `statusNaloga`) VALUES
(1, 0, '0034-02-03 00:00:00', '0034-02-03 00:00:00', 'Duznik', 1, '1112', 1200, 97, 97, 'RSD', '12-12', '1234-56', 'Primalac', '123-456-78', '123-123', 'Svrha placanja', NULL, 'REZERVISANO');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
