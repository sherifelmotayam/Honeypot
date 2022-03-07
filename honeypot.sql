-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2022 at 10:05 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `honeypot`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `email`, `type`) VALUES
(9, 'Mostafa', 'mostafa2001', 'mostafa@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `COUNTRY_ID` varchar(2) NOT NULL,
  `COUNTRY_NAME` varchar(40) DEFAULT NULL,
  `REGION_ID` decimal(10,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`COUNTRY_ID`, `COUNTRY_NAME`, `REGION_ID`) VALUES
('AR', 'Argentina', '2'),
('AU', 'Australia', '3'),
('BE', 'Belgium', '1'),
('BR', 'Brazil', '2'),
('CA', 'Canada', '2'),
('CH', 'Switzerland', '1'),
('CN', 'China', '3'),
('DE', 'Germany', '1'),
('DK', 'Denmark', '1'),
('EG', 'Egypt', '4'),
('FR', 'France', '1'),
('HK', 'HongKong', '3'),
('IL', 'Israel', '4'),
('IN', 'India', '3'),
('IT', 'Italy', '1'),
('JP', 'Japan', '3'),
('KW', 'Kuwait', '4'),
('MX', 'Mexico', '2'),
('NG', 'Nigeria', '4'),
('NL', 'Netherlands', '1'),
('SG', 'Singapore', '3'),
('UK', 'United Kingdom', '1'),
('US', 'United States of America', '2'),
('ZM', 'Zambia', '4'),
('ZW', 'Zimbabwe', '4');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DEPARTMENT_ID` decimal(4,0) NOT NULL DEFAULT 0,
  `DEPARTMENT_NAME` varchar(30) NOT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `LOCATION_ID` decimal(4,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`DEPARTMENT_ID`, `DEPARTMENT_NAME`, `MANAGER_ID`, `LOCATION_ID`) VALUES
('10', 'Administration', '200', '1700'),
('20', 'Marketing', '201', '1800'),
('30', 'Purchasing', '114', '1700'),
('40', 'Human Resources', '203', '2400'),
('50', 'Shipping', '121', '1500'),
('60', 'IT', '103', '1400'),
('70', 'Public Relations', '204', '2700'),
('80', 'Sales', '145', '2500'),
('90', 'Executive', '100', '1700'),
('100', 'Finance', '108', '1700'),
('110', 'Accounting', '205', '1700'),
('120', 'Treasury', '0', '1700'),
('130', 'Corporate Tax', '0', '1700'),
('140', 'Control And Credit', '0', '1700'),
('150', 'Shareholder Services', '0', '1700'),
('160', 'Benefits', '0', '1700'),
('170', 'Manufacturing', '0', '1700'),
('180', 'Construction', '0', '1700'),
('190', 'Contracting', '0', '1700'),
('200', 'Operations', '0', '1700'),
('210', 'IT Support', '0', '1700'),
('220', 'NOC', '0', '1700'),
('230', 'IT Helpdesk', '0', '1700'),
('240', 'Government Sales', '0', '1700'),
('250', 'Retail Sales', '0', '1700'),
('260', 'Recruiting', '0', '1700'),
('270', 'Payroll', '0', '1700');

-- --------------------------------------------------------

--
-- Table structure for table `dummydata`
--

CREATE TABLE `dummydata` (
  `ID` int(11) NOT NULL,
  `UNI_ID` varchar(250) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `Gender` varchar(250) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `DOB` varchar(250) NOT NULL,
  `last_login` varchar(250) NOT NULL,
  `Education` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dummydata`
--

INSERT INTO `dummydata` (`ID`, `UNI_ID`, `Name`, `Gender`, `Email`, `DOB`, `last_login`, `Education`) VALUES
(1, '2019/10325', 'Robert Rodriguez', 'male', 'robert1910325@miuegypt.edu.eg', '2001-10-21', '2021-08-15 06:11:56', 'Student'),
(2, '2021/11007', 'Robin Mitchell', 'female', 'robin2111007@miuegypt.edu.eg', '2003-05-06', '2021-08-08 16:30:52', 'Error'),
(3, '2019/10118', 'Amy Murphy', 'female', 'amy1910118@miuegypt.edu.eg', '2001-08-24', '2021-08-21 18:14:26', 'Student'),
(4, '2013/10912', 'Daniel Washington', 'male', 'daniel1310912@miuegypt.edu.eg', '1995-05-23', '2021-08-22 04:02:32', 'employed'),
(5, '2014/10448', 'Jillian Orr', 'female', 'jillian1410448@miuegypt.edu.eg', '1996-08-09', '2021-08-15 23:07:51', 'grad'),
(6, '2022/10824', 'Jerry Brown', 'male', 'jerry2210824@miuegypt.edu.eg', '2004-09-06', '2021-08-04 09:00:58', 'Error'),
(7, '2016/10112', 'Charles Johnson', 'male', 'charles1610112@miuegypt.edu.eg', '1998-08-16', '2021-08-21 06:30:44', 'grad'),
(8, '2013/10542', 'Kristen Barrett', 'female', 'kristen1310542@miuegypt.edu.eg', '1995-02-14', '2021-08-17 02:22:23', 'employed'),
(9, '2018/11065', 'Amy Thompson', 'female', 'amy1811065@miuegypt.edu.eg', '2000-11-17', '2021-08-06 21:02:20', 'Student'),
(10, '2014/10861', 'Katherine Fletcher', 'female', 'katherine1410861@miuegypt.edu.eg', '1996-06-14', '2021-08-17 01:45:45', 'grad'),
(11, '2014/11028', 'Jonathan Melton', 'male', 'jonathan1411028@miuegypt.edu.eg', '1996-05-23', '2021-08-11 20:32:30', 'grad'),
(12, '2013/10089', 'Pamela Caldwell', 'female', 'pamela1310089@miuegypt.edu.eg', '1995-01-29', '2021-08-03 12:16:05', 'employed'),
(13, '2016/10988', 'Christopher Pham PhD', 'male', 'christopher1610988@miuegypt.edu.eg', '1998-07-20', '2021-08-03 20:17:03', 'grad'),
(14, '2013/11041', 'Erica Brown', 'female', 'erica1311041@miuegypt.edu.eg', '1995-09-19', '2021-08-07 01:18:34', 'employed'),
(15, '2013/10940', 'Caitlin Jacobs', 'female', 'caitlin1310940@miuegypt.edu.eg', '1995-09-06', '2021-08-16 18:13:09', 'employed'),
(16, '2015/10328', 'Christina Gomez', 'female', 'christina1510328@miuegypt.edu.eg', '1997-08-27', '2021-08-16 10:21:22', 'grad'),
(17, '2019/10401', 'Jennifer Parker', 'female', 'jennifer1910401@miuegypt.edu.eg', '2001-04-23', '2021-08-13 18:59:17', 'Student'),
(18, '2017/11015', 'Shannon Goodman', 'female', 'shannon1711015@miuegypt.edu.eg', '1999-03-24', '2021-08-19 22:32:07', 'Student'),
(19, '2020/10510', 'Sheena Hall', 'female', 'sheena2010510@miuegypt.edu.eg', '2002-12-15', '2021-08-06 06:24:24', 'Student'),
(20, '2015/10056', 'James Garcia', 'male', 'james1510056@miuegypt.edu.eg', '1997-07-16', '2021-08-18 08:28:45', 'grad'),
(21, '2015/11109', 'Austin Lee', 'male', 'austin1511109@miuegypt.edu.eg', '1997-05-12', '2021-08-17 21:34:55', 'grad'),
(22, '2021/10878', 'Bruce Mccann', 'male', 'bruce2110878@miuegypt.edu.eg', '2003-11-08', '2021-08-10 03:52:42', 'Error'),
(23, '2019/10593', 'Frank Mccoy', 'male', 'frank1910593@miuegypt.edu.eg', '2001-06-05', '2021-08-01 13:06:38', 'Student'),
(24, '2015/10956', 'Kelsey Burgess', 'female', 'kelsey1510956@miuegypt.edu.eg', '1997-08-23', '2021-08-01 07:30:38', 'grad'),
(25, '2017/10548', 'David Barton', 'male', 'david1710548@miuegypt.edu.eg', '1999-09-09', '2021-08-19 18:47:39', 'Student'),
(26, '2015/10001', 'Tiffany Padilla', 'female', 'tiffany1510001@miuegypt.edu.eg', '1997-06-11', '2021-08-11 21:31:06', 'grad'),
(27, '2013/10577', 'Heather Wood', 'female', 'heather1310577@miuegypt.edu.eg', '1995-07-15', '2021-08-13 10:14:34', 'employed'),
(28, '2013/10711', 'Nichole Berger', 'female', 'nichole1310711@miuegypt.edu.eg', '1995-01-19', '2021-08-20 20:50:06', 'employed'),
(29, '2015/11009', 'Christina Waller', 'female', 'christina1511009@miuegypt.edu.eg', '1997-08-20', '2021-08-17 09:10:00', 'grad'),
(30, '2021/11111', 'Heather Morris', 'female', 'heather2111111@miuegypt.edu.eg', '2003-12-27', '2021-08-04 04:24:00', 'Error'),
(31, '2018/10287', 'Kirk Gibbs', 'male', 'kirk1810287@miuegypt.edu.eg', '2000-12-13', '2021-08-08 06:28:56', 'Student'),
(32, '2014/10977', 'Aaron Hill', 'male', 'aaron1410977@miuegypt.edu.eg', '1996-01-17', '2021-08-14 02:11:39', 'employed'),
(33, '2018/10296', 'Melissa Barron', 'female', 'melissa1810296@miuegypt.edu.eg', '2000-10-18', '2021-08-12 07:56:15', 'Student'),
(34, '2018/10528', 'Larry Orozco', 'male', 'larry1810528@miuegypt.edu.eg', '2000-02-19', '2021-08-02 09:28:05', 'Student'),
(35, '2020/10910', 'Brian Obrien', 'male', 'brian2010910@miuegypt.edu.eg', '2002-06-21', '2021-08-23 19:46:20', 'Student'),
(36, '2015/10418', 'Kimberly Banks', 'female', 'kimberly1510418@miuegypt.edu.eg', '1997-01-11', '2021-08-14 11:23:56', 'grad'),
(37, '2016/10205', 'Sherri Peters', 'female', 'sherri1610205@miuegypt.edu.eg', '1998-04-17', '2021-08-23 04:06:52', 'grad'),
(38, '2018/10757', 'Barbara Shepard', 'female', 'barbara1810757@miuegypt.edu.eg', '2000-07-29', '2021-08-20 01:38:55', 'Student'),
(39, '2017/10556', 'Mark Holloway', 'male', 'mark1710556@miuegypt.edu.eg', '1999-03-27', '2021-08-05 21:27:47', 'Student'),
(40, '2014/10729', 'Mr. Edwin Wyatt', 'male', 'mr.1410729@miuegypt.edu.eg', '1996-05-04', '2021-08-04 21:03:10', 'grad');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL DEFAULT 0,
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `EMAIL` varchar(25) NOT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` date NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  `COMMISSION_PCT` decimal(2,2) DEFAULT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `HIRE_DATE`, `JOB_ID`, `SALARY`, `COMMISSION_PCT`, `MANAGER_ID`, `DEPARTMENT_ID`) VALUES
('100', 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17', 'AD_PRES', '24000.00', '0.00', '0', '90'),
('101', 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1987-06-18', 'AD_VP', '17000.00', '0.00', '100', '90'),
('102', 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '1987-06-19', 'AD_VP', '17000.00', '0.00', '100', '90'),
('103', 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '1987-06-20', 'IT_PROG', '9000.00', '0.00', '102', '60'),
('104', 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '1987-06-21', 'IT_PROG', '6000.00', '0.00', '103', '60'),
('105', 'David', 'Austin', 'DAUSTIN', '590.423.4569', '1987-06-22', 'IT_PROG', '4800.00', '0.00', '103', '60'),
('106', 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '1987-06-23', 'IT_PROG', '4800.00', '0.00', '103', '60'),
('107', 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '1987-06-24', 'IT_PROG', '4200.00', '0.00', '103', '60'),
('108', 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '1987-06-25', 'FI_MGR', '12000.00', '0.00', '101', '100'),
('109', 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '1987-06-26', 'FI_ACCOUNT', '9000.00', '0.00', '108', '100'),
('110', 'John', 'Chen', 'JCHEN', '515.124.4269', '1987-06-27', 'FI_ACCOUNT', '8200.00', '0.00', '108', '100'),
('111', 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '1987-06-28', 'FI_ACCOUNT', '7700.00', '0.00', '108', '100'),
('112', 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '1987-06-29', 'FI_ACCOUNT', '7800.00', '0.00', '108', '100'),
('113', 'Luis', 'Popp', 'LPOPP', '515.124.4567', '1987-06-30', 'FI_ACCOUNT', '6900.00', '0.00', '108', '100'),
('114', 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '1987-07-01', 'PU_MAN', '11000.00', '0.00', '100', '30'),
('115', 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '1987-07-02', 'PU_CLERK', '3100.00', '0.00', '114', '30'),
('116', 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '1987-07-03', 'PU_CLERK', '2900.00', '0.00', '114', '30'),
('117', 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '1987-07-04', 'PU_CLERK', '2800.00', '0.00', '114', '30'),
('118', 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '1987-07-05', 'PU_CLERK', '2600.00', '0.00', '114', '30'),
('119', 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '1987-07-06', 'PU_CLERK', '2500.00', '0.00', '114', '30'),
('120', 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '1987-07-07', 'ST_MAN', '8000.00', '0.00', '100', '50'),
('121', 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '1987-07-08', 'ST_MAN', '8200.00', '0.00', '100', '50'),
('122', 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '1987-07-09', 'ST_MAN', '7900.00', '0.00', '100', '50'),
('123', 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', '1987-07-10', 'ST_MAN', '6500.00', '0.00', '100', '50'),
('124', 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '1987-07-11', 'ST_MAN', '5800.00', '0.00', '100', '50'),
('125', 'Julia', 'Nayer', 'JNAYER', '650.124.1214', '1987-07-12', 'ST_CLERK', '3200.00', '0.00', '120', '50'),
('126', 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', '1987-07-13', 'ST_CLERK', '2700.00', '0.00', '120', '50'),
('127', 'James', 'Landry', 'JLANDRY', '650.124.1334', '1987-07-14', 'ST_CLERK', '2400.00', '0.00', '120', '50'),
('128', 'Steven', 'Markle', 'SMARKLE', '650.124.1434', '1987-07-15', 'ST_CLERK', '2200.00', '0.00', '120', '50'),
('129', 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', '1987-07-16', 'ST_CLERK', '3300.00', '0.00', '121', '50'),
('130', 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', '1987-07-17', 'ST_CLERK', '2800.00', '0.00', '121', '50'),
('131', 'James', 'Marlow', 'JAMRLOW', '650.124.7234', '1987-07-18', 'ST_CLERK', '2500.00', '0.00', '121', '50'),
('132', 'TJ', 'Olson', 'TJOLSON', '650.124.8234', '1987-07-19', 'ST_CLERK', '2100.00', '0.00', '121', '50'),
('133', 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', '1987-07-20', 'ST_CLERK', '3300.00', '0.00', '122', '50'),
('134', 'Michael', 'Rogers', 'MROGERS', '650.127.1834', '1987-07-21', 'ST_CLERK', '2900.00', '0.00', '122', '50'),
('135', 'Ki', 'Gee', 'KGEE', '650.127.1734', '1987-07-22', 'ST_CLERK', '2400.00', '0.00', '122', '50'),
('136', 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', '1987-07-23', 'ST_CLERK', '2200.00', '0.00', '122', '50'),
('137', 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', '1987-07-24', 'ST_CLERK', '3600.00', '0.00', '123', '50'),
('138', 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', '1987-07-25', 'ST_CLERK', '3200.00', '0.00', '123', '50'),
('139', 'John', 'Seo', 'JSEO', '650.121.2019', '1987-07-26', 'ST_CLERK', '2700.00', '0.00', '123', '50'),
('140', 'Joshua', 'Patel', 'JPATEL', '650.121.1834', '1987-07-27', 'ST_CLERK', '2500.00', '0.00', '123', '50'),
('141', 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', '1987-07-28', 'ST_CLERK', '3500.00', '0.00', '124', '50'),
('142', 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', '1987-07-29', 'ST_CLERK', '3100.00', '0.00', '124', '50'),
('143', 'Randall', 'Matos', 'RMATOS', '650.121.2874', '1987-07-30', 'ST_CLERK', '2600.00', '0.00', '124', '50'),
('144', 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', '1987-07-31', 'ST_CLERK', '2500.00', '0.00', '124', '50'),
('145', 'John', 'Russell', 'JRUSSEL', '011.44.1344.429268', '1987-08-01', 'SA_MAN', '14000.00', '0.40', '100', '80'),
('146', 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', '1987-08-02', 'SA_MAN', '13500.00', '0.30', '100', '80'),
('147', 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', '1987-08-03', 'SA_MAN', '12000.00', '0.30', '100', '80'),
('148', 'Gerald', 'Cambrault', 'GCAMBRAU', '011.44.1344.619268', '1987-08-04', 'SA_MAN', '11000.00', '0.30', '100', '80'),
('149', 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', '1987-08-05', 'SA_MAN', '10500.00', '0.20', '100', '80'),
('150', 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', '1987-08-06', 'SA_REP', '10000.00', '0.30', '145', '80'),
('151', 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', '1987-08-07', 'SA_REP', '9500.00', '0.25', '145', '80'),
('152', 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', '1987-08-08', 'SA_REP', '9000.00', '0.25', '145', '80'),
('153', 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', '1987-08-09', 'SA_REP', '8000.00', '0.20', '145', '80'),
('154', 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', '1987-08-10', 'SA_REP', '7500.00', '0.20', '145', '80'),
('155', 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', '1987-08-11', 'SA_REP', '7000.00', '0.15', '145', '80'),
('156', 'Janette', 'King', 'JKING', '011.44.1345.429268', '1987-08-12', 'SA_REP', '10000.00', '0.35', '146', '80'),
('157', 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', '1987-08-13', 'SA_REP', '9500.00', '0.35', '146', '80'),
('158', 'Allan', 'McEwen', 'AMCEWEN', '011.44.1345.829268', '1987-08-14', 'SA_REP', '9000.00', '0.35', '146', '80'),
('159', 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', '1987-08-15', 'SA_REP', '8000.00', '0.30', '146', '80'),
('160', 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', '1987-08-16', 'SA_REP', '7500.00', '0.30', '146', '80'),
('161', 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', '1987-08-17', 'SA_REP', '7000.00', '0.25', '146', '80'),
('162', 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', '1987-08-18', 'SA_REP', '10500.00', '0.25', '147', '80'),
('163', 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', '1987-08-19', 'SA_REP', '9500.00', '0.15', '147', '80'),
('164', 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', '1987-08-20', 'SA_REP', '7200.00', '0.10', '147', '80'),
('165', 'David', 'Lee', 'DLEE', '011.44.1346.529268', '1987-08-21', 'SA_REP', '6800.00', '0.10', '147', '80'),
('166', 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', '1987-08-22', 'SA_REP', '6400.00', '0.10', '147', '80'),
('167', 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', '1987-08-23', 'SA_REP', '6200.00', '0.10', '147', '80'),
('168', 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', '1987-08-24', 'SA_REP', '11500.00', '0.25', '148', '80'),
('169', 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', '1987-08-25', 'SA_REP', '10000.00', '0.20', '148', '80'),
('170', 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', '1987-08-26', 'SA_REP', '9600.00', '0.20', '148', '80'),
('171', 'William', 'Smith', 'WSMITH', '011.44.1343.629268', '1987-08-27', 'SA_REP', '7400.00', '0.15', '148', '80'),
('172', 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', '1987-08-28', 'SA_REP', '7300.00', '0.15', '148', '80'),
('173', 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', '1987-08-29', 'SA_REP', '6100.00', '0.10', '148', '80'),
('174', 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', '1987-08-30', 'SA_REP', '11000.00', '0.30', '149', '80'),
('175', 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', '1987-08-31', 'SA_REP', '8800.00', '0.25', '149', '80'),
('176', 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', '1987-09-01', 'SA_REP', '8600.00', '0.20', '149', '80'),
('177', 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', '1987-09-02', 'SA_REP', '8400.00', '0.20', '149', '80'),
('178', 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', '1987-09-03', 'SA_REP', '7000.00', '0.15', '149', '0'),
('179', 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', '1987-09-04', 'SA_REP', '6200.00', '0.10', '149', '80'),
('180', 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', '1987-09-05', 'SH_CLERK', '3200.00', '0.00', '120', '50'),
('181', 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', '1987-09-06', 'SH_CLERK', '3100.00', '0.00', '120', '50'),
('182', 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', '1987-09-07', 'SH_CLERK', '2500.00', '0.00', '120', '50'),
('183', 'Girard', 'Geoni', 'GGEONI', '650.507.9879', '1987-09-08', 'SH_CLERK', '2800.00', '0.00', '120', '50'),
('184', 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', '1987-09-09', 'SH_CLERK', '4200.00', '0.00', '121', '50'),
('185', 'Alexis', 'Bull', 'ABULL', '650.509.2876', '1987-09-10', 'SH_CLERK', '4100.00', '0.00', '121', '50'),
('186', 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', '1987-09-11', 'SH_CLERK', '3400.00', '0.00', '121', '50'),
('187', 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', '1987-09-12', 'SH_CLERK', '3000.00', '0.00', '121', '50'),
('188', 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', '1987-09-13', 'SH_CLERK', '3800.00', '0.00', '122', '50'),
('189', 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', '1987-09-14', 'SH_CLERK', '3600.00', '0.00', '122', '50'),
('190', 'Timothy', 'Gates', 'TGATES', '650.505.3876', '1987-09-15', 'SH_CLERK', '2900.00', '0.00', '122', '50'),
('191', 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', '1987-09-16', 'SH_CLERK', '2500.00', '0.00', '122', '50'),
('192', 'Sarah', 'Bell', 'SBELL', '650.501.1876', '1987-09-17', 'SH_CLERK', '4000.00', '0.00', '123', '50'),
('193', 'Britney', 'Everett', 'BEVERETT', '650.501.2876', '1987-09-18', 'SH_CLERK', '3900.00', '0.00', '123', '50'),
('194', 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', '1987-09-19', 'SH_CLERK', '3200.00', '0.00', '123', '50'),
('195', 'Vance', 'Jones', 'VJONES', '650.501.4876', '1987-09-20', 'SH_CLERK', '2800.00', '0.00', '123', '50'),
('196', 'Alana', 'Walsh', 'AWALSH', '650.507.9811', '1987-09-21', 'SH_CLERK', '3100.00', '0.00', '124', '50'),
('197', 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', '1987-09-22', 'SH_CLERK', '3000.00', '0.00', '124', '50'),
('198', 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', '1987-09-23', 'SH_CLERK', '2600.00', '0.00', '124', '50'),
('199', 'Douglas', 'Grant', 'DGRANT', '650.507.9844', '1987-09-24', 'SH_CLERK', '2600.00', '0.00', '124', '50'),
('200', 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '1987-09-25', 'AD_ASST', '4400.00', '0.00', '101', '10'),
('201', 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', '1987-09-26', 'MK_MAN', '13000.00', '0.00', '100', '20'),
('202', 'Pat', 'Fay', 'PFAY', '603.123.6666', '1987-09-27', 'MK_REP', '6000.00', '0.00', '201', '20'),
('203', 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', '1987-09-28', 'HR_REP', '6500.00', '0.00', '101', '40'),
('204', 'Hermann', 'Baer', 'HBAER', '515.123.8888', '1987-09-29', 'PR_REP', '10000.00', '0.00', '101', '70'),
('205', 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', '1987-09-30', 'AC_MGR', '12000.00', '0.00', '101', '110'),
('206', 'William', 'Gietz', 'WGIETZ', '515.123.8181', '1987-10-01', 'AC_ACCOUNT', '8300.00', '0.00', '205', '110');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `JOB_ID` varchar(10) NOT NULL DEFAULT '',
  `JOB_TITLE` varchar(35) NOT NULL,
  `MIN_SALARY` decimal(6,0) DEFAULT NULL,
  `MAX_SALARY` decimal(6,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`JOB_ID`, `JOB_TITLE`, `MIN_SALARY`, `MAX_SALARY`) VALUES
('AD_PRES', 'President', '20000', '40000'),
('AD_VP', 'Administration Vice President', '15000', '30000'),
('AD_ASST', 'Administration Assistant', '3000', '6000'),
('FI_MGR', 'Finance Manager', '8200', '16000'),
('FI_ACCOUNT', 'Accountant', '4200', '9000'),
('AC_MGR', 'Accounting Manager', '8200', '16000'),
('AC_ACCOUNT', 'Public Accountant', '4200', '9000'),
('SA_MAN', 'Sales Manager', '10000', '20000'),
('SA_REP', 'Sales Representative', '6000', '12000'),
('PU_MAN', 'Purchasing Manager', '8000', '15000'),
('PU_CLERK', 'Purchasing Clerk', '2500', '5500'),
('ST_MAN', 'Stock Manager', '5500', '8500'),
('ST_CLERK', 'Stock Clerk', '2000', '5000'),
('SH_CLERK', 'Shipping Clerk', '2500', '5500'),
('IT_PROG', 'Programmer', '4000', '10000'),
('MK_MAN', 'Marketing Manager', '9000', '15000'),
('MK_REP', 'Marketing Representative', '4000', '9000'),
('HR_REP', 'Human Resources Representative', '4000', '9000'),
('PR_REP', 'Public Relations Representative', '4500', '10500');

-- --------------------------------------------------------

--
-- Table structure for table `job_history`
--

CREATE TABLE `job_history` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_history`
--

INSERT INTO `job_history` (`EMPLOYEE_ID`, `START_DATE`, `END_DATE`, `JOB_ID`, `DEPARTMENT_ID`) VALUES
('102', '1993-01-13', '1998-07-24', 'IT_PROG', '60'),
('101', '1989-09-21', '1993-10-27', 'AC_ACCOUNT', '110'),
('101', '1993-10-28', '1997-03-15', 'AC_MGR', '110'),
('201', '1996-02-17', '1999-12-19', 'MK_REP', '20'),
('114', '1998-03-24', '1999-12-31', 'ST_CLERK', '50'),
('122', '1999-01-01', '1999-12-31', 'ST_CLERK', '50'),
('200', '1987-09-17', '1993-06-17', 'AD_ASST', '90'),
('176', '1998-03-24', '1998-12-31', 'SA_REP', '80'),
('176', '1999-01-01', '1999-12-31', 'SA_MAN', '80'),
('200', '1994-07-01', '1998-12-31', 'AC_ACCOUNT', '90');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `LOCATION_ID` decimal(4,0) NOT NULL DEFAULT 0,
  `STREET_ADDRESS` varchar(40) DEFAULT NULL,
  `POSTAL_CODE` varchar(12) DEFAULT NULL,
  `CITY` varchar(30) NOT NULL,
  `STATE_PROVINCE` varchar(25) DEFAULT NULL,
  `COUNTRY_ID` varchar(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`LOCATION_ID`, `STREET_ADDRESS`, `POSTAL_CODE`, `CITY`, `STATE_PROVINCE`, `COUNTRY_ID`) VALUES
('1000', '1297 Via Cola di Rie', '989', 'Roma', '', 'IT'),
('1100', '93091 Calle della Testa', '10934', 'Venice', '', 'IT'),
('1200', '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'),
('1300', '9450 Kamiya-cho', '6823', 'Hiroshima', '', 'JP'),
('1400', '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
('1500', '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
('1600', '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'),
('1700', '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
('1800', '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
('1900', '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
('2000', '40-5-12 Laogianggen', '190518', 'Beijing', '', 'CN'),
('2100', '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'),
('2200', '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU'),
('2300', '198 Clementi North', '540198', 'Singapore', '', 'SG'),
('2400', '8204 Arthur St', '', 'London', '', 'UK'),
('2500', '\"Magdalen Centre', ' The Oxford ', 'OX9 9ZB', 'Oxford', 'Ox'),
('2600', '9702 Chester Road', '9629850293', 'Stretford', 'Manchester', 'UK'),
('2700', 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'),
('2800', 'Rua Frei Caneca 1360', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'),
('2900', '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH'),
('3000', 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'),
('3100', 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL'),
('3200', 'Mariano Escobedo 9991', '11932', 'Mexico City', '\"Distrito Federal', '\"');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `session` varchar(255) NOT NULL,
  `first_visited` datetime NOT NULL,
  `visits` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `session`, `first_visited`, `visits`) VALUES
(129, 'login', '66040e8212bbdec9fb70dc50673e583c', '2022-02-22 13:32:46', 3),
(130, 'register', '66040e8212bbdec9fb70dc50673e583c', '2022-02-22 13:32:55', 4),
(131, 'about', '66040e8212bbdec9fb70dc50673e583c', '2022-02-22 13:32:58', 1),
(132, 'login', 'a5e606cac4d0929177bc87908dde131a', '2022-02-22 13:36:47', 4),
(133, 'home', 'a5e606cac4d0929177bc87908dde131a', '2022-02-22 13:37:02', 1),
(134, 'profile', 'a5e606cac4d0929177bc87908dde131a', '2022-02-22 13:37:10', 1),
(135, 'login', '1ad6cf5d71534e2885e06b475a8fd4cd', '2022-02-24 10:26:03', 3),
(136, 'login', 'acb3599e5226ac19c3a7b8ef7ac21519', '2022-02-24 10:28:52', 2),
(137, 'login', 'f14384cbc05fa08e2224e0e6c711b194', '2022-02-24 10:31:41', 2),
(138, 'login', '4a77c27a7f1003076e830d742e23fc75', '2022-02-24 11:12:57', 3),
(139, 'login', 'cafcdfb26d675418e866a2e7a431edf9', '2022-02-24 11:16:05', 2),
(140, 'login', '9dc4661b4b19e81529822ed46d6ef3d6', '2022-02-24 11:23:51', 3),
(141, 'login', 'a94277e778c0e569100d4b165d46c874', '2022-02-24 11:36:40', 2),
(142, 'login', 'c7705dd040878df71dc7f2f982f7f342', '2022-02-24 11:39:20', 2),
(143, 'login', '0f619c77ad7ad24eecc47d538f684358', '2022-02-24 12:01:36', 2),
(144, 'login', 'acf85d7471156ecd34c93567a621b497', '2022-02-24 12:03:37', 2),
(145, 'login', '575f0e2d6ab56ba1e82c4a60ad5c0a39', '2022-02-24 12:06:36', 2),
(146, 'login', '46d9d5b00a7ab0a8b0107a2632d7cd59', '2022-02-24 12:09:14', 2),
(147, 'login', '219fe09b3fa81bf46dfbf80821997ebb', '2022-02-24 12:12:20', 2),
(148, 'login', 'e2bdb4e0b59efaf146f31bebb16287d8', '2022-02-24 12:13:49', 2),
(149, 'login', '43106801101adce5e0c6eb25dc7b407d', '2022-02-24 12:15:12', 2),
(150, 'login', '79d869bd17cf2d17ab5538150aca2f03', '2022-02-24 12:17:32', 2),
(151, 'login', '9f23742f36740ceca4f51a334fd7df2f', '2022-02-24 12:18:59', 3),
(152, 'login', '44cc8be2449a3a6087a4f91eb15d36b0', '2022-02-24 13:19:07', 2),
(153, 'login', 'e3b6092b9f8d33f091c5a15792b100f6', '2022-02-24 13:20:55', 2),
(154, 'login', 'aa5ed3997c048164f7d732d65287ecc5', '2022-02-24 13:24:48', 2),
(155, 'login', 'be419b0694cfe8cd2363e085c00463f8', '2022-03-01 15:03:41', 2),
(156, 'login', 'ced991c781f4455a86f80339d38e822f', '2022-03-01 15:06:02', 2),
(157, 'login', 'fb91bc7cb074b44f410ba20f60d3143b', '2022-03-01 15:09:56', 9),
(158, 'login', '47cead176686f4dc069c29b8e19447eb', '2022-03-01 15:14:20', 4),
(159, 'login', 'c7baa5f02716f665b85db8782fe48e2f', '2022-03-01 15:16:18', 4),
(160, 'login', '0b951cfcdaafa153c8d9c25c4395051b', '2022-03-01 15:22:41', 2),
(161, 'login', '20a01c84688cff0faa21b34c4cf940f8', '2022-03-01 15:25:06', 3),
(162, 'login', 'e2bd53d378ec853ba5756965c779f3fd', '2022-03-01 15:28:42', 3),
(163, 'login', '4792e1245add2d2520c9fcfdd0cedcb9', '2022-03-01 15:31:30', 3),
(164, 'login', '44cda1a5f9dbbe4d4072adb240e36557', '2022-03-01 15:32:56', 5),
(165, 'login', 'b70bc8b53cac47a3236e2e1ebda2f501', '2022-03-01 17:52:23', 2),
(166, 'login', '7cd340c398a142054b9ecb26ae89a96c', '2022-03-01 18:22:21', 1),
(167, 'login', 'ac0ddc618f341b7ae26206482d9b37f8', '2022-03-01 18:24:52', 2),
(168, 'home', 'ac0ddc618f341b7ae26206482d9b37f8', '2022-03-01 18:25:08', 1),
(169, 'login', '2004e20d5d39d66eeade690085218bf1', '2022-03-01 18:27:05', 2),
(170, 'home', '2004e20d5d39d66eeade690085218bf1', '2022-03-01 18:28:14', 1),
(171, 'login', '10448e24be0d0086f2ab0f55711e650f', '2022-03-01 18:28:57', 4),
(172, 'home', '10448e24be0d0086f2ab0f55711e650f', '2022-03-01 18:29:07', 1),
(173, 'login', 'c21281dc1cca99d40c376284e7333af9', '2022-03-01 18:31:41', 2),
(174, 'home', 'c21281dc1cca99d40c376284e7333af9', '2022-03-01 18:32:03', 2),
(175, 'login', '69fc98d4c9f5c7e0ea15fdab6997b7cf', '2022-03-01 18:34:20', 2),
(176, 'home', '69fc98d4c9f5c7e0ea15fdab6997b7cf', '2022-03-01 18:34:32', 1),
(177, 'login', '05d129af14f2fa4fc968b9982396dc20', '2022-03-01 18:35:53', 2),
(178, 'home', '05d129af14f2fa4fc968b9982396dc20', '2022-03-01 18:36:06', 2),
(179, 'login', 'f9f2b58836e73710d2a966f1ea6be86a', '2022-03-01 18:41:01', 2),
(180, 'login', '06b26e3c6f299765006024be9234892d', '2022-03-01 18:42:10', 4),
(181, 'login', '3ff59416b83514f097ab5dc369daaac4', '2022-03-01 18:49:56', 4),
(182, 'login', '112e4845964fc8f0f190f1392c789bac', '2022-03-01 19:13:11', 2),
(183, 'login', '0aedc215a50688c5688cd539decebce9', '2022-03-01 19:14:55', 4),
(184, 'login', 'a5fc4dcb201f2b394852f6be0c00c058', '2022-03-01 19:19:01', 2),
(185, 'login', '292313fc30a55b924157da2b735ddb4d', '2022-03-01 19:22:51', 2),
(186, 'login', '591081e4d8da42d9d1039d07a1b441ae', '2022-03-01 19:26:21', 2),
(187, 'login', 'e6cb75334c3dedc08fcd4c2d73ccacd6', '2022-03-01 19:28:58', 2),
(188, 'profile', 'e6cb75334c3dedc08fcd4c2d73ccacd6', '2022-03-01 19:31:22', 1),
(189, 'login', '88c489137244e5aae8130f5d597d13c0', '2022-03-01 19:36:36', 2),
(190, 'login', '18746b0c5c870f0333eddd30b390f308', '2022-03-01 19:37:18', 2),
(191, 'login', '7fba59a96b0331a5cfd8f8f00dfb4973', '2022-03-01 19:40:07', 2),
(192, 'login', '5bdc7eaf9eb155b35ff0d3a942a2e426', '2022-03-01 19:40:52', 2),
(193, 'home', '5bdc7eaf9eb155b35ff0d3a942a2e426', '2022-03-01 19:41:07', 2),
(194, 'login', '003cca9d1d8af138cea9d851f53dd94d', '2022-03-01 19:46:58', 2),
(195, 'home', '003cca9d1d8af138cea9d851f53dd94d', '2022-03-01 19:47:10', 1),
(196, 'login', '689909d113eb4326be26977f86b804f1', '2022-03-01 19:59:31', 2),
(197, 'home', '689909d113eb4326be26977f86b804f1', '2022-03-01 19:59:43', 1),
(198, 'login', 'f8ae290ee9d809c0946a7483d3e7742e', '2022-03-01 20:01:47', 2),
(199, 'home', 'f8ae290ee9d809c0946a7483d3e7742e', '2022-03-01 20:01:57', 1),
(200, 'login', 'b37982407d2df4f51f3d8f947f1c75ea', '2022-03-01 20:13:14', 2),
(201, 'home', 'b37982407d2df4f51f3d8f947f1c75ea', '2022-03-01 20:13:25', 1),
(202, 'login', '7af441755fcf9fde3ad6fb2aa467599c', '2022-03-01 20:20:32', 2),
(203, 'home', '7af441755fcf9fde3ad6fb2aa467599c', '2022-03-01 20:20:43', 1),
(204, 'login', '6ea72670c775e14e3e7ec3f551030685', '2022-03-01 20:22:27', 2),
(205, 'home', '6ea72670c775e14e3e7ec3f551030685', '2022-03-01 20:22:40', 1),
(206, 'login', '3cbf1a654ce83057487c4da6accef4ca', '2022-03-01 20:23:38', 2),
(207, 'home', '3cbf1a654ce83057487c4da6accef4ca', '2022-03-01 20:23:50', 1),
(208, 'login', 'bb78cd564b74ba404bb9b5210bb74156', '2022-03-01 20:25:34', 2),
(209, 'home', 'bb78cd564b74ba404bb9b5210bb74156', '2022-03-01 20:25:50', 1),
(210, 'login', '6bf3a040625fae5def0f99c92943fa0a', '2022-03-01 21:20:16', 2),
(211, 'home', '6bf3a040625fae5def0f99c92943fa0a', '2022-03-01 21:20:30', 1),
(212, 'login', 'f69961b021d924f2c6abdf1794b90cc1', '2022-03-01 22:30:09', 2),
(213, 'home', 'f69961b021d924f2c6abdf1794b90cc1', '2022-03-01 22:30:21', 2),
(214, 'login', '051732e91efc4ae1b5fb68682626fd8f', '2022-03-01 22:33:12', 3),
(215, 'home', '051732e91efc4ae1b5fb68682626fd8f', '2022-03-01 22:33:23', 1),
(216, 'login', '5a53ab3c937286f41b9667d985e46244', '2022-03-01 22:36:48', 2),
(217, 'home', '5a53ab3c937286f41b9667d985e46244', '2022-03-01 22:36:58', 1),
(218, 'login', '663ce7ecfe14c24efad25544c1dba134', '2022-03-01 22:38:17', 2),
(219, 'home', '663ce7ecfe14c24efad25544c1dba134', '2022-03-01 22:38:27', 1),
(220, 'login', '6de52e1aee9737940b3d16e290fa4096', '2022-03-01 22:40:55', 2),
(221, 'home', '6de52e1aee9737940b3d16e290fa4096', '2022-03-01 22:41:04', 1),
(222, 'login', 'dd8ae04e61d028d113eeeeb78d4fe805', '2022-03-01 22:42:53', 2),
(223, 'home', 'dd8ae04e61d028d113eeeeb78d4fe805', '2022-03-01 22:43:04', 1),
(224, 'login', 'b9411531fd171062ad1b20262e51243b', '2022-03-01 22:44:45', 2),
(225, 'home', 'b9411531fd171062ad1b20262e51243b', '2022-03-01 22:44:54', 1),
(226, 'login', 'fbb42b71ca74bae8ec1761c238424a82', '2022-03-01 22:46:38', 4),
(227, 'home', 'fbb42b71ca74bae8ec1761c238424a82', '2022-03-01 22:47:23', 2),
(228, 'login', '416531cd6bc6bb86d4ec776e52c9e11c', '2022-03-01 22:49:42', 2),
(229, 'home', '416531cd6bc6bb86d4ec776e52c9e11c', '2022-03-01 22:49:56', 1),
(230, 'login', '17ed33c6fab1bcc93f906e21a2ecbda4', '2022-03-01 22:52:53', 2),
(231, 'home', '17ed33c6fab1bcc93f906e21a2ecbda4', '2022-03-01 22:53:06', 1),
(232, 'login', '834ebd7213d58350016abbac7857daf9', '2022-03-01 22:55:17', 2),
(233, 'home', '834ebd7213d58350016abbac7857daf9', '2022-03-01 22:55:27', 1),
(234, 'login', 'd0c8236cb990e19d963e2c18223fb46d', '2022-03-01 22:57:06', 2),
(235, 'home', 'd0c8236cb990e19d963e2c18223fb46d', '2022-03-01 22:57:17', 1),
(236, 'login', '187038fb327b4ccdaf31cc285dce2a31', '2022-03-01 22:58:47', 2),
(237, 'home', '187038fb327b4ccdaf31cc285dce2a31', '2022-03-01 22:58:57', 1),
(238, 'login', 'd47654e73b6836ef67430e5a31ec2b27', '2022-03-03 18:55:32', 4),
(239, 'home', 'd47654e73b6836ef67430e5a31ec2b27', '2022-03-03 18:55:46', 1),
(240, 'login', '6830e4e87a18b1a13840ef7b5e1ed102', '2022-03-03 19:02:50', 2),
(241, 'login', '388589f143a6543408e3c8e7bbb28dc2', '2022-03-03 19:11:57', 2),
(242, 'login', '08194b39462e323e55ffb03f322e5730', '2022-03-03 19:20:35', 2),
(243, 'login', 'd665f676da8ad17ae9de84739247fd3c', '2022-03-03 19:22:43', 2),
(244, 'login', '9b0dcb0ae2226238e363809adcbd1fa8', '2022-03-03 19:24:13', 2),
(245, 'login', '92c103c6f316249d9509f6479611c6b3', '2022-03-03 19:26:03', 2),
(246, 'login', '57173b97c5235a777a436ead2f095639', '2022-03-03 19:44:22', 2),
(247, 'login', '30cd63b00af1eb4ebee3df425934fe41', '2022-03-03 19:47:19', 2),
(248, 'login', 'b76c5d6f2bc9190f5a4546c4a14ee0eb', '2022-03-03 19:49:39', 2),
(249, 'login', '44a4044a8a7bb470e4e222328b543f90', '2022-03-03 19:56:30', 2),
(250, 'login', 'd4638ccc32864febfb26698dabeea3f3', '2022-03-03 19:57:56', 2),
(251, 'login', '0e5859f65409955644032899c703db66', '2022-03-03 20:00:12', 2),
(252, 'login', '19538c6bdfdd1af2f4e5c964f9ca106f', '2022-03-03 20:01:12', 3),
(253, 'login', 'f23d874660b445c3a97a7db37a3b9620', '2022-03-03 20:12:57', 2),
(254, 'login', '7fe3c3b68c29513a8154a469c0193a61', '2022-03-03 20:13:48', 2),
(255, 'login', '8d6307d80ea7c577695aceff22e3c80d', '2022-03-03 20:19:08', 2),
(256, 'login', '16f809c337f02d73d96ae9a195880c33', '2022-03-03 20:24:28', 2),
(257, 'login', 'eb70561ef179b082e2e1327d7b0c3c59', '2022-03-03 20:28:17', 2),
(258, 'login', '190921d165ab843e054207df1bd22940', '2022-03-03 20:35:50', 2),
(259, 'login', '073d09a85b18b83d7937e6802ccf9c30', '2022-03-03 20:38:30', 2),
(260, 'login', 'cd95304b5657ee9b698414d3eb479e75', '2022-03-03 20:39:50', 2),
(261, 'login', 'f24de92978fa166962d80e1ad53a0dc4', '2022-03-03 20:43:31', 2),
(262, 'login', '99c67daae763047bf179f46b0d342f9f', '2022-03-03 20:50:01', 2),
(263, 'login', 'ca69c8ba566d77cdb1226483a2a38fdd', '2022-03-03 20:51:35', 2),
(264, 'login', '3336bc479e2478c92009c32ae1875c4d', '2022-03-03 20:55:04', 2),
(265, 'login', '51e88a628bab01d1c70863d719096971', '2022-03-03 20:59:08', 2),
(266, 'login', '1baa71e50bf57b82b5c7a7d352f25cf9', '2022-03-03 21:01:44', 2),
(267, 'login', '64ec10ac5f92a232f565342faf975b09', '2022-03-03 21:03:58', 2),
(268, 'login', '038e9804e1af61f8b30502cc89a4c4e6', '2022-03-03 21:05:35', 2),
(269, 'login', '0d5ddb2bb8c95991e22dd6ac0f493b7e', '2022-03-03 21:13:42', 2),
(270, 'login', 'fe5480fb989dc6fcc63ddbee8121c298', '2022-03-03 21:15:37', 2),
(271, 'login', '7792262f055ff135bf7cb8778084a1a8', '2022-03-03 21:17:03', 2),
(272, 'login', 'b8342ecf072d45b92e1efbc996d1125d', '2022-03-03 21:19:29', 2),
(273, 'login', 'ff07f5f8fc82b8f24e8e3d76af0b0963', '2022-03-03 21:24:50', 2),
(274, 'login', 'fb8252868f277f4ddad018b470505da1', '2022-03-03 21:31:20', 2),
(275, 'home', 'fb8252868f277f4ddad018b470505da1', '2022-03-03 21:32:28', 1),
(276, 'login', '3e3f5c488cdf0ee67e69e93c21ce972f', '2022-03-03 21:39:59', 2),
(277, 'login', 'a77da86d4b018e0f1278604e322f6793', '2022-03-03 21:41:40', 2),
(278, 'login', 'ef41bead04d6fa8fb07233b0560f2ada', '2022-03-03 21:43:29', 2),
(279, 'login', '8420408ef529c92c3966bd0951bced2c', '2022-03-03 21:59:20', 2),
(280, 'login', 'e0bec37f9e3264902daa25b2a16a52f2', '2022-03-03 22:00:44', 2),
(281, 'login', 'cef1aa9ad5c9c0b57a888c7eb18234f9', '2022-03-03 22:11:26', 2);

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `REGION_ID` decimal(5,0) NOT NULL,
  `REGION_NAME` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`REGION_ID`, `REGION_NAME`) VALUES
('1', 'Europe\r'),
('2', 'Americas\r'),
('3', 'Asia\r'),
('4', 'Middle East and Africa\r');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `ip` varchar(225) NOT NULL,
  `continent` varchar(225) NOT NULL,
  `country` varchar(225) NOT NULL,
  `city` varchar(225) NOT NULL,
  `os` varchar(225) NOT NULL,
  `browser` varchar(225) NOT NULL,
  `session` varchar(225) NOT NULL,
  `created_at` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `ip`, `continent`, `country`, `city`, `os`, `browser`, `session`, `created_at`, `status`) VALUES
(72, '102.40.24.45', 'Africa', 'Egypt', 'Cairo', 'iOS', 'Safari', '66040e8212bbdec9fb70dc50673e583c', '2022-02-22 13:32:45', 0),
(73, '102.40.24.45', 'Africa', 'Egypt', 'Cairo', 'iOS', 'Safari', 'a5e606cac4d0929177bc87908dde131a', '2022-02-22 13:36:46', 0),
(74, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', '1ad6cf5d71534e2885e06b475a8fd4cd', '2022-02-24 10:26:02', 1),
(75, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', 'acb3599e5226ac19c3a7b8ef7ac21519', '2022-02-24 10:28:51', 1),
(76, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', 'f14384cbc05fa08e2224e0e6c711b194', '2022-02-24 10:31:39', 1),
(77, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', '4a77c27a7f1003076e830d742e23fc75', '2022-02-24 11:12:56', 1),
(78, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', 'cafcdfb26d675418e866a2e7a431edf9', '2022-02-24 11:16:04', 1),
(79, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', '9dc4661b4b19e81529822ed46d6ef3d6', '2022-02-24 11:23:50', 1),
(80, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', 'a94277e778c0e569100d4b165d46c874', '2022-02-24 11:36:39', 1),
(81, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', 'c7705dd040878df71dc7f2f982f7f342', '2022-02-24 11:39:19', 1),
(82, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', '0f619c77ad7ad24eecc47d538f684358', '2022-02-24 12:01:35', 1),
(83, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', 'acf85d7471156ecd34c93567a621b497', '2022-02-24 12:03:37', 1),
(84, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', '575f0e2d6ab56ba1e82c4a60ad5c0a39', '2022-02-24 12:06:35', 1),
(85, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', '46d9d5b00a7ab0a8b0107a2632d7cd59', '2022-02-24 12:09:13', 1),
(86, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', '219fe09b3fa81bf46dfbf80821997ebb', '2022-02-24 12:12:19', 1),
(87, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', 'e2bdb4e0b59efaf146f31bebb16287d8', '2022-02-24 12:13:48', 1),
(88, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', '43106801101adce5e0c6eb25dc7b407d', '2022-02-24 12:15:11', 1),
(89, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', '79d869bd17cf2d17ab5538150aca2f03', '2022-02-24 12:17:32', 1),
(90, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', '9f23742f36740ceca4f51a334fd7df2f', '2022-02-24 12:18:58', 1),
(91, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', '44cc8be2449a3a6087a4f91eb15d36b0', '2022-02-24 13:19:06', 1),
(92, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', 'e3b6092b9f8d33f091c5a15792b100f6', '2022-02-24 13:20:54', 1),
(93, '102.185.215.170', 'Africa', 'Egypt', 'Tanta', 'Windows', 'ChromiumEdge', 'aa5ed3997c048164f7d732d65287ecc5', '2022-02-24 13:24:47', 1),
(94, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'be419b0694cfe8cd2363e085c00463f8', '2022-03-01 15:03:39', 0),
(95, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'ced991c781f4455a86f80339d38e822f', '2022-03-01 15:06:01', 0),
(96, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'fb91bc7cb074b44f410ba20f60d3143b', '2022-03-01 15:09:55', 0),
(97, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '47cead176686f4dc069c29b8e19447eb', '2022-03-01 15:14:19', 0),
(98, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'c7baa5f02716f665b85db8782fe48e2f', '2022-03-01 15:16:17', 0),
(99, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '0b951cfcdaafa153c8d9c25c4395051b', '2022-03-01 15:22:40', 0),
(100, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '20a01c84688cff0faa21b34c4cf940f8', '2022-03-01 15:25:06', 0),
(101, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'e2bd53d378ec853ba5756965c779f3fd', '2022-03-01 15:28:41', 0),
(102, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '4792e1245add2d2520c9fcfdd0cedcb9', '2022-03-01 15:31:29', 0),
(103, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '44cda1a5f9dbbe4d4072adb240e36557', '2022-03-01 15:32:55', 0),
(104, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'b70bc8b53cac47a3236e2e1ebda2f501', '2022-03-01 17:52:21', 0),
(105, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '7cd340c398a142054b9ecb26ae89a96c', '2022-03-01 18:22:20', 0),
(106, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'ac0ddc618f341b7ae26206482d9b37f8', '2022-03-01 18:24:51', 0),
(107, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '2004e20d5d39d66eeade690085218bf1', '2022-03-01 18:27:04', 0),
(108, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '10448e24be0d0086f2ab0f55711e650f', '2022-03-01 18:28:56', 0),
(109, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'c21281dc1cca99d40c376284e7333af9', '2022-03-01 18:31:40', 0),
(110, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '69fc98d4c9f5c7e0ea15fdab6997b7cf', '2022-03-01 18:34:20', 0),
(111, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '05d129af14f2fa4fc968b9982396dc20', '2022-03-01 18:35:52', 0),
(112, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'f9f2b58836e73710d2a966f1ea6be86a', '2022-03-01 18:41:00', 0),
(113, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '06b26e3c6f299765006024be9234892d', '2022-03-01 18:42:09', 0),
(114, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '3ff59416b83514f097ab5dc369daaac4', '2022-03-01 18:49:56', 0),
(115, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '112e4845964fc8f0f190f1392c789bac', '2022-03-01 19:13:10', 0),
(116, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '0aedc215a50688c5688cd539decebce9', '2022-03-01 19:14:55', 0),
(117, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'a5fc4dcb201f2b394852f6be0c00c058', '2022-03-01 19:19:00', 0),
(118, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '292313fc30a55b924157da2b735ddb4d', '2022-03-01 19:22:50', 0),
(119, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '591081e4d8da42d9d1039d07a1b441ae', '2022-03-01 19:26:20', 0),
(120, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'e6cb75334c3dedc08fcd4c2d73ccacd6', '2022-03-01 19:28:57', 0),
(121, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '88c489137244e5aae8130f5d597d13c0', '2022-03-01 19:36:34', 0),
(122, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '18746b0c5c870f0333eddd30b390f308', '2022-03-01 19:37:17', 0),
(123, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '7fba59a96b0331a5cfd8f8f00dfb4973', '2022-03-01 19:40:06', 0),
(124, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '5bdc7eaf9eb155b35ff0d3a942a2e426', '2022-03-01 19:40:51', 0),
(125, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '003cca9d1d8af138cea9d851f53dd94d', '2022-03-01 19:46:57', 0),
(126, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '689909d113eb4326be26977f86b804f1', '2022-03-01 19:59:29', 0),
(127, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'f8ae290ee9d809c0946a7483d3e7742e', '2022-03-01 20:01:46', 0),
(128, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'b37982407d2df4f51f3d8f947f1c75ea', '2022-03-01 20:13:14', 0),
(129, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '7af441755fcf9fde3ad6fb2aa467599c', '2022-03-01 20:20:31', 0),
(130, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '6ea72670c775e14e3e7ec3f551030685', '2022-03-01 20:22:26', 0),
(131, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '3cbf1a654ce83057487c4da6accef4ca', '2022-03-01 20:23:37', 0),
(132, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'bb78cd564b74ba404bb9b5210bb74156', '2022-03-01 20:25:34', 0),
(133, '41.233.198.125', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '6bf3a040625fae5def0f99c92943fa0a', '2022-03-01 21:20:15', 0),
(134, '41.238.2.147', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'f69961b021d924f2c6abdf1794b90cc1', '2022-03-01 22:30:08', 0),
(135, '41.238.2.147', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '051732e91efc4ae1b5fb68682626fd8f', '2022-03-01 22:33:11', 0),
(136, '41.238.2.147', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '5a53ab3c937286f41b9667d985e46244', '2022-03-01 22:36:47', 0),
(137, '41.238.2.147', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '663ce7ecfe14c24efad25544c1dba134', '2022-03-01 22:38:16', 0),
(138, '41.238.2.147', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '6de52e1aee9737940b3d16e290fa4096', '2022-03-01 22:40:54', 0),
(139, '41.238.2.147', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'dd8ae04e61d028d113eeeeb78d4fe805', '2022-03-01 22:42:52', 0),
(140, '41.238.2.147', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'b9411531fd171062ad1b20262e51243b', '2022-03-01 22:44:44', 0),
(141, '41.238.2.147', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'fbb42b71ca74bae8ec1761c238424a82', '2022-03-01 22:46:37', 0),
(142, '41.238.2.147', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '416531cd6bc6bb86d4ec776e52c9e11c', '2022-03-01 22:49:41', 0),
(143, '41.238.2.147', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '17ed33c6fab1bcc93f906e21a2ecbda4', '2022-03-01 22:52:53', 0),
(144, '41.238.2.147', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '834ebd7213d58350016abbac7857daf9', '2022-03-01 22:55:16', 0),
(145, '41.238.2.147', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'd0c8236cb990e19d963e2c18223fb46d', '2022-03-01 22:57:06', 0),
(146, '41.238.2.147', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '187038fb327b4ccdaf31cc285dce2a31', '2022-03-01 22:58:46', 0),
(147, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'd47654e73b6836ef67430e5a31ec2b27', '2022-03-03 18:55:31', 0),
(148, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '6830e4e87a18b1a13840ef7b5e1ed102', '2022-03-03 19:02:49', 0),
(149, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '388589f143a6543408e3c8e7bbb28dc2', '2022-03-03 19:11:56', 0),
(150, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '08194b39462e323e55ffb03f322e5730', '2022-03-03 19:20:34', 0),
(151, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'd665f676da8ad17ae9de84739247fd3c', '2022-03-03 19:22:42', 0),
(152, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '9b0dcb0ae2226238e363809adcbd1fa8', '2022-03-03 19:24:12', 0),
(153, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '92c103c6f316249d9509f6479611c6b3', '2022-03-03 19:26:02', 0),
(154, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '57173b97c5235a777a436ead2f095639', '2022-03-03 19:44:21', 0),
(155, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '30cd63b00af1eb4ebee3df425934fe41', '2022-03-03 19:47:18', 0),
(156, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'b76c5d6f2bc9190f5a4546c4a14ee0eb', '2022-03-03 19:49:38', 0),
(157, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '44a4044a8a7bb470e4e222328b543f90', '2022-03-03 19:56:29', 0),
(158, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'd4638ccc32864febfb26698dabeea3f3', '2022-03-03 19:57:55', 0),
(159, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '0e5859f65409955644032899c703db66', '2022-03-03 20:00:11', 0),
(160, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '19538c6bdfdd1af2f4e5c964f9ca106f', '2022-03-03 20:01:11', 0),
(161, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'f23d874660b445c3a97a7db37a3b9620', '2022-03-03 20:12:55', 0),
(162, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '7fe3c3b68c29513a8154a469c0193a61', '2022-03-03 20:13:47', 0),
(163, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '8d6307d80ea7c577695aceff22e3c80d', '2022-03-03 20:19:07', 0),
(164, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '16f809c337f02d73d96ae9a195880c33', '2022-03-03 20:24:28', 0),
(165, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'eb70561ef179b082e2e1327d7b0c3c59', '2022-03-03 20:28:16', 0),
(166, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '190921d165ab843e054207df1bd22940', '2022-03-03 20:35:49', 0),
(167, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '073d09a85b18b83d7937e6802ccf9c30', '2022-03-03 20:38:29', 0),
(168, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'cd95304b5657ee9b698414d3eb479e75', '2022-03-03 20:39:49', 0),
(169, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'f24de92978fa166962d80e1ad53a0dc4', '2022-03-03 20:43:30', 0),
(170, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '99c67daae763047bf179f46b0d342f9f', '2022-03-03 20:50:00', 0),
(171, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'ca69c8ba566d77cdb1226483a2a38fdd', '2022-03-03 20:51:34', 0),
(172, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '3336bc479e2478c92009c32ae1875c4d', '2022-03-03 20:55:03', 0),
(173, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '51e88a628bab01d1c70863d719096971', '2022-03-03 20:59:07', 0),
(174, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '1baa71e50bf57b82b5c7a7d352f25cf9', '2022-03-03 21:01:43', 0),
(175, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '64ec10ac5f92a232f565342faf975b09', '2022-03-03 21:03:57', 0),
(176, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '038e9804e1af61f8b30502cc89a4c4e6', '2022-03-03 21:05:34', 0),
(177, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '0d5ddb2bb8c95991e22dd6ac0f493b7e', '2022-03-03 21:13:40', 0),
(178, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'fe5480fb989dc6fcc63ddbee8121c298', '2022-03-03 21:15:36', 0),
(179, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '7792262f055ff135bf7cb8778084a1a8', '2022-03-03 21:17:02', 0),
(180, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'b8342ecf072d45b92e1efbc996d1125d', '2022-03-03 21:19:28', 0),
(181, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'ff07f5f8fc82b8f24e8e3d76af0b0963', '2022-03-03 21:24:49', 0),
(182, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'fb8252868f277f4ddad018b470505da1', '2022-03-03 21:31:19', 0),
(183, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '3e3f5c488cdf0ee67e69e93c21ce972f', '2022-03-03 21:39:58', 0),
(184, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'a77da86d4b018e0f1278604e322f6793', '2022-03-03 21:41:39', 0),
(185, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'ef41bead04d6fa8fb07233b0560f2ada', '2022-03-03 21:43:28', 0),
(186, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', '8420408ef529c92c3966bd0951bced2c', '2022-03-03 21:59:19', 0),
(187, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'e0bec37f9e3264902daa25b2a16a52f2', '2022-03-03 22:00:43', 0),
(188, '41.233.200.214', 'Africa', 'Egypt', 'Cairo', 'Windows', 'ChromiumEdge', 'cef1aa9ad5c9c0b57a888c7eb18234f9', '2022-03-03 22:11:25', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`COUNTRY_ID`),
  ADD KEY `COUNTR_REG_FK` (`REGION_ID`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DEPARTMENT_ID`),
  ADD KEY `DEPT_MGR_FK` (`MANAGER_ID`),
  ADD KEY `DEPT_LOCATION_IX` (`LOCATION_ID`);

--
-- Indexes for table `dummydata`
--
ALTER TABLE `dummydata`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EMPLOYEE_ID`),
  ADD UNIQUE KEY `EMP_EMAIL_UK` (`EMAIL`),
  ADD KEY `EMP_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  ADD KEY `EMP_JOB_IX` (`JOB_ID`),
  ADD KEY `EMP_MANAGER_IX` (`MANAGER_ID`),
  ADD KEY `EMP_NAME_IX` (`LAST_NAME`,`FIRST_NAME`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`JOB_ID`);

--
-- Indexes for table `job_history`
--
ALTER TABLE `job_history`
  ADD PRIMARY KEY (`EMPLOYEE_ID`,`START_DATE`),
  ADD KEY `JHIST_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  ADD KEY `JHIST_EMPLOYEE_IX` (`EMPLOYEE_ID`),
  ADD KEY `JHIST_JOB_IX` (`JOB_ID`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`LOCATION_ID`),
  ADD KEY `LOC_CITY_IX` (`CITY`),
  ADD KEY `LOC_COUNTRY_IX` (`COUNTRY_ID`),
  ADD KEY `LOC_STATE_PROVINCE_IX` (`STATE_PROVINCE`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`REGION_ID`),
  ADD UNIQUE KEY `sss` (`REGION_NAME`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dummydata`
--
ALTER TABLE `dummydata`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
