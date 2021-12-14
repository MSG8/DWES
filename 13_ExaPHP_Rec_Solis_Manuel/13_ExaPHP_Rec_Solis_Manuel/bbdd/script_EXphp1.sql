SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: 'examen1'
--
CREATE DATABASE examen1_a;
USE  examen1_a;


--
-- Estructura de tabla para la tabla Administrador
--

CREATE TABLE Administrador (
  idAdmin 		tinyint unsigned AUTO_INCREMENT PRIMARY KEY,
  nombreUsuario	varchar(20)  NOT NULL UNIQUE,
  password 		varchar(30)  NOT NULL,
  correo 		varchar(60)  NULL UNIQUE,
  codigo 		char(4) 	 NOT NULL
  check (codigo IN ('ar2b', '3k2c', 't97f')) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO Administrador(nombreUsuario, correo, password, codigo) VALUES ('prueba', 'ejemplo@gmail.com', '123', 't97f');

SELECT * FROM administrador WHERE nombreUsuario = 'prueba' AND password = '123';