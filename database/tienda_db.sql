/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - tienda_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tienda_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `tienda_db`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categorias` */

insert  into `categorias`(`id`,`categoria`) values 
(1,'Electrónica'),
(3,'Hogar'),
(2,'Ropa');

/*Table structure for table `imagenes_producto` */

DROP TABLE IF EXISTS `imagenes_producto`;

CREATE TABLE `imagenes_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `url_imagen` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_imagenes_productos` (`producto_id`),
  CONSTRAINT `fk_imagenes_productos` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `imagenes_producto` */

insert  into `imagenes_producto`(`id`,`producto_id`,`url_imagen`) values 
(1,1,'upload/productos/galeria/audifonos1.png'),
(2,1,'upload/productos/galeria/audifonos2.png'),
(3,1,'upload/productos/galeria/audifonos3.png'),
(4,2,'upload/productos/galeria/reloj1.png'),
(5,2,'upload/productos/galeria/reloj2.png'),
(6,3,'upload/productos/galeria/camiseta1.png'),
(7,3,'upload/productos/galeria/camiseta2.png'),
(10,2,'upload/productos/galeria/reloj3.png'),
(11,3,'upload/productos/galeria/camiseta3.png');

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `url_imagen_principal` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productos_categorias` (`categoria_id`),
  CONSTRAINT `fk_productos_categorias` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productos` */

insert  into `productos`(`id`,`categoria_id`,`nombre`,`descripcion`,`precio`,`url_imagen_principal`) values 
(1,1,'Audífonos Bluetooth','Audífonos inalámbricos con cancelación activa de ruido y batería de 20 horas.',49.99,'upload/productos/principales/audifonos1.png'),
(2,1,'Smartwatch Sport','Reloj inteligente con monitor de ritmo cardíaco, GPS y resistencia al agua.',89.90,'upload/productos/principales/reloj1.png'),
(3,2,'Camiseta Casual','Camiseta 100% algodón de ajuste regular, ideal para uso diario.',19.99,'upload/productos/principales/camiseta1.png');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
