-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2019 at 07:38 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_minimarket`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `1_login` (IN `username` VARCHAR(255), IN `password` VARCHAR(255))  BEGIN
	DECLARE num_rows INT;
	
	SELECT COUNT(*) INTO num_rows FROM karyawan WHERE karyawan.`username` = username AND karyawan.`password` = PASSWORD;
	
	IF num_rows = 1 THEN
		SELECT karyawan.`id` INTO @data_login FROM karyawan WHERE karyawan.`username` = username AND karyawan.`password` = PASSWORD;
		SELECT "Login berhasil!" AS "Success";
	ELSE
		SELECT "Login gagal. Username atau password salah!" AS "Error";
	END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `1_login_admin` (IN `username` VARCHAR(255), IN `password` VARCHAR(255))  begin
	declare num_rows int;
	
	select count(*) into num_rows from admins where admins.`username` = username and admins.`password` = password;
	
	if num_rows = 1 then
		select admins.`id` into @data_login_admin from admins where admins.`username` = username and admins.`password` = password;
		select "Login success!" as "Success";
	else
		select "Login failed. Wrong username or password!" as "Error";
	end if;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `1_login_employee` (IN `username` VARCHAR(255), IN `password` VARCHAR(255))  begin
	declare num_rows int;
	
	select count(*) into num_rows from employees where employees.`username` = username and employees.`password` = password;
	
	if num_rows = 1 then
		select employees.`id` into @data_login_employee from employees where employees.`username` = username and employees.`password` = password;
		select "Login success!" as "Success";
	else
		select "Login failed. Wrong username or password!" as "Error";
	end if;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `2_edit_member` (IN `id` BIGINT, IN `nama` VARCHAR(255), IN `telp` VARCHAR(255), IN `alamat` TEXT)  BEGIN
	DECLARE num_rows INT;
	
	IF @data_login IS NOT NULL THEN
		SELECT COUNT(*) INTO num_rows FROM karyawan WHERE karyawan.`id` = @data_login;
		
		IF num_rows = 1 THEN
			SELECT COUNT(*) INTO num_rows FROM member WHERE member.`id` = id;
			
			IF num_rows = 1 THEN
				UPDATE member SET member.`nama` = nama, member.`telp` = telp, member.`alamat` = alamat WHERE member.`id` = id;
				SELECT "Edit data member berhasil!" AS "Success";
			ELSE
				SELECT "Member belum terdaftar!" AS "Error";
			END IF;
		ELSE
			SELECT "Mohon login terlebih dahulu!" AS "Error";
		END IF;
	ELSE
		SELECT "Mohon login terlebih dahulu!" AS "Error";
	END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `2_hapus_member` (IN `id` BIGINT)  BEGIN
	DECLARE num_rows INT;
	
	IF @data_login IS NOT NULL THEN
		SELECT COUNT(*) INTO num_rows FROM karyawan WHERE karyawan.`id` = @data_login;
		
		IF num_rows = 1 THEN
			SELECT COUNT(*) INTO num_rows FROM member WHERE member.`id` = id;
			
			IF num_rows = 1 THEN
				DELETE FROM member WHERE member.`id` = id;
				SELECT "Hapus data member berhasil!" AS "Success";
			ELSE
				SELECT "Member belum terdaftar!" AS "Error";
			END IF;
		ELSE
			SELECT "Mohon login terlebih dahulu!" AS "Error";
		END IF;
	ELSE
		SELECT "Mohon login terlebih dahulu!" AS "Error";
	END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `2_tambah_member` (IN `nama` VARCHAR(255), IN `telp` VARCHAR(255), IN `alamat` TEXT)  BEGIN
	DECLARE num_rows INT;
	
	IF @data_login IS NOT NULL THEN
		SELECT COUNT(*) INTO num_rows FROM karyawan WHERE karyawan.`id` = @data_login;
		
		IF num_rows = 1 THEN
			INSERT INTO member VALUES (NULL, nama, telp, alamat);
			SELECT "Tambah data member berhasil!" AS "Success";
		ELSE
			SELECT "Mohon login terlebih dahulu!" AS "Error";
		END IF;
	ELSE
		SELECT "Mohon login terlebih dahulu!" AS "Error";
	END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `no_barang` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `jenis_barang` varchar(255) NOT NULL,
  `stock_barang` int(11) NOT NULL,
  `harga_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`no_barang`, `nama_barang`, `jenis_barang`, `stock_barang`, `harga_barang`) VALUES
(1, 'aqua', 'minuman', 100, 5000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`no_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `no_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
