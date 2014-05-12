-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le: Lun 12 Mai 2014 à 14:56
-- Version du serveur: 5.5.32
-- Version de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `videodrome`
--
CREATE DATABASE IF NOT EXISTS `videodrome` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `videodrome`;

-- --------------------------------------------------------

--
-- Structure de la table `cast`
--

DROP TABLE IF EXISTS `cast`;
CREATE TABLE IF NOT EXISTS `cast` (
  `cast_id` int(11) NOT NULL AUTO_INCREMENT,
  `cast_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cast_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cast_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=77 ;

--
-- Contenu de la table `cast`
--

INSERT INTO `cast` (`cast_id`, `cast_name`, `cast_status`) VALUES
(1, 'John Helde', 'director'),
(2, 'Eric Stoltz', 'actor'),
(3, 'Susanna Thompson', 'actor'),
(4, 'Kevin Tighe', 'actor'),
(5, 'Gene Kelly', 'director'),
(6, 'Barbra Streisand', 'actor'),
(7, 'Walter Matthau', 'actor'),
(8, 'Michael Crawford', 'actor'),
(9, 'Louis Armstrong', 'actor'),
(10, 'Marianne McAndrew', 'actor'),
(11, 'Todd Louiso', 'director'),
(12, 'Melanie Lynskey', 'actor'),
(13, 'Blythe Danner', 'actor'),
(14, 'John Rubinstein', 'actor'),
(15, 'Julie White', 'actor'),
(16, 'Dan Futterman', 'actor'),
(17, 'H. Bruce Humberstone', 'director'),
(18, 'Alice Faye', 'actor'),
(19, 'John Payne', 'actor'),
(20, 'Jack Oakie', 'actor'),
(21, 'Lynn Bari', 'actor'),
(22, 'Laird Cregar', 'actor'),
(23, 'Bruce Pittman', 'director'),
(24, 'Michael Ironside', 'actor'),
(25, 'Wendy Lyon', 'actor'),
(26, 'Lisa Schrage', 'actor'),
(27, 'Michael Evans', 'actor'),
(28, 'Vincent Gale', 'actor'),
(29, 'Wojciech Has', 'director'),
(30, 'Clint Eastwood', 'director'),
(31, 'Clint Eastwood', 'actor'),
(32, 'Hilary Swank', 'actor'),
(33, 'Morgan Freeman', 'actor'),
(34, 'Anthony Mackie', 'actor'),
(35, 'Jay Baruchel', 'actor'),
(36, 'Craig Gillespie', 'director'),
(37, 'Jon Hamm', 'actor'),
(38, 'Aasif Mandvi', 'actor'),
(39, 'Bill Paxton', 'actor'),
(40, 'Madhur Mittal', 'actor'),
(41, 'Suraj Sharma', 'actor'),
(42, 'Sergio Leone', 'director'),
(43, 'Marianne Koch', 'actor'),
(44, 'Gian Maria Volonte', 'actor'),
(45, 'Wolfgang Lukschy', 'actor'),
(46, 'Mario Brega', 'actor'),
(47, 'Gustaf Molander', 'director'),
(48, 'Ingrid Bergman', 'actor'),
(49, 'Millan Bolander', 'actor'),
(50, 'Elsa Burnett', 'actor'),
(51, 'Gosta Cederlund', 'actor'),
(52, 'Kotti Chave', 'actor'),
(53, 'Imunga Ivanga', 'director'),
(54, 'Seth Gordon', 'director'),
(55, 'Billy Mitchell', 'actor'),
(56, 'Doris Self', 'actor'),
(57, 'Steve Wiebe', 'actor'),
(58, 'Nicole Wiebe', 'actor'),
(59, 'Steve Sanders (IX)', 'actor'),
(60, 'Rod Steiger', 'actor'),
(61, 'James Coburn', 'actor'),
(62, 'Romolo Valli', 'actor'),
(63, 'Maria Monti', 'actor'),
(64, 'Jean Michel Antoine', 'actor'),
(65, 'Giuliano Carnimeo', 'director'),
(66, 'George Hilton', 'actor'),
(67, 'Charles Southwood', 'actor'),
(68, 'Erika Blanc', 'actor'),
(69, 'Rick Boyd', 'actor'),
(70, 'Piero Lulli', 'actor'),
(71, 'Christine Parker', 'director'),
(72, 'Conrad Osborne', 'actor'),
(73, 'Darrell Parker', 'actor'),
(74, 'Edward Warner', 'actor'),
(75, 'Jaqueline Martini', 'actor'),
(76, 'Wayne Bates', 'actor');

-- --------------------------------------------------------

--
-- Structure de la table `cast_to_film_title`
--

DROP TABLE IF EXISTS `cast_to_film_title`;
CREATE TABLE IF NOT EXISTS `cast_to_film_title` (
  `cast_to_film_title_id` int(11) NOT NULL AUTO_INCREMENT,
  `cast_id` int(11) NOT NULL,
  `film_title_id` int(11) NOT NULL,
  PRIMARY KEY (`cast_to_film_title_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=79 ;

--
-- Contenu de la table `cast_to_film_title`
--

INSERT INTO `cast_to_film_title` (`cast_to_film_title_id`, `cast_id`, `film_title_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 2),
(10, 10, 2),
(11, 11, 3),
(12, 12, 3),
(13, 13, 3),
(14, 14, 3),
(15, 15, 3),
(16, 16, 3),
(17, 17, 4),
(18, 18, 4),
(19, 19, 4),
(20, 20, 4),
(21, 21, 4),
(22, 22, 4),
(23, 23, 5),
(24, 24, 5),
(25, 25, 5),
(26, 26, 5),
(27, 27, 5),
(28, 28, 5),
(29, 29, 6),
(30, 30, 7),
(31, 31, 7),
(32, 32, 7),
(33, 33, 7),
(34, 34, 7),
(35, 35, 7),
(36, 36, 8),
(37, 37, 8),
(38, 38, 8),
(39, 39, 8),
(40, 40, 8),
(41, 41, 8),
(42, 42, 9),
(43, 31, 9),
(44, 43, 9),
(45, 44, 9),
(46, 45, 9),
(47, 46, 9),
(48, 47, 10),
(49, 48, 10),
(50, 49, 10),
(51, 50, 10),
(52, 51, 10),
(53, 52, 10),
(54, 53, 11),
(55, 54, 12),
(56, 55, 12),
(57, 56, 12),
(58, 57, 12),
(59, 58, 12),
(60, 59, 12),
(61, 42, 13),
(62, 60, 13),
(63, 61, 13),
(64, 62, 13),
(65, 63, 13),
(66, 64, 13),
(67, 65, 14),
(68, 66, 14),
(69, 67, 14),
(70, 68, 14),
(71, 69, 14),
(72, 70, 14),
(73, 71, 15),
(74, 72, 15),
(75, 73, 15),
(76, 74, 15),
(77, 75, 15),
(78, 76, 15);

-- --------------------------------------------------------

--
-- Structure de la table `doc`
--

DROP TABLE IF EXISTS `doc`;
CREATE TABLE IF NOT EXISTS `doc` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `doc_type` int(11) NOT NULL,
  `doc_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `doc_parent` int(11) NOT NULL,
  `doc_usage` int(11) NOT NULL,
  `film_title_id` int(11) NOT NULL,
  `doc_creation` datetime NOT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Contenu de la table `doc`
--

INSERT INTO `doc` (`doc_id`, `doc_title`, `doc_type`, `doc_url`, `doc_parent`, `doc_usage`, `film_title_id`, `doc_creation`) VALUES
(1, 'Hello', 0, '', 0, 1, 1, '0000-00-00 00:00:00'),
(2, 'Hello, Dolly!', 0, '', 0, 1, 2, '0000-00-00 00:00:00'),
(3, 'Hello I Must Be Going', 0, '', 0, 1, 3, '0000-00-00 00:00:00'),
(4, 'Hello, Frisco, Hello', 0, '', 0, 1, 4, '0000-00-00 00:00:00'),
(5, 'Hello Mary Lou: Prom Night II', 0, '', 0, 1, 5, '0000-00-00 00:00:00'),
(6, 'Doll', 0, '', 0, 1, 6, '0000-00-00 00:00:00'),
(7, 'Million Dollar Baby', 0, '', 0, 1, 7, '0000-00-00 00:00:00'),
(8, 'Million Dollar Arm', 0, '', 0, 1, 8, '0000-00-00 00:00:00'),
(9, 'A Fistful of Dollars (Per un Pugno di Dollari)', 0, '', 0, 1, 9, '0000-00-00 00:00:00'),
(10, 'Dollar', 0, '', 0, 1, 10, '0000-00-00 00:00:00'),
(11, 'Dollar', 0, '', 0, 1, 11, '0000-00-00 00:00:00'),
(12, 'The King of Kong: A Fistful of Quarters', 0, '', 0, 1, 12, '0000-00-00 00:00:00'),
(13, 'A Fistful of Dynamite (Duck, You Sucker) (Giu la testa)', 0, '', 0, 1, 13, '0000-00-00 00:00:00'),
(14, 'Fistful of Lead', 0, '', 0, 1, 14, '0000-00-00 00:00:00'),
(15, 'Fistful of Brains', 0, '', 0, 1, 15, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `doc_type`
--

DROP TABLE IF EXISTS `doc_type`;
CREATE TABLE IF NOT EXISTS `doc_type` (
  `extension` varchar(10) NOT NULL DEFAULT '',
  `titre` text NOT NULL,
  `descriptif` text NOT NULL,
  `mime_type` varchar(100) NOT NULL DEFAULT '',
  `inclus` enum('non','image','embed') NOT NULL DEFAULT 'non',
  `upload` enum('oui','non') NOT NULL DEFAULT 'oui',
  `media_defaut` varchar(10) NOT NULL DEFAULT 'file',
  `maj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`extension`),
  KEY `inclus` (`inclus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `doc_type`
--

INSERT INTO `doc_type` (`extension`, `titre`, `descriptif`, `mime_type`, `inclus`, `upload`, `media_defaut`, `maj`) VALUES
('3ga', '3GP Audio File', '', 'audio/3ga', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('3gp', '3rd Generation Partnership Project', '', 'video/3gpp', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('7z', '7 Zip', '', 'application/x-7z-compressed', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('aac', 'Advanced Audio Coding', '', 'audio/mp4a-latm', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('abw', 'Abiword', '', 'application/abiword', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('ac3', 'AC-3 Compressed Audio', '', 'audio/x-aac', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('ai', 'Adobe Illustrator', '', 'application/illustrator', 'non', 'oui', 'image', '2014-03-24 15:33:34'),
('aifc', 'Compressed AIFF Audio', '', 'audio/x-aifc', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('aiff', 'AIFF', '', 'audio/x-aiff', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('amr', 'Adaptive Multi-Rate Audio', '', 'audio/amr', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('anx', 'Annodex', '', 'application/annodex', 'embed', 'oui', 'file', '2014-03-24 15:33:34'),
('ape', 'Monkey''s Audio File', '', 'audio/x-monkeys-audio', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('asf', 'Windows Media', '', 'video/x-ms-asf', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('asx', 'Advanced Stream Redirector', '', 'video/x-ms-asf', 'non', 'oui', 'video', '2014-03-24 15:33:34'),
('avi', 'AVI', '', 'video/x-msvideo', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('axa', 'Annodex Audio', '', 'audio/annodex', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('axv', 'Annodex Video', '', 'video/annodex', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('bib', 'BibTeX', '', 'application/x-bibtex', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('bin', 'Binary Data', '', 'application/octet-stream', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('blend', 'Blender', '', 'application/x-blender', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('bmp', 'BMP', '', 'image/x-ms-bmp', 'image', 'oui', 'image', '2014-03-24 15:33:34'),
('bz2', 'BZip', '', 'application/x-bzip2', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('c', 'C source', '', 'text/x-csrc', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('cls', 'LaTeX Class', '', 'text/x-tex', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('csl', 'Citation Style Language', '', 'application/xml', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('css', 'Cascading Style Sheet', '', 'text/css', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('csv', 'Comma Separated Values', '', 'text/csv', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('deb', 'Debian', '', 'application/x-debian-package', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('djvu', 'DjVu', '', 'image/vnd.djvu', 'non', 'oui', 'image', '2014-03-24 15:33:34'),
('doc', 'Word', '', 'application/msword', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('docm', 'Word', '', 'application/vnd.ms-word.document.macroEnabled.12', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('docx', 'Word', '', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('dot', 'Word Template', '', 'application/msword', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('dotm', 'Word template', '', 'application/vnd.ms-word.template.macroEnabled.12', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('dotx', 'Word template', '', 'application/vnd.openxmlformats-officedocument.wordprocessingml.template', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('dv', 'Digital Video', '', 'video/x-dv', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('dvi', 'LaTeX DVI', '', 'application/x-dvi', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('emf', 'Enhanced Metafile', '', 'image/x-emf', 'non', 'oui', 'image', '2014-03-24 15:33:34'),
('enl', 'EndNote Library', '', 'application/octet-stream', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('ens', 'EndNote Style', '', 'application/octet-stream', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('eps', 'PostScript', '', 'application/postscript', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('epub', 'EPUB', '', 'application/epub+zip', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('f4a', 'Audio for Adobe Flash Player', '', 'audio/mp4', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('f4b', 'Audio Book for Adobe Flash Player', '', 'audio/mp4', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('f4p', 'Protected Video for Adobe Flash Player', '', 'video/mp4', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('f4v', 'Video for Adobe Flash Player', '', 'video/mp4', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('flac', 'Free Lossless Audio Codec', '', 'audio/x-flac', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('flv', 'Flash Video', '', 'video/x-flv', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('gif', 'GIF', '', 'image/gif', 'image', 'oui', 'image', '2014-03-24 15:33:34'),
('gpx', 'GPS eXchange Format', '', 'application/gpx+xml', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('gz', 'GZ', '', 'application/x-gzip', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('h', 'C header', '', 'text/x-chdr', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('html', 'HTML', '', 'text/html', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('jar', 'Java Archive', '', 'application/java-archive', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('jpg', 'JPEG', '', 'image/jpeg', 'image', 'oui', 'image', '2014-03-24 15:33:34'),
('json', 'JSON', '', 'application/json', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('kml', 'Keyhole Markup Language', '', 'application/vnd.google-earth.kml+xml', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('kmz', 'Google Earth Placemark File', '', 'application/vnd.google-earth.kmz', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('lyx', 'Lyx file', '', 'application/x-lyx', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('m2p', 'MPEG-PS', '', 'video/MP2P', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('m2ts', 'BDAV MPEG-2 Transport Stream', '', 'video/MP2T', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('m3u', 'M3U Playlist', '', 'text/plain', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('m3u8', 'M3U8 Playlist', '', 'text/plain', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('m4a', 'MPEG4 Audio', '', 'audio/mp4a-latm', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('m4b', 'MPEG4 Audio', '', 'audio/mp4a-latm', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('m4p', 'MPEG4 Audio', '', 'audio/mp4a-latm', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('m4r', 'iPhone Ringtone', '', 'audio/aac', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('m4u', 'MPEG4 Playlist', '', 'video/vnd.mpegurl', 'non', 'oui', 'video', '2014-03-24 15:33:34'),
('m4v', 'MPEG4 Video', '', 'video/x-m4v', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('mathml', 'MathML', '', 'application/mathml+xml', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('mbtiles', 'MBTiles', '', 'application/x-sqlite3', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('mid', 'Midi', '', 'audio/midi', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('mka', 'Matroska Audio', '', 'audio/mka', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('mkv', 'Matroska Video', '', 'video/mkv', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('mng', 'MNG', '', 'video/x-mng', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('mov', 'QuickTime', '', 'video/quicktime', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('mp3', 'MP3', '', 'audio/mpeg', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('mp4', 'MPEG4', '', 'application/mp4', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('mpc', 'Musepack', '', 'audio/x-musepack', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('mpg', 'MPEG', '', 'video/mpeg', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('mts', 'AVCHD MPEG-2 transport stream', '', 'video/MP2T', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('odb', 'OpenDocument Database', '', 'application/vnd.oasis.opendocument.database', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('odc', 'OpenDocument Chart', '', 'application/vnd.oasis.opendocument.chart', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('odf', 'OpenDocument Formula', '', 'application/vnd.oasis.opendocument.formula', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('odg', 'OpenDocument Graphics', '', 'application/vnd.oasis.opendocument.graphics', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('odi', 'OpenDocument Image', '', 'application/vnd.oasis.opendocument.image', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('odm', 'OpenDocument Text-master', '', 'application/vnd.oasis.opendocument.text-master', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('odp', 'OpenDocument Presentation', '', 'application/vnd.oasis.opendocument.presentation', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('ods', 'OpenDocument Spreadsheet', '', 'application/vnd.oasis.opendocument.spreadsheet', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('odt', 'OpenDocument Text', '', 'application/vnd.oasis.opendocument.text', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('oga', 'Ogg Audio', '', 'audio/ogg', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('ogg', 'Ogg Vorbis', '', 'audio/ogg', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('ogv', 'Ogg Video', '', 'video/ogg', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('ogx', 'Ogg Multiplex', '', 'application/ogg', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('otg', 'OpenDocument Graphics-template', '', 'application/vnd.oasis.opendocument.graphics-template', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('otp', 'OpenDocument Presentation-template', '', 'application/vnd.oasis.opendocument.presentation-template', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('ots', 'OpenDocument Spreadsheet-template', '', 'application/vnd.oasis.opendocument.spreadsheet-template', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('ott', 'OpenDocument Text-template', '', 'application/vnd.oasis.opendocument.text-template', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('pas', 'Pascal', '', 'text/x-pascal', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('pdf', 'PDF', '', 'application/pdf', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('pgn', 'Portable Game Notation', '', 'application/x-chess-pgn', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('pls', 'Playlist', '', 'text/plain', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('png', 'PNG', '', 'image/png', 'image', 'oui', 'image', '2014-03-24 15:33:34'),
('pot', 'PowerPoint Template', '', 'application/vnd.ms-powerpoint', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('potm', 'Powerpoint template', '', 'application/vnd.ms-powerpoint.template.macroEnabled.12', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('potx', 'Powerpoint template', '', 'application/vnd.openxmlformats-officedocument.presentationml.template', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('ppam', 'Powerpoint addin', '', 'application/vnd.ms-powerpoint.addin.macroEnabled.12', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('ppsm', 'Powerpoint slideshow', '', 'application/vnd.ms-powerpoint.slideshow.macroEnabled.12', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('ppsx', 'Powerpoint slideshow', '', 'application/vnd.openxmlformats-officedocument.presentationml.slideshow', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('ppt', 'PowerPoint', '', 'application/vnd.ms-powerpoint', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('pptm', 'Powerpoint', '', 'application/vnd.ms-powerpoint.presentation.macroEnabled.12', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('pptx', 'Powerpoint', '', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('ps', 'PostScript', '', 'application/postscript', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('psd', 'Photoshop', '', 'image/x-photoshop', 'non', 'oui', 'image', '2014-03-24 15:33:34'),
('qt', 'QuickTime', '', 'video/quicktime', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('ra', 'RealAudio', '', 'audio/x-pn-realaudio', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('ram', 'RealAudio', '', 'audio/x-pn-realaudio', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('rar', 'WinRAR', '', 'application/x-rar-compressed', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('rdf', 'Resource Description Framework', '', 'application/rdf+xml', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('ris', 'RIS', '', 'application/x-research-info-systems', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('rm', 'RealAudio', '', 'audio/x-pn-realaudio', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('rpm', 'RedHat/Mandrake/SuSE', '', 'application/x-redhat-package-manager', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('rtf', 'RTF', '', 'application/rtf', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('sdc', 'StarOffice Spreadsheet', '', 'application/vnd.stardivision.calc', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('sdd', 'StarOffice Presentation', '', 'application/vnd.stardivision.impress', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('sdw', 'StarOffice Writer document', '', 'application/vnd.stardivision.writer', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('sit', 'Stuffit', '', 'application/x-stuffit', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('sla', 'Scribus', '', 'application/x-scribus', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('spx', 'Ogg Speex', '', 'audio/ogg', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('srt', 'SubRip Subtitle', '', 'text/plain', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('ssa', 'SubStation Alpha Subtitle', '', 'text/plain', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('sty', 'LaTeX Style Sheet', '', 'text/x-tex', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('svg', 'Scalable Vector Graphics', '', 'image/svg+xml', 'embed', 'oui', 'image', '2014-03-24 15:33:34'),
('svgz', 'Compressed Scalable Vector Graphic', '', 'image/svg+xml', 'embed', 'oui', 'image', '2014-03-24 15:33:34'),
('swf', 'Flash', '', 'application/x-shockwave-flash', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('sxc', 'OpenOffice.org Calc', '', 'application/vnd.sun.xml.calc', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('sxi', 'OpenOffice.org Impress', '', 'application/vnd.sun.xml.impress', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('sxw', 'OpenOffice.org', '', 'application/vnd.sun.xml.writer', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('tar', 'Tar', '', 'application/x-tar', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('tex', 'LaTeX', '', 'text/x-tex', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('tgz', 'TGZ', '', 'application/x-gtar', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('tif', 'TIFF', '', 'image/tiff', 'embed', 'oui', 'image', '2014-03-24 15:33:34'),
('torrent', 'BitTorrent', '', 'application/x-bittorrent', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('ts', 'MPEG transport stream', '', 'video/MP2T', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('ttf', 'TTF Font', '', 'application/x-font-ttf', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('txt', 'Texte', '', 'text/plain', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('usf', 'Universal Subtitle Format', '', 'application/xml', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('wav', 'WAV', '', 'audio/x-wav', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('webm', 'WebM', '', 'video/webm', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('wma', 'Windows Media Audio', '', 'audio/x-ms-wma', 'embed', 'oui', 'audio', '2014-03-24 15:33:34'),
('wmf', 'Windows Metafile', '', 'image/x-emf', 'non', 'oui', 'image', '2014-03-24 15:33:34'),
('wmv', 'Windows Media Video', '', 'video/x-ms-wmv', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('wpl', 'Windows Media Player Playlist', '', 'application/vnd.ms-wpl', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('xcf', 'GIMP multi-layer', '', 'application/x-xcf', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('xlam', 'Excel', '', 'application/vnd.ms-excel.addin.macroEnabled.12', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('xls', 'Excel', '', 'application/vnd.ms-excel', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('xlsb', 'Excel binary', '', 'application/vnd.ms-excel.sheet.binary.macroEnabled.12', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('xlsm', 'Excel', '', 'application/vnd.ms-excel.sheet.macroEnabled.12', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('xlsx', 'Excel', '', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('xlt', 'Excel Template', '', 'application/vnd.ms-excel', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('xltm', 'Excel template', '', 'application/vnd.ms-excel.template.macroEnabled.12', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('xltx', 'Excel template', '', 'application/vnd.openxmlformats-officedocument.spreadsheetml.template', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('xml', 'XML', '', 'application/xml', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('xspf', 'XSPF', '', 'application/xspf+xml', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('y4m', 'YUV4MPEG2', '', 'video/x-raw-yuv', 'embed', 'oui', 'video', '2014-03-24 15:33:34'),
('yaml', 'YAML', '', 'text/yaml', 'non', 'oui', 'file', '2014-03-24 15:33:34'),
('zip', 'Zip', '', 'application/zip', 'non', 'oui', 'file', '2014-03-24 15:33:34');

-- --------------------------------------------------------

--
-- Structure de la table `doc_usage`
--

DROP TABLE IF EXISTS `doc_usage`;
CREATE TABLE IF NOT EXISTS `doc_usage` (
  `doc_usage_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_usage_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`doc_usage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `doc_usage`
--

INSERT INTO `doc_usage` (`doc_usage_id`, `doc_usage_title`) VALUES
(1, 'Page film');

-- --------------------------------------------------------

--
-- Structure de la table `films`
--

DROP TABLE IF EXISTS `films`;
CREATE TABLE IF NOT EXISTS `films` (
  `film_title_id` int(11) NOT NULL AUTO_INCREMENT,
  `film_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `release_year` year(4) NOT NULL,
  `rotten_tomatoes_api_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`film_title_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Contenu de la table `films`
--

INSERT INTO `films` (`film_title_id`, `film_title`, `release_year`, `rotten_tomatoes_api_id`, `data`) VALUES
(1, 'Hello', 2004, '770670464', '{"id":770670464,"title":"Hello","year":2004,"genres":["Drama","Special Interest"],"mpaa_rating":"Unrated","runtime":19,"release_dates":{"theater":"2005-05-26","dvd":"2008-12-09"},"ratings":{"critics_score":-1,"audience_rating":"Spilled","audience_score":40},"synopsis":"","posters":{"thumbnail":"http:\\/\\/content8.flixster.com\\/movie\\/10\\/90\\/29\\/10902938_mob.jpg","profile":"http:\\/\\/content8.flixster.com\\/movie\\/10\\/90\\/29\\/10902938_pro.jpg","detailed":"http:\\/\\/content8.flixster.com\\/movie\\/10\\/90\\/29\\/10902938_det.jpg","original":"http:\\/\\/content8.flixster.com\\/movie\\/10\\/90\\/29\\/10902938_ori.jpg"},"abridged_cast":[{"name":"Eric Stoltz","id":"162662788"},{"name":"Susanna Thompson","id":"368452245"},{"name":"Kevin Tighe","id":"162681098"}],"abridged_directors":[{"name":"John Helde"}],"studio":"FilmBuff","alternate_ids":{"imdb":"0469915"},"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770670464.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/hello2005\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770670464\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770670464\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770670464\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770670464\\/similar.json"}}'),
(2, 'Hello, Dolly!', 1969, '9442', '{"id":9442,"title":"Hello, Dolly!","year":1969,"genres":["Musical & Performing Arts","Classics","Comedy"],"mpaa_rating":"G","runtime":146,"release_dates":{"theater":"1969-12-16","dvd":"2003-08-19"},"ratings":{"critics_rating":"Rotten","critics_score":47,"audience_rating":"Upright","audience_score":77},"synopsis":"","posters":{"thumbnail":"http:\\/\\/content7.flixster.com\\/movie\\/11\\/16\\/47\\/11164741_mob.jpg","profile":"http:\\/\\/content7.flixster.com\\/movie\\/11\\/16\\/47\\/11164741_pro.jpg","detailed":"http:\\/\\/content7.flixster.com\\/movie\\/11\\/16\\/47\\/11164741_det.jpg","original":"http:\\/\\/content7.flixster.com\\/movie\\/11\\/16\\/47\\/11164741_ori.jpg"},"abridged_cast":[{"name":"Barbra Streisand","id":"162655994","characters":["Dolly Levi"]},{"name":"Walter Matthau","id":"162656073","characters":["Horace Vandergelder"]},{"name":"Michael Crawford","id":"162657495","characters":["Cornelius Hackl"]},{"name":"Louis Armstrong","id":"546953256","characters":["Orchestra Leader"]},{"name":"Marianne McAndrew","id":"411582103","characters":["Irene Molloy"]}],"abridged_directors":[{"name":"Gene Kelly"}],"studio":"20th Century Fox","alternate_ids":{"imdb":"0064418"},"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/9442.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/1009483-hello_dolly\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/9442\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/9442\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/9442\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/9442\\/similar.json"}}'),
(3, 'Hello I Must Be Going', 2012, '771266700', '{"id":771266700,"title":"Hello I Must Be Going","year":2012,"genres":["Drama","Comedy"],"mpaa_rating":"R","runtime":95,"release_dates":{"theater":"2012-09-07","dvd":"2013-02-04"},"ratings":{"critics_rating":"Fresh","critics_score":73,"audience_rating":"Spilled","audience_score":53},"synopsis":"Selected as the opening night film for Sundance 2012, Hello I Must Be Going features acclaimed actress Melanie Lynskey in her breakout role as Amy, a recent divorcee who seeks refuge in the suburban Connecticut home of her parents (Blythe Danner and John Rubinstein). Demoralized and uncertain of her future, Amy begins an affair with a 19-year-old actor (Christopher Abbott) that jumpstarts her passion for life and helps her discover an independence and sense of purpose that she has missed for years. Coupling Danner''s subtle, moving performance as a frustrated empty nester with Lynskey''s endearing and nuanced depiction of both the comic and tragic coming together at a crossroads, Hello I Must Be Going is a modern, unconventional love story infused with sex, humor, and emotional honesty - everything Amy will need to get on in life. -- (C) Oscilloscope","posters":{"thumbnail":"http:\\/\\/content6.flixster.com\\/movie\\/11\\/16\\/58\\/11165808_mob.jpg","profile":"http:\\/\\/content6.flixster.com\\/movie\\/11\\/16\\/58\\/11165808_pro.jpg","detailed":"http:\\/\\/content6.flixster.com\\/movie\\/11\\/16\\/58\\/11165808_det.jpg","original":"http:\\/\\/content6.flixster.com\\/movie\\/11\\/16\\/58\\/11165808_ori.jpg"},"abridged_cast":[{"name":"Melanie Lynskey","id":"208150762","characters":["Amy"]},{"name":"Blythe Danner","id":"162659375","characters":["Ruth","Ruth Minksy"]},{"name":"John Rubinstein","id":"770689041","characters":["Stan","Stan Minsky"]},{"name":"Julie White","id":"770699518","characters":["Gwen"]},{"name":"Dan Futterman","id":"162710332","characters":["David"]}],"abridged_directors":[{"name":"Todd Louiso"}],"studio":"Oscilloscope Pictures","alternate_ids":{"imdb":"2063666"},"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771266700.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/hello_i_must_be_going_2012\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771266700\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771266700\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771266700\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771266700\\/similar.json"}}'),
(4, 'Hello, Frisco, Hello', 1943, '770785295', '{"id":770785295,"title":"Hello, Frisco, Hello","year":1943,"genres":["Drama","Musical & Performing Arts","Classics","Comedy"],"mpaa_rating":"Unrated","runtime":98,"release_dates":{"theater":"1943-01-01","dvd":"2008-10-07"},"ratings":{"critics_score":-1,"audience_rating":"Upright","audience_score":67},"synopsis":"","posters":{"thumbnail":"http:\\/\\/content6.flixster.com\\/movie\\/10\\/87\\/90\\/10879044_mob.jpg","profile":"http:\\/\\/content6.flixster.com\\/movie\\/10\\/87\\/90\\/10879044_pro.jpg","detailed":"http:\\/\\/content6.flixster.com\\/movie\\/10\\/87\\/90\\/10879044_det.jpg","original":"http:\\/\\/content6.flixster.com\\/movie\\/10\\/87\\/90\\/10879044_ori.jpg"},"abridged_cast":[{"name":"Alice Faye","id":"351525985","characters":["Trudy Evans"]},{"name":"John Payne","id":"405588809","characters":["Johnny Cornell"]},{"name":"Jack Oakie","id":"563563099","characters":["Dan Daley"]},{"name":"Lynn Bari","id":"341816958","characters":["Bernice Croft"]},{"name":"Laird Cregar","id":"359853532","characters":["Sam Weaver"]}],"abridged_directors":[{"name":"H. Bruce Humberstone"}],"alternate_ids":{"imdb":"0035982"},"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770785295.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/hello_frisco_hello\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770785295\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770785295\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770785295\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770785295\\/similar.json"}}'),
(5, 'Hello Mary Lou: Prom Night II', 1987, '60559090', '{"id":60559090,"title":"Hello Mary Lou: Prom Night II","year":1987,"genres":["Horror"],"mpaa_rating":"R","runtime":97,"release_dates":{"theater":"1987-10-01","dvd":"1999-01-12"},"ratings":{"critics_rating":"Rotten","critics_score":33,"audience_rating":"Spilled","audience_score":39},"synopsis":"","posters":{"thumbnail":"http:\\/\\/content6.flixster.com\\/movie\\/20\\/86\\/04\\/2086048_mob.jpg","profile":"http:\\/\\/content6.flixster.com\\/movie\\/20\\/86\\/04\\/2086048_pro.jpg","detailed":"http:\\/\\/content6.flixster.com\\/movie\\/20\\/86\\/04\\/2086048_det.jpg","original":"http:\\/\\/content6.flixster.com\\/movie\\/20\\/86\\/04\\/2086048_ori.jpg"},"abridged_cast":[{"name":"Michael Ironside","id":"162713567","characters":["Bill Nordham"]},{"name":"Wendy Lyon","id":"364601489","characters":["Vicki Carpenter"]},{"name":"Lisa Schrage","id":"364601492","characters":["Mary Lou Maloney"]},{"name":"Michael Evans","id":"770685653","characters":["Matthew Dante"]},{"name":"Vincent Gale","id":"770688583","characters":["Rejected Boy"]}],"abridged_directors":[{"name":"Bruce Pittman"}],"studio":"Norstar Releasing","alternate_ids":{"imdb":"0093176"},"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/60559090.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/hello_mary_lou_prom_night_2\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/60559090\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/60559090\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/60559090\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/60559090\\/similar.json"}}'),
(6, 'Doll', 1969, '770903269', '{"id":770903269,"title":"Doll","year":1969,"genres":["Art House & International"],"mpaa_rating":"Unrated","runtime":159,"release_dates":{},"ratings":{"critics_score":-1,"audience_score":50},"synopsis":"","posters":{"thumbnail":"http:\\/\\/images.rottentomatoescdn.com\\/images\\/redesign\\/poster_default.gif","profile":"http:\\/\\/images.rottentomatoescdn.com\\/images\\/redesign\\/poster_default.gif","detailed":"http:\\/\\/images.rottentomatoescdn.com\\/images\\/redesign\\/poster_default.gif","original":"http:\\/\\/images.rottentomatoescdn.com\\/images\\/redesign\\/poster_default.gif"},"abridged_cast":[],"abridged_directors":[{"name":"Wojciech Has"}],"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770903269.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/doll\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770903269\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770903269\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770903269\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770903269\\/similar.json"}}'),
(7, 'Million Dollar Baby', 2004, '10026', '{"id":10026,"title":"Million Dollar Baby","year":2004,"genres":["Drama","Romance"],"mpaa_rating":"PG-13","runtime":133,"critics_consensus":"Clint Eastwood''s assured direction - combined with knockout performances from Hilary Swank and Morgan Freeman - help Million Dollar Baby to transcend its cliches, and the result is deeply heartfelt and moving.","release_dates":{"theater":"2004-12-15","dvd":"2005-07-12"},"ratings":{"critics_rating":"Certified Fresh","critics_score":91,"audience_rating":"Upright","audience_score":90},"synopsis":"","posters":{"thumbnail":"http:\\/\\/content8.flixster.com\\/movie\\/11\\/16\\/81\\/11168106_mob.jpg","profile":"http:\\/\\/content8.flixster.com\\/movie\\/11\\/16\\/81\\/11168106_pro.jpg","detailed":"http:\\/\\/content8.flixster.com\\/movie\\/11\\/16\\/81\\/11168106_det.jpg","original":"http:\\/\\/content8.flixster.com\\/movie\\/11\\/16\\/81\\/11168106_ori.jpg"},"abridged_cast":[{"name":"Clint Eastwood","id":"162659169","characters":["Frankie Dunn"]},{"name":"Hilary Swank","id":"162659170","characters":["Maggie Fitzgerald"]},{"name":"Morgan Freeman","id":"162652224","characters":["Eddie Scrap-Iron Dupris"]},{"name":"Anthony Mackie","id":"162653786","characters":["Shawrelle Berry"]},{"name":"Jay Baruchel","id":"259260120","characters":["Danger Barch"]}],"abridged_directors":[{"name":"Clint Eastwood"}],"studio":"Warner Bros. Pictures","alternate_ids":{"imdb":"0405159"},"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/10026.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/million_dollar_baby\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/10026\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/10026\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/10026\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/10026\\/similar.json"}}'),
(8, 'Million Dollar Arm', 2014, '771357481', '{"id":771357481,"title":"Million Dollar Arm","year":2014,"genres":["Drama","Comedy"],"mpaa_rating":"PG","runtime":124,"release_dates":{"theater":"2014-05-16"},"ratings":{"critics_rating":"Rotten","critics_score":50,"audience_score":93},"synopsis":"Based on a true story, Disney''s \\"Million Dollar Arm\\" follows JB Bernstein, a once-successful sports agent who now finds himself edged out by bigger, slicker competitors. He and his partner Aash (Aasif Mandvi) will have to close their business down for good if JB doesn''t come up with something fast. Late one night, while watching cricket being played in India on TV, JB comes up with an idea so radical it just might work. Why not go to there and find the next baseball pitching sensation? Setting off for Mumbai with nothing but a gifted but cantankerous scout (Alan Arkin) in tow, JB stages a televised, nationwide competition called \\"Million Dollar Arm\\" where 40,000 hopefuls compete before two 18-year-old finalists, Rinku and Dinesh (Suraj Sharma, Madhur Mittal), emerge as winners. JB brings them back to the United States to train with legendary pitching coach Tom House (Bill Paxton). The goal: get the boys signed to a major league team. Not only is the game itself difficult to master, but life in the U.S. with a committed bachelor makes things even more complicated-for all of them. While Rinku and Dinesh learn the finer points of baseball and American culture, they in turn teach JB the true meaning of teamwork and commitment. Ultimately, what began as a purely commercial venture becomes something more and leads JB to find the one thing he was never looking for at all-a family. (c) Walt Disney Pictures","posters":{"thumbnail":"http:\\/\\/content8.flixster.com\\/movie\\/11\\/17\\/77\\/11177778_mob.jpg","profile":"http:\\/\\/content8.flixster.com\\/movie\\/11\\/17\\/77\\/11177778_pro.jpg","detailed":"http:\\/\\/content8.flixster.com\\/movie\\/11\\/17\\/77\\/11177778_det.jpg","original":"http:\\/\\/content8.flixster.com\\/movie\\/11\\/17\\/77\\/11177778_ori.jpg"},"abridged_cast":[{"name":"Jon Hamm","id":"770696952","characters":["JB Bernstein"]},{"name":"Aasif Mandvi","id":"364605673","characters":["Aash"]},{"name":"Bill Paxton","id":"162654226","characters":["Tom House"]},{"name":"Madhur Mittal","id":"770826138","characters":["Dinesh"]},{"name":"Suraj Sharma","id":"771086290","characters":["Rinku"]}],"abridged_directors":[{"name":"Craig Gillespie"}],"studio":"Walt Disney Pictures","alternate_ids":{"imdb":"1647668"},"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771357481.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/million_dollar_arm\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771357481\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771357481\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771357481\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771357481\\/similar.json"}}'),
(9, 'A Fistful of Dollars (Per un Pugno di Dollari)', 1964, '13370', '{"id":13370,"title":"A Fistful of Dollars (Per un Pugno di Dollari)","year":1964,"genres":["Western","Action & Adventure","Art House & International","Classics"],"mpaa_rating":"R","runtime":101,"critics_consensus":"With Akira Kurosawa''s Yojimbo as his template, Sergio Leone''s A Fistful of Dollars helped define a new era for the Western and usher in its most iconic star, Clint Eastwood.","release_dates":{"theater":"1964-09-12","dvd":"2001-06-19"},"ratings":{"critics_rating":"Certified Fresh","critics_score":98,"audience_rating":"Upright","audience_score":91},"synopsis":"","posters":{"thumbnail":"http:\\/\\/content6.flixster.com\\/movie\\/26\\/94\\/269416_mob.jpg","profile":"http:\\/\\/content6.flixster.com\\/movie\\/26\\/94\\/269416_pro.jpg","detailed":"http:\\/\\/content6.flixster.com\\/movie\\/26\\/94\\/269416_det.jpg","original":"http:\\/\\/content6.flixster.com\\/movie\\/26\\/94\\/269416_ori.jpg"},"abridged_cast":[{"name":"Clint Eastwood","id":"162659169","characters":["The Man with No Name"]},{"name":"Marianne Koch","id":"770696373","characters":["Marisol"]},{"name":"Gian Maria Volonte","id":"162691414","characters":["Ramon Rojo"]},{"name":"Wolfgang Lukschy","id":"770716689","characters":["John Baxter"]},{"name":"Mario Brega","id":"260692025","characters":["Chico"]}],"abridged_directors":[{"name":"Sergio Leone"}],"studio":"MGM Home Entertainment","alternate_ids":{"imdb":"0058461"},"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/13370.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/fistful_of_dollars\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/13370\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/13370\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/13370\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/13370\\/similar.json"}}'),
(10, 'Dollar', 1938, '770897537', '{"id":770897537,"title":"Dollar","year":1938,"genres":["Art House & International","Comedy"],"mpaa_rating":"Unrated","runtime":74,"release_dates":{"dvd":"1991-10-16"},"ratings":{"critics_score":-1,"audience_rating":"Upright","audience_score":100},"synopsis":"","posters":{"thumbnail":"http:\\/\\/content7.flixster.com\\/movie\\/10\\/96\\/28\\/10962873_mob.jpg","profile":"http:\\/\\/content7.flixster.com\\/movie\\/10\\/96\\/28\\/10962873_pro.jpg","detailed":"http:\\/\\/content7.flixster.com\\/movie\\/10\\/96\\/28\\/10962873_det.jpg","original":"http:\\/\\/content7.flixster.com\\/movie\\/10\\/96\\/28\\/10962873_ori.jpg"},"abridged_cast":[{"name":"Ingrid Bergman","id":"162658133","characters":["Julia Balzar"]},{"name":"Millan Bolander","id":"770936856"},{"name":"Elsa Burnett","id":"770936857","characters":["Mary Johnstone"]},{"name":"Gosta Cederlund","id":"414854830"},{"name":"Kotti Chave","id":"770936858","characters":["Lt. Louis Brenner"]}],"abridged_directors":[{"name":"Gustaf Molander"}],"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770897537.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/dollar\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770897537\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770897537\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770897537\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770897537\\/similar.json"}}'),
(11, 'Dollar', 1999, '771362987', '{"id":771362987,"title":"Dollar","year":1999,"genres":["Drama"],"mpaa_rating":"Unrated","runtime":92,"release_dates":{"theater":"1999-01-01"},"ratings":{"critics_score":-1,"audience_score":0},"synopsis":"","posters":{"thumbnail":"http:\\/\\/images.rottentomatoescdn.com\\/images\\/redesign\\/poster_default.gif","profile":"http:\\/\\/images.rottentomatoescdn.com\\/images\\/redesign\\/poster_default.gif","detailed":"http:\\/\\/images.rottentomatoescdn.com\\/images\\/redesign\\/poster_default.gif","original":"http:\\/\\/images.rottentomatoescdn.com\\/images\\/redesign\\/poster_default.gif"},"abridged_cast":[],"abridged_directors":[{"name":"Imunga Ivanga"}],"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771362987.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/771362987\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771362987\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771362987\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771362987\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/771362987\\/similar.json"}}'),
(12, 'The King of Kong: A Fistful of Quarters', 2007, '770669466', '{"id":770669466,"title":"The King of Kong: A Fistful of Quarters","year":2007,"genres":["Documentary","Sports & Fitness","Special Interest"],"mpaa_rating":"PG-13","runtime":82,"critics_consensus":"The King of Kong is funny and compelling with more than a few poignant insights into human behavior. Director Seth Gordon presents the dueling King Kong players in all their obsessive complexity and with perfectly al dente observations.","release_dates":{"theater":"2007-08-17","dvd":"2008-01-29"},"ratings":{"critics_rating":"Certified Fresh","critics_score":96,"audience_rating":"Upright","audience_score":93},"synopsis":"","posters":{"thumbnail":"http:\\/\\/content9.flixster.com\\/movie\\/10\\/84\\/07\\/10840735_mob.jpg","profile":"http:\\/\\/content9.flixster.com\\/movie\\/10\\/84\\/07\\/10840735_pro.jpg","detailed":"http:\\/\\/content9.flixster.com\\/movie\\/10\\/84\\/07\\/10840735_det.jpg","original":"http:\\/\\/content9.flixster.com\\/movie\\/10\\/84\\/07\\/10840735_ori.jpg"},"abridged_cast":[{"name":"Billy Mitchell","id":"770669585"},{"name":"Doris Self","id":"770669588"},{"name":"Steve Wiebe","id":"770681022"},{"name":"Nicole Wiebe","id":"771054129"},{"name":"Steve Sanders (IX)","id":"770669587"}],"abridged_directors":[{"name":"Seth Gordon"}],"studio":"New Line Cinema","alternate_ids":{"imdb":"0923752"},"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770669466.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/king_of_kong\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770669466\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770669466\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770669466\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770669466\\/similar.json"}}'),
(13, 'A Fistful of Dynamite (Duck, You Sucker) (Giu la testa)', 1972, '147491971', '{"id":147491971,"title":"A Fistful of Dynamite (Duck, You Sucker) (Giu la testa)","year":1972,"genres":["Western","Action & Adventure","Classics"],"mpaa_rating":"R","runtime":139,"release_dates":{"theater":"1972-06-01","dvd":"2007-06-05"},"ratings":{"critics_rating":"Fresh","critics_score":90,"audience_rating":"Upright","audience_score":83},"synopsis":"","posters":{"thumbnail":"http:\\/\\/content6.flixster.com\\/movie\\/10\\/93\\/53\\/10935356_mob.jpg","profile":"http:\\/\\/content6.flixster.com\\/movie\\/10\\/93\\/53\\/10935356_pro.jpg","detailed":"http:\\/\\/content6.flixster.com\\/movie\\/10\\/93\\/53\\/10935356_det.jpg","original":"http:\\/\\/content6.flixster.com\\/movie\\/10\\/93\\/53\\/10935356_ori.jpg"},"abridged_cast":[{"name":"Rod Steiger","id":"162665855","characters":["Juan Miranda"]},{"name":"James Coburn","id":"162667873","characters":["John H. \\"Sean\\" Mallory"]},{"name":"Romolo Valli","id":"364597632","characters":["Dr. Villego"]},{"name":"Maria Monti","id":"364597629","characters":["Adolita"]},{"name":"Jean Michel Antoine","id":"770941547"}],"abridged_directors":[{"name":"Sergio Leone"}],"studio":"United Artists","alternate_ids":{"imdb":"0067140"},"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/147491971.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/fistful_of_dynamite\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/147491971\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/147491971\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/147491971\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/147491971\\/similar.json"}}'),
(14, 'Fistful of Lead', 1970, '21408', '{"id":21408,"title":"Fistful of Lead","year":1970,"genres":["Art House & International","Western"],"mpaa_rating":"R","runtime":92,"release_dates":{"dvd":"2001-04-24"},"ratings":{"critics_score":-1,"audience_rating":"Spilled","audience_score":40},"synopsis":"","posters":{"thumbnail":"http:\\/\\/content8.flixster.com\\/movie\\/30\\/63\\/306306_mob.jpg","profile":"http:\\/\\/content8.flixster.com\\/movie\\/30\\/63\\/306306_pro.jpg","detailed":"http:\\/\\/content8.flixster.com\\/movie\\/30\\/63\\/306306_det.jpg","original":"http:\\/\\/content8.flixster.com\\/movie\\/30\\/63\\/306306_ori.jpg"},"abridged_cast":[{"name":"George Hilton","id":"527540847","characters":["Sartana"]},{"name":"Charles Southwood","id":"770695913","characters":["Sabata"]},{"name":"Erika Blanc","id":"392725268","characters":["Trixie"]},{"name":"Rick Boyd","id":"770741950"},{"name":"Piero Lulli","id":"462965955","characters":["Samuel Spencer"]}],"abridged_directors":[{"name":"Giuliano Carnimeo"}],"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/21408.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/fistful-of-lead\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/21408\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/21408\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/21408\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/21408\\/similar.json"}}'),
(15, 'Fistful of Brains', 2008, '770796514', '{"id":770796514,"title":"Fistful of Brains","year":2008,"genres":["Western","Horror"],"mpaa_rating":"Unrated","runtime":90,"release_dates":{"theater":"2008-10-10"},"ratings":{"critics_score":-1,"audience_rating":"Spilled","audience_score":33},"synopsis":"","posters":{"thumbnail":"http:\\/\\/content7.flixster.com\\/movie\\/10\\/92\\/09\\/10920965_mob.jpg","profile":"http:\\/\\/content7.flixster.com\\/movie\\/10\\/92\\/09\\/10920965_pro.jpg","detailed":"http:\\/\\/content7.flixster.com\\/movie\\/10\\/92\\/09\\/10920965_det.jpg","original":"http:\\/\\/content7.flixster.com\\/movie\\/10\\/92\\/09\\/10920965_ori.jpg"},"abridged_cast":[{"name":"Conrad Osborne","id":"770818114"},{"name":"Darrell Parker","id":"770818116"},{"name":"Edward Warner","id":"770818115"},{"name":"Jaqueline Martini","id":"770818113"},{"name":"Wayne Bates","id":"770818117"}],"abridged_directors":[{"name":"Christine Parker"}],"alternate_ids":{"imdb":"1204898"},"links":{"self":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770796514.json","alternate":"http:\\/\\/www.rottentomatoes.com\\/m\\/fistful-of-brains\\/","cast":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770796514\\/cast.json","clips":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770796514\\/clips.json","reviews":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770796514\\/reviews.json","similar":"http:\\/\\/api.rottentomatoes.com\\/api\\/public\\/v1.0\\/movies\\/770796514\\/similar.json"}}');

-- --------------------------------------------------------

--
-- Structure de la table `film_watched_by_user`
--

DROP TABLE IF EXISTS `film_watched_by_user`;
CREATE TABLE IF NOT EXISTS `film_watched_by_user` (
  `film_watched_by_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`film_watched_by_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE IF NOT EXISTS `genres` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Contenu de la table `genres`
--

INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES
(1, 'Drama'),
(2, 'Special Interest'),
(3, 'Musical & Performing Arts'),
(4, 'Classics'),
(5, 'Comedy'),
(6, 'Horror'),
(7, 'Art House & International'),
(8, 'Romance'),
(9, 'Western'),
(10, 'Action & Adventure'),
(11, 'Documentary'),
(12, 'Sports & Fitness');

-- --------------------------------------------------------

--
-- Structure de la table `genres_to_film_title`
--

DROP TABLE IF EXISTS `genres_to_film_title`;
CREATE TABLE IF NOT EXISTS `genres_to_film_title` (
  `genres_to_film_title_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_id` int(11) NOT NULL,
  `film_title_id` int(11) NOT NULL,
  PRIMARY KEY (`genres_to_film_title_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=35 ;

--
-- Contenu de la table `genres_to_film_title`
--

INSERT INTO `genres_to_film_title` (`genres_to_film_title_id`, `genre_id`, `film_title_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 1, 3),
(7, 5, 3),
(8, 1, 4),
(9, 3, 4),
(10, 4, 4),
(11, 5, 4),
(12, 6, 5),
(13, 7, 6),
(14, 1, 7),
(15, 8, 7),
(16, 1, 8),
(17, 5, 8),
(18, 9, 9),
(19, 10, 9),
(20, 7, 9),
(21, 4, 9),
(22, 7, 10),
(23, 5, 10),
(24, 1, 11),
(25, 11, 12),
(26, 12, 12),
(27, 2, 12),
(28, 9, 13),
(29, 10, 13),
(30, 4, 13),
(31, 7, 14),
(32, 9, 14),
(33, 9, 15),
(34, 6, 15);

-- --------------------------------------------------------

--
-- Structure de la table `meta_tag`
--

DROP TABLE IF EXISTS `meta_tag`;
CREATE TABLE IF NOT EXISTS `meta_tag` (
  `meta_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_tag_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_tag_type` int(11) NOT NULL,
  `meta_tag_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`meta_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `meta_tag_to_doc`
--

DROP TABLE IF EXISTS `meta_tag_to_doc`;
CREATE TABLE IF NOT EXISTS `meta_tag_to_doc` (
  `meta_tag_to_doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_tag_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  PRIMARY KEY (`meta_tag_to_doc_id`),
  KEY `meta_tag_to_doc_id` (`meta_tag_to_doc_id`),
  KEY `meta_tag_to_doc_id_2` (`meta_tag_to_doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `opened_by_user`
--

DROP TABLE IF EXISTS `opened_by_user`;
CREATE TABLE IF NOT EXISTS `opened_by_user` (
  `opened_by_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `opened_by_user_date` datetime NOT NULL,
  PRIMARY KEY (`opened_by_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `open_tag`
--

DROP TABLE IF EXISTS `open_tag`;
CREATE TABLE IF NOT EXISTS `open_tag` (
  `open_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`open_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `open_tag_to_annotation`
--

DROP TABLE IF EXISTS `open_tag_to_annotation`;
CREATE TABLE IF NOT EXISTS `open_tag_to_annotation` (
  `open_tag_to_annotation_id` int(11) NOT NULL AUTO_INCREMENT,
  `open_tag_id` int(11) NOT NULL,
  `user_annotation_id` int(11) NOT NULL,
  PRIMARY KEY (`open_tag_to_annotation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `recommended_to_user`
--

DROP TABLE IF EXISTS `recommended_to_user`;
CREATE TABLE IF NOT EXISTS `recommended_to_user` (
  `recommended_to_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`recommended_to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `tag_type`
--

DROP TABLE IF EXISTS `tag_type`;
CREATE TABLE IF NOT EXISTS `tag_type` (
  `tag_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_type` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`tag_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `tag_type`
--

INSERT INTO `tag_type` (`tag_type_id`, `tag_type`) VALUES
(1, 'Réalisateur'),
(2, 'Année'),
(3, 'Acteur'),
(4, 'Genre');

-- --------------------------------------------------------

--
-- Structure de la table `to_watch_for_user`
--

DROP TABLE IF EXISTS `to_watch_for_user`;
CREATE TABLE IF NOT EXISTS `to_watch_for_user` (
  `to_watch_for_user` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`to_watch_for_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_inscription` datetime NOT NULL,
  `user_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_pw` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `user_annotation`
--

DROP TABLE IF EXISTS `user_annotation`;
CREATE TABLE IF NOT EXISTS `user_annotation` (
  `user_annotation_id` int(11) NOT NULL AUTO_INCREMENT,
  `source_doc_id` int(11) NOT NULL,
  `target_doc_id` int(11) NOT NULL,
  `annotated_by_user_id` int(11) NOT NULL,
  `annotated_for_tag_type_id` int(11) NOT NULL,
  `source_frame_id` int(11) NOT NULL,
  `target_frame_id` int(11) NOT NULL,
  `annotation_contents_id` int(11) NOT NULL,
  `annotation_description` varchar(142) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_annotation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
