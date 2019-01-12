-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 10, 2019 lúc 04:22 PM
-- Phiên bản máy phục vụ: 10.1.34-MariaDB
-- Phiên bản PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fpolygo`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  `name_cata` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `location`, `name_cata`, `count`) VALUES
(67, 1, 'Hành động', 0),
(68, 1, 'Hài kịch', 0),
(69, 3, 'Cổ trang', -1),
(70, 4, 'Trính kịch', 2),
(72, 6, 'Vỗ thuật', 1),
(76, 10, 'Kinh dị', 1),
(78, 12, 'Gia đình', 0),
(81, 15, 'Tài liệu', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `content` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `id_customer` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `id_movie` int(11) NOT NULL,
  `likes` int(10) DEFAULT '0',
  `unlikes` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment_kids`
--

CREATE TABLE `comment_kids` (
  `id` int(11) NOT NULL,
  `id_comment` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `content` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `likes` int(50) NOT NULL,
  `unlikes` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name_country` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `country`
--

INSERT INTO `country` (`id`, `name_country`, `count`) VALUES
(7, 'Đài Loan', 0),
(8, 'Mỹ', 0),
(11, 'Hàn Quốc', 0),
(12, 'Thái Lan', 0),
(15, 'Hồng Kông', 0),
(16, 'Đài Loan', 0),
(17, 'Mỹ', -6),
(19, 'Úc', 2),
(22, 'Anh 12', 2),
(29, 'Anh', 3),
(30, 'Trung Quốc', 2),
(31, 'Anh', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role` tinyint(4) DEFAULT NULL,
  `activated` tinyint(4) DEFAULT NULL,
  `avatar` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `number` varchar(12) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `password`, `email`, `role`, `activated`, `avatar`, `date`, `number`) VALUES
