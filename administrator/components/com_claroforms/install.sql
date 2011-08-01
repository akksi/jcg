#DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
  `idGame` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `creationDate` datetime NOT NULL,
  `activationDate` datetime DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `creationIp` varchar(255) DEFAULT NULL,
  `expirationIp` varchar(255) DEFAULT NULL,
  `idStatus` int(11) NOT NULL,
  `idFileFlash` int(11) NOT NULL,
  `idFilePreview` int(11) NOT NULL,
  `idFileThumbnail` int(11) NOT NULL,
  PRIMARY KEY (`idGame`),
  KEY `fk_game_status` (`idStatus`),
  KEY `fk_file_flash` (`idFileFlash`),
  KEY `fk_file_preview` (`idFilePreview`),
  KEY `fk_file_thumbnail` (`idFileThumbnail`),
  CONSTRAINT `fk_file_flash` FOREIGN KEY (`idFileFlash`) REFERENCES `uploaded_files` (`file_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_file_preview` FOREIGN KEY (`idFilePreview`) REFERENCES `uploaded_files` (`file_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_file_thumbnail` FOREIGN KEY (`idFileThumbnail`) REFERENCES `uploaded_files` (`file_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_status` FOREIGN KEY (`idStatus`) REFERENCES `status` (`idStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8

