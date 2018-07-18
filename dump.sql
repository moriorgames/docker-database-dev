
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `canonical` varchar(50) DEFAULT NULL,
  `description` text,
  `price` int(11) DEFAULT '0',
  `currency` char(3) DEFAULT 'EUR',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `product` (`id`, `name`, `canonical`, `description`, `price`, `currency`)
VALUES
	(1,'Batman','batman','Super amazing toy of batman it can kick you and your pets.',200,'EUR'),
	(2,'Superman','superman','Super man is not so cool as Batman but is strong enough.',40,'EUR'),
	(3,'Mud man','mud-man','WTF is mud man? we are insane?',15,'GBP');


CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `canonical` varchar(50) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `status` tinyint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `user` (`id`, `nick`, `name`, `canonical`, `password`, `status`)
VALUES
	(1,'morior','Jordi','jordi','an-amazing-no-encrypted-password',1),
	(2,'Styv Jovs','Noway man','noway-man','super-cool-non-encrypetd-passwor',0);

-- You can import data if its too big with this command "source"
source /docker-entrypoint-initdb.d/tables/visits.sql;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
