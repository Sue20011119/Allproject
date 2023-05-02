-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2023-05-02 16:53:33
-- 伺服器版本： 10.4.24-MariaDB
-- PHP 版本： 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `project`
--

-- --------------------------------------------------------

--
-- 資料表結構 `doctor_database`
--

CREATE TABLE `doctor_database` (
  `id` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `notes` varchar(200) NOT NULL,
  `super_administrator` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `doctor_database`
--

INSERT INTO `doctor_database` (`id`, `name`, `password`, `email`, `notes`, `super_administrator`) VALUES
('A00001', '管理員', '1111', '  ', '', 1),
('A00002', '黃醫師', '2222', ' ', '12345', 0),
('A00003', '楊醫師', '3333', ' ', '333333333333333333333333333333333333333333', 0),
('A00004', '張醫師', '4444', '  ', '', 0),
('A00005', '張醫師', '5555', 'C109154244@nkust.edu.tw', 'test*n', 0),
('A00009', '楊醫師', '9999', 'sue20011119@gmail.com', '測試9', 0),
('A00006', '王醫師', '6666', 'C109154244@nkust.edu.tw', '', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `patient_database`
--

CREATE TABLE `patient_database` (
  `id` varchar(10) NOT NULL,
  `account` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `nickname` text NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(3) NOT NULL,
  `diagnosis_left` tinyint(1) NOT NULL,
  `diagnosis_right` tinyint(1) NOT NULL,
  `diagnosis_hemorrhagic` tinyint(1) NOT NULL,
  `diagnosis_ischemic` tinyint(1) NOT NULL,
  `affected_side_left` tinyint(1) NOT NULL,
  `affected_side_right` tinyint(1) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `emergency_contact` varchar(10) NOT NULL,
  `emergency_contact_phone` varchar(10) NOT NULL,
  `joindate` date NOT NULL DEFAULT '2000-01-01',
  `coin` int(11) NOT NULL DEFAULT 0,
  `identification_card` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `patient_database`
--

INSERT INTO `patient_database` (`id`, `account`, `password`, `name`, `nickname`, `birthday`, `gender`, `diagnosis_left`, `diagnosis_right`, `diagnosis_hemorrhagic`, `diagnosis_ischemic`, `affected_side_left`, `affected_side_right`, `phone`, `emergency_contact`, `emergency_contact_phone`, `joindate`, `coin`, `identification_card`, `email`, `notes`) VALUES
('B00001', 'B00001', '1111', '王病患', '我的暱稱一一一', '2001-11-19', '男', 0, 1, 1, 0, 1, 0, '012345678', '沒人', '0918273645', '2023-03-11', 0, 'E12345678', 'C109154244@nkust.edu.tw', 'test1\r\n'),
('B00002', 'B00002', '2222', '王病患', '', '2011-03-10', '女', 0, 0, 0, 0, 0, 0, '9123456789', '', '', '2023-03-11', 0, 'W12345678', 'c109154244@nkust.edu.tw', 'test2'),
('B00003', 'B00003', '3333', '陳病患', '123', '2001-11-19', '女', 1, 1, 1, 1, 1, 1, '0987654', 'sfksd', 'dfsd', '2023-03-09', 0, 'C876543210', '', '無');

-- --------------------------------------------------------

--
-- 資料表結構 `patient_rehabilitation`
--

CREATE TABLE `patient_rehabilitation` (
  `id` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `time` date NOT NULL,
  `type` varchar(50) NOT NULL,
  `ex` varchar(100) NOT NULL,
  `score` varchar(100) NOT NULL,
  `com` text NOT NULL,
  `code` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `patient_rehabilitation`
--

INSERT INTO `patient_rehabilitation` (`id`, `name`, `time`, `type`, `ex`, `score`, `com`, `code`) VALUES
('B00001', '張病患', '2022-11-15', '命名練習', '魚', '60', '1', 1),
('B00002', '王病患', '2022-11-14', '3C類', '', '65', '3', 1),
('B00001', '張病患', '2022-11-30', '3C類', '', '50', '22', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
