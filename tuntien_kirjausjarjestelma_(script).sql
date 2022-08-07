-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Tuntien_kirjausjärjestelmä
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Tuntien_kirjausjärjestelmä` ;

-- -----------------------------------------------------
-- Schema Tuntien_kirjausjärjestelmä
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Tuntien_kirjausjärjestelmä` DEFAULT CHARACTER SET utf8 ;
USE `Tuntien_kirjausjärjestelmä` ;

-- -----------------------------------------------------
-- Table `Tuntien_kirjausjärjestelmä`.`Tyontekija`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tuntien_kirjausjärjestelmä`.`Tyontekija` ;

CREATE TABLE IF NOT EXISTS `Tuntien_kirjausjärjestelmä`.`Tyontekija` (
  `tyontekijaID` INT NOT NULL AUTO_INCREMENT,
  `enimi` VARCHAR(25) NOT NULL,
  `snimi` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`tyontekijaID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tuntien_kirjausjärjestelmä`.`Tyotehtava`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tuntien_kirjausjärjestelmä`.`Tyotehtava` ;

CREATE TABLE IF NOT EXISTS `Tuntien_kirjausjärjestelmä`.`Tyotehtava` (
  `tyotehtavaID` INT NOT NULL AUTO_INCREMENT,
  `tyotehtava` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`tyotehtavaID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tuntien_kirjausjärjestelmä`.`Projekti`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tuntien_kirjausjärjestelmä`.`Projekti` ;

CREATE TABLE IF NOT EXISTS `Tuntien_kirjausjärjestelmä`.`Projekti` (
  `projektiID` INT NOT NULL AUTO_INCREMENT,
  `pnimi` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`projektiID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tuntien_kirjausjärjestelmä`.`Palaute`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tuntien_kirjausjärjestelmä`.`Palaute` ;

CREATE TABLE IF NOT EXISTS `Tuntien_kirjausjärjestelmä`.`Palaute` (
  `palauteID` INT NOT NULL AUTO_INCREMENT,
  `palaute` VARCHAR(200) NULL,
  PRIMARY KEY (`palauteID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tuntien_kirjausjärjestelmä`.`Osasto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tuntien_kirjausjärjestelmä`.`Osasto` ;

CREATE TABLE IF NOT EXISTS `Tuntien_kirjausjärjestelmä`.`Osasto` (
  `osastoID` INT NOT NULL AUTO_INCREMENT,
  `osnimi` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`osastoID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tuntien_kirjausjärjestelmä`.`Tuntienkirjaus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tuntien_kirjausjärjestelmä`.`Tuntienkirjaus` ;

CREATE TABLE IF NOT EXISTS `Tuntien_kirjausjärjestelmä`.`Tuntienkirjaus` (
  `kirjauspvm` DATE NOT NULL,
  `proj_tunnit` INT NOT NULL,
  `tyontekijaID` INT NOT NULL,
  `projektiID` INT NOT NULL,
  `osastoID` INT NOT NULL,
  `tyotehtavaID` INT NOT NULL,
  `palauteID` INT NULL,
  PRIMARY KEY (`kirjauspvm`, `tyontekijaID`, `projektiID`, `osastoID`, `tyotehtavaID`),
  INDEX `fk_Tyontekija_has_Projekti_Projekti1_idx` (`projektiID` ASC),
  INDEX `fk_Tyontekija_has_Projekti_Tyontekija1_idx` (`tyontekijaID` ASC),
  INDEX `fk_Tuntienkirjaus_Osasto1_idx` (`osastoID` ASC),
  INDEX `fk_Tuntienkirjaus_Tyotehtava1_idx` (`tyotehtavaID` ASC),
  INDEX `fk_Tuntienkirjaus_Palaute1_idx` (`palauteID` ASC),
  CONSTRAINT `fk_Tyontekija_has_Projekti_Tyontekija1`
    FOREIGN KEY (`tyontekijaID`)
    REFERENCES `Tuntien_kirjausjärjestelmä`.`Tyontekija` (`tyontekijaID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tyontekija_has_Projekti_Projekti1`
    FOREIGN KEY (`projektiID`)
    REFERENCES `Tuntien_kirjausjärjestelmä`.`Projekti` (`projektiID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tuntienkirjaus_Osasto1`
    FOREIGN KEY (`osastoID`)
    REFERENCES `Tuntien_kirjausjärjestelmä`.`Osasto` (`osastoID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tuntienkirjaus_Tyotehtava1`
    FOREIGN KEY (`tyotehtavaID`)
    REFERENCES `Tuntien_kirjausjärjestelmä`.`Tyotehtava` (`tyotehtavaID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tuntienkirjaus_Palaute1`
    FOREIGN KEY (`palauteID`)
    REFERENCES `Tuntien_kirjausjärjestelmä`.`Palaute` (`palauteID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Tuntien_kirjausjärjestelmä`.`Tyontekija`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tuntien_kirjausjärjestelmä`;
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tyontekija` (`tyontekijaID`, `enimi`, `snimi`) VALUES (1, 'Markus', 'Ryynanen');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tyontekija` (`tyontekijaID`, `enimi`, `snimi`) VALUES (2, 'Janne', 'Kinnunen');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tyontekija` (`tyontekijaID`, `enimi`, `snimi`) VALUES (3, 'Henkka', 'Kinnunen');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tyontekija` (`tyontekijaID`, `enimi`, `snimi`) VALUES (4, 'Juuso', 'Jonninen');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tyontekija` (`tyontekijaID`, `enimi`, `snimi`) VALUES (5, 'Teuvo', 'Teravainen');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tyontekija` (`tyontekijaID`, `enimi`, `snimi`) VALUES (6, 'Sebastian', 'Aho');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tuntien_kirjausjärjestelmä`.`Tyotehtava`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tuntien_kirjausjärjestelmä`;
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tyotehtava` (`tyotehtavaID`, `tyotehtava`) VALUES (1, 'Suunnittelija');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tyotehtava` (`tyotehtavaID`, `tyotehtava`) VALUES (2, 'Johtaja');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tyotehtava` (`tyotehtavaID`, `tyotehtava`) VALUES (3, 'Testaaja');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tyotehtava` (`tyotehtavaID`, `tyotehtava`) VALUES (4, 'Tiiminvetäjä');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tyotehtava` (`tyotehtavaID`, `tyotehtava`) VALUES (5, 'Java-asiantuntija');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tyotehtava` (`tyotehtavaID`, `tyotehtava`) VALUES (6, 'Hyllyttaja');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tuntien_kirjausjärjestelmä`.`Projekti`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tuntien_kirjausjärjestelmä`;
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Projekti` (`projektiID`, `pnimi`) VALUES (1, 'Ikkunan suunnittelu');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Projekti` (`projektiID`, `pnimi`) VALUES (2, 'Katon suunnittelu');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Projekti` (`projektiID`, `pnimi`) VALUES (3, 'Sivuoven suunnittelu');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Projekti` (`projektiID`, `pnimi`) VALUES (4, 'Käytävän suunnittelu');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Projekti` (`projektiID`, `pnimi`) VALUES (5, 'Terassin suunnittelu');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tuntien_kirjausjärjestelmä`.`Palaute`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tuntien_kirjausjärjestelmä`;
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Palaute` (`palauteID`, `palaute`) VALUES (1, 'Katto tehtiin huolellisesti.');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Palaute` (`palauteID`, `palaute`) VALUES (2, 'Katossa oli puutteita.');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Palaute` (`palauteID`, `palaute`) VALUES (3, 'Tyo sujui hyvin.');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Palaute` (`palauteID`, `palaute`) VALUES (4, 'Surkea työ.');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Palaute` (`palauteID`, `palaute`) VALUES (5, 'Johtaminen oli surkeaa.');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Palaute` (`palauteID`, `palaute`) VALUES (6, 'Johtaminen oli hyvää.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tuntien_kirjausjärjestelmä`.`Osasto`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tuntien_kirjausjärjestelmä`;
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Osasto` (`osastoID`, `osnimi`) VALUES (1, 'Markkinointiosasto');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Osasto` (`osastoID`, `osnimi`) VALUES (2, 'Suunnitteluosasto');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Osasto` (`osastoID`, `osnimi`) VALUES (3, 'Kahvinkeitto-osasto');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Osasto` (`osastoID`, `osnimi`) VALUES (4, 'Testausosasto');
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Osasto` (`osastoID`, `osnimi`) VALUES (5, 'Olio-osasto');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tuntien_kirjausjärjestelmä`.`Tuntienkirjaus`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tuntien_kirjausjärjestelmä`;
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tuntienkirjaus` (`kirjauspvm`, `proj_tunnit`, `tyontekijaID`, `projektiID`, `osastoID`, `tyotehtavaID`, `palauteID`) VALUES ('2020-05-12', 2, 1, 3, 2, 2, 1);
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tuntienkirjaus` (`kirjauspvm`, `proj_tunnit`, `tyontekijaID`, `projektiID`, `osastoID`, `tyotehtavaID`, `palauteID`) VALUES ('2020-05-12', 2, 1, 2, 2, 2, NULL);
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tuntienkirjaus` (`kirjauspvm`, `proj_tunnit`, `tyontekijaID`, `projektiID`, `osastoID`, `tyotehtavaID`, `palauteID`) VALUES ('2020-05-13', 8, 2, 4, 3, 1, 3);
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tuntienkirjaus` (`kirjauspvm`, `proj_tunnit`, `tyontekijaID`, `projektiID`, `osastoID`, `tyotehtavaID`, `palauteID`) VALUES ('2020-05-13', 4, 3, 4, 3, 1, 3);
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tuntienkirjaus` (`kirjauspvm`, `proj_tunnit`, `tyontekijaID`, `projektiID`, `osastoID`, `tyotehtavaID`, `palauteID`) VALUES ('2020-05-13', 4, 4, 3, 3, 1, NULL);
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tuntienkirjaus` (`kirjauspvm`, `proj_tunnit`, `tyontekijaID`, `projektiID`, `osastoID`, `tyotehtavaID`, `palauteID`) VALUES ('2020-05-13', 4, 4, 3, 3, 2, NULL);
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tuntienkirjaus` (`kirjauspvm`, `proj_tunnit`, `tyontekijaID`, `projektiID`, `osastoID`, `tyotehtavaID`, `palauteID`) VALUES ('2020-05-14', 6, 5, 3, 2, 3, NULL);
INSERT INTO `Tuntien_kirjausjärjestelmä`.`Tuntienkirjaus` (`kirjauspvm`, `proj_tunnit`, `tyontekijaID`, `projektiID`, `osastoID`, `tyotehtavaID`, `palauteID`) VALUES ('2020-05-15', 1, 1, 3, 2, 4, NULL);

COMMIT;