(1, 'Ngọc Nhất', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'nhat.jpg', '2018-12-05', '096643251'),
(2, 'Ngọc Nhất', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-19', '096643251'),
(3, 'Ngọc Thọ', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-24', '096643251'),
(4, 'Thúy Vân', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-18', '096643251'),
(5, 'Đăng Khoa', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-29', '096643251'),
(6, 'Ngọc Nhất 1 ', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-30', '096643251'),
(7, 'Ngọc Nhất 1', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-24', '096643251'),
(8, 'Ngọc Thọ 1', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-31', '096643251'),
(9, 'Thúy Vân 1', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-03', '096643251'),
(10, 'Đăng Khoa 1', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-05', '096643251'),
(11, 'Ngọc Thọ', '09982568a', 'beodayroi@gmail.com', 1, 1, 'ngoctho.jpg', '2018-12-19', '0961544404'),
(12, 'Ngọc Thọ', '09982568a', 'beodayroi@gmail.com', 1, 1, 'ngoctho.jpg', '2018-12-19', '0961544404');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `name_movie` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `evaluate` float DEFAULT NULL,
  `view` float DEFAULT NULL,
  `release_year` int(50) NOT NULL,
  `running_time` int(50) NOT NULL,
  `id_country` int(11) NOT NULL,
  `short_description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `trailer` text COLLATE utf8_unicode_ci NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `age` int(50) NOT NULL,
  `resolution` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(10) NOT NULL DEFAULT '1',
  `id_cata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `movie`
--

INSERT INTO `movie` (`id`, `name_movie`, `evaluate`, `view`, `release_year`, `running_time`, `id_country`, `short_description`, `description`, `image`, `trailer`, `link`, `age`, `resolution`, `type`, `id_cata`) VALUES
(169, 'ĐỊNH MỆNH ANH YÊU EM2', 6.9, 0, 2018, 120, 22, 'sdfdsf', '<p>fdgfdgdfhdfhdfhdfhfdh</p>\n', 'bJ120.png', 'https://www.youtube.com/embed/Pp5MZwrBM0g', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 72),
(170, 'VENOM', 6.3, 0, 1999, 120, 29, 'dfgdfgdsfgdfsg', '<p>sdfdsgsdgsdgsdg</p>\n', 'favicon.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 76),
(171, 'qưeqw', 6.9, 0, 2018, 120, 30, 'dsfdsfưerewrdfgfdg', '<p>dsfsdfds</p>\n', 'bJ120.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 81),
(172, 'qưeqw', 6.9, 0, 2018, 31221, 19, 'sdfsdfsddsfsdfgágasgdsfdsfsdfdsfsdfdsfdsfgsdgdsgaaaa1111', '<p>gdsgdsg</p>\n', 'bJ120.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 12, 'FHD', 1, 81),
(173, 'ĐỊNH MỆNH ANH YÊU EM', 9.8, 0, 1332, 123, 17, 'ưerwerewr', '<p>ewrewrewr</p>\n', 'favicon.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 70),
(174, 'ĐỊNH MỆNH ANH YÊU EM2', 6.9, 0, 2018, 120, 22, 'sdfdsf', '<p>fdgfdgdfhdfhdfhdfhfdh</p>\r\n', 'bJ120.png', 'https://www.youtube.com/embed/Pp5MZwrBM0g', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 72),
(175, 'VENOM', 6.3, 0, 1999, 120, 29, 'dfgdfgdsfgdfsg', '<p>sdfdsgsdgsdgsdg</p>\r\n', 'favicon.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 76),
(176, 'qưeqw', 6.9, 0, 2018, 120, 30, 'dsfdsfưerewrdfgfdg', '<p>dsfsdfds</p>\r\n', 'bJ120.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 81),
(177, 'qưeqw', 6.9, 0, 2018, 31221, 19, 'sdfsdfsddsfsdfgágasgdsfdsfsdfdsfsdfdsfdsfgsdgdsgaaaa1111', '<p>gdsgdsg</p>\r\n', 'bJ120.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 12, 'FHD', 1, 81),
(178, 'ĐỊNH MỆNH ANH YÊU EM', 9.8, 0, 1332, 123, 17, 'ưerwerewr', '<p>ewrewrewr</p>\r\n', 'favicon.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 70),
(179, 'ĐỊNH MỆNH ANH YÊU EM2', 6.9, 0, 2018, 120, 22, 'sdfdsf', '<p>fdgfdgdfhdfhdfhdfhfdh</p>\r\n', 'bJ120.png', 'https://www.youtube.com/embed/Pp5MZwrBM0g', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 72),
(180, 'VENOM', 6.3, 0, 1999, 120, 29, 'dfgdfgdsfgdfsg', '<p>sdfdsgsdgsdgsdg</p>\r\n', 'favicon.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 76),
(181, 'qưeqw', 6.9, 0, 2018, 120, 30, 'dsfdsfưerewrdfgfdg', '<p>dsfsdfds</p>\r\n', 'bJ120.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 81),
(182, 'qưeqw', 6.9, 0, 2018, 31221, 19, 'sdfsdfsddsfsdfgágasgdsfdsfsdfdsfsdfdsfdsfgsdgdsgaaaa1111', '<p>gdsgdsg</p>\r\n', 'bJ120.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 12, 'FHD', 1, 81),
(183, 'ĐỊNH MỆNH ANH YÊU EM', 9.8, 0, 1332, 123, 17, 'ưerwerewr', '<p>ewrewrewr</p>\r\n', 'favicon.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 70),
(184, 'ĐỊNH MỆNH ANH YÊU EM2', 6.9, 0, 2018, 120, 22, 'sdfdsf', '<p>fdgfdgdfhdfhdfhdfhfdh</p>\r\n', 'bJ120.png', 'https://www.youtube.com/embed/Pp5MZwrBM0g', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 72),
(185, 'VENOM', 6.3, 0, 1999, 120, 29, 'dfgdfgdsfgdfsg', '<p>sdfdsgsdgsdgsdg</p>\r\n', 'favicon.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 76),
(186, 'qưeqw', 6.9, 0, 2018, 120, 30, 'dsfdsfưerewrdfgfdg', '<p>dsfsdfds</p>\r\n', 'bJ120.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 81),
(187, 'qưeqw', 6.9, 0, 2018, 31221, 19, 'sdfsdfsddsfsdfgágasgdsfdsfsdfdsfsdfdsfdsfgsdgdsgaaaa1111', '<p>gdsgdsg</p>\r\n', 'bJ120.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 12, 'FHD', 1, 81),
(188, 'ĐỊNH MỆNH ANH YÊU EM', 9.8, 0, 1332, 123, 17, 'ưerwerewr', '<p>ewrewrewr</p>\r\n', 'favicon.png', 'https://www.youtube.com/embed/RT_9l_iGYNs', 'https://photos.google.com/share/AF1QipO9If4SdEmEYWFLpC-lQfa-mIS2GFhceeOtejk0G2lKtroEti6pioRWZ6INWBlI4w/photo/AF1QipPKE3faz4Lfl0m-Pad8Qi_wREWX9ZrkANsm7zws?key=Y0h1eEY5NGVfUm90ZEN6T2hPZHkyQmRaY3prejNn&hl=vi', 18, 'FHD', 1, 70);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movie_series`
--

CREATE TABLE `movie_series` (
  `id_series` int(11) NOT NULL,
  `episodes` int(50) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `id_movie` int(11) NOT NULL,
  `clip_SD` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `clip_HD` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `clip_FHD` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `link` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pricing_customer`
--

CREATE TABLE `pricing_customer` (
  `id_pc` int(4) NOT NULL,
  `id_customer` int(4) NOT NULL,
  `id_pricing` int(4) NOT NULL,
  `date_create` date NOT NULL,
  `date_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pricing_plan`
--

CREATE TABLE `pricing_plan` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `time_limit` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `resolution` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `support` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pricing_plan`
--

INSERT INTO `pricing_plan` (`id`, `name`, `price`, `time_limit`, `resolution`, `support`, `description`) VALUES
(1, 'Basic\r\n', '0', '7 day', '720p ', 'Limited Support', 'ád'),
(2, 'Free', '0', '7 day', 'HD', 'No support ', 'Gói miển phí được xem phim  trong 7 ngày không quản cáo');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_comments_movie` (`id_movie`),
  ADD KEY `FK_comments_customer` (`id_customer`);

--
-- Chỉ mục cho bảng `comment_kids`
--
ALTER TABLE `comment_kids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_kids_comment` (`id_comment`),
  ADD KEY `FK_kids_customer` (`id_customer`);

--
-- Chỉ mục cho bảng `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_movie_catalog` (`id_cata`),
  ADD KEY `FK_movie_country` (`id_country`);

--
-- Chỉ mục cho bảng `movie_series`
--
ALTER TABLE `movie_series`
  ADD PRIMARY KEY (`id_series`),
  ADD KEY `FK_tvseries_movie` (`id_movie`);

--
-- Chỉ mục cho bảng `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_photos_movie` (`id_movie`);

--
-- Chỉ mục cho bảng `pricing_plan`
--
ALTER TABLE `pricing_plan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comment_kids`
--
ALTER TABLE `comment_kids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT cho bảng `movie_series`
--
ALTER TABLE `movie_series`
  MODIFY `id_series` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pricing_plan`
--
ALTER TABLE `pricing_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_comments_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_comments_movie` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `comment_kids`
--
ALTER TABLE `comment_kids`
  ADD CONSTRAINT `FK_kids_comment` FOREIGN KEY (`id_comment`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_kids_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `FK_movie_catalog` FOREIGN KEY (`id_cata`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_movie_country` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`);

--
-- Các ràng buộc cho bảng `movie_series`
--
ALTER TABLE `movie_series`
  ADD CONSTRAINT `FK_tvseries_movie` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`);

--
-- Các ràng buộc cho bảng `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `FK_photos_movie` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
