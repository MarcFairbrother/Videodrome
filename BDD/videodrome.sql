-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le: Lun 12 Mai 2014 à 11:18
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
-- Structure de la table `film_title_table`
--

DROP TABLE IF EXISTS `film_title_table`;
CREATE TABLE IF NOT EXISTS `film_title_table` (
  `film_title_id` int(11) NOT NULL AUTO_INCREMENT,
  `film_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `release_year` year(4) NOT NULL,
  `rotten_tomatoes_api_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`film_title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
