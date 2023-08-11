-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.0.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- edu 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `edu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `edu`;

-- 테이블 edu.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `bno` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `author` varchar(16) DEFAULT NULL,
  `resdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `cnt` int(11) DEFAULT 0,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 edu.board:~8 rows (대략적) 내보내기
INSERT INTO `board` (`bno`, `title`, `content`, `author`, `resdate`, `cnt`) VALUES
	(1, '더미글1', '여기는 더미글1 입니다', 'admin', '2023-07-28 01:10:57', 0),
	(2, '더미글2', '여기는 더미글2 입니다', 'admin', '2023-07-28 01:12:05', 0),
	(3, '더미글3', '여기는 더미글3 입니다', 'admin', '2023-07-28 01:12:15', 0),
	(4, '더미글4', '여기는 더미글4 입니다', 'admin', '2023-07-28 01:12:27', 0),
	(5, '더미글5', '여기는 더미글5 입니다', 'admin', '2023-07-28 01:12:39', 0),
	(6, '더미글6', '여기는 더미글6 입니다', 'admin', '2023-07-28 01:12:48', 0),
	(7, '더미글7', '여기는 더미글7 입니다', 'admin', '2023-07-28 01:13:03', 0),
	(8, '더미글8', '여기는 더미글8 입니다', 'lee', '2023-07-28 01:21:18', 0);

-- 테이블 edu.board2 구조 내보내기
CREATE TABLE IF NOT EXISTS `board2` (
  `bno` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `author` varchar(16) DEFAULT NULL,
  `resdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `cnt` int(11) DEFAULT 0,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 edu.board2:~8 rows (대략적) 내보내기
INSERT INTO `board2` (`bno`, `title`, `content`, `author`, `resdate`, `cnt`) VALUES
	(1, '더미글1', '여기는 더미글1 입니다', 'admin', '2023-07-28 01:10:57', 0),
	(2, '더미글2', '여기는 더미글2 입니다', 'admin', '2023-07-28 01:12:05', 0),
	(3, '더미글3', '여기는 더미글3 입니다', 'admin', '2023-07-28 01:12:15', 0),
	(4, '더미글4', '여기는 더미글4 입니다', 'admin', '2023-07-28 01:12:27', 0),
	(5, '더미글5', '여기는 더미글5 입니다', 'admin', '2023-07-28 01:12:39', 0),
	(6, '더미글6', '여기는 더미글6 입니다', 'admin', '2023-07-28 01:12:48', 0),
	(7, '더미글7', '여기는 더미글7 입니다', 'admin', '2023-07-28 01:13:03', 0),
	(8, '더미글8', '여기는 더미글8 입니다', 'lee', '2023-07-28 01:21:18', 0);

-- 테이블 edu.goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods` (
  `gcode` int(11) NOT NULL,
  `gname` varchar(150) NOT NULL,
  `gcate` varchar(40) NOT NULL,
  `gprice` int(11) NOT NULL,
  `gqty` int(11) DEFAULT 0,
  `redate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`gcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 edu.goods:~0 rows (대략적) 내보내기

-- 테이블 edu.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `id` varchar(16) NOT NULL,
  `pw` varchar(330) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tel` varchar(13) DEFAULT NULL,
  `regdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `POINT` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 edu.member:~5 rows (대략적) 내보내기
INSERT INTO `member` (`id`, `pw`, `NAME`, `email`, `tel`, `regdate`, `POINT`) VALUES
	('admin', '1234', '관리자', 'admin@edu.com', '010-1004-1004', '2023-07-28 00:49:13', 0),
	('baik', '2222', '백준철', 'baik@edu.com', '010-2222-2222', '2023-07-28 01:54:01', 0),
	('kim', '4321', '김현경', 'kim@edu.com', '010-7979-2848', '2023-07-28 01:05:21', 0),
	('ku', '3333', '구예진', 'ku@edu.com', '010-3333-3333', '2023-07-28 01:54:01', 0),
	('lee', '1111', '이소윤', 'lee@edu.com', '010-1111-1111', '2023-07-28 01:05:21', 0);

-- 테이블 edu.sales 구조 내보내기
CREATE TABLE IF NOT EXISTS `sales` (
  `scode` int(11) NOT NULL,
  `gcode` int(11) NOT NULL,
  `id` varchar(16) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `sprice` int(11) NOT NULL,
  `stype` int(11) NOT NULL,
  `distotal` int(11) DEFAULT NULL,
  `paytotal` int(11) DEFAULT NULL,
  `stotal` int(11) DEFAULT NULL,
  `saledate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`scode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 edu.sales:~0 rows (대략적) 내보내기

-- 뷰 edu.writer_info 구조 내보내기
-- VIEW 종속성 오류를 극복하기 위해 임시 테이블을 생성합니다.
CREATE TABLE `writer_info` (
	`id` VARCHAR(16) NOT NULL COLLATE 'utf8mb4_general_ci',
	`name` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`bno` INT(11) NOT NULL,
	`title` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- 뷰 edu.writer_info 구조 내보내기
-- 임시 테이블을 제거하고 최종 VIEW 구조를 생성
DROP TABLE IF EXISTS `writer_info`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `writer_info` AS (SELECT a.id, a.name, a.email, b.bno, b.title FROM MEMBER a INNER JOIN board b ON a.id=b.author) ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
