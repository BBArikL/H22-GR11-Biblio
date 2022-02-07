-- MySQL Script generated by MySQL Workbench
-- lun 07 fév 2022 17:39:37
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BiblioLexicusDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BiblioLexicusDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BiblioLexicusDB` DEFAULT CHARACTER SET utf8 ;
USE `BiblioLexicusDB` ;

-- -----------------------------------------------------
-- Table `BiblioLexicusDB`.`Works`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BiblioLexicusDB`.`Works` (
  `ID_Works` VARCHAR(16) NOT NULL,
  `Work_Name` VARCHAR(50) NOT NULL,
  `Author_Name` VARCHAR(250) NOT NULL,
  `Publication_Date` DATE NOT NULL,
  `Edition_House` VARCHAR(45) NOT NULL,
  `ID_Library` VARCHAR(2) NOT NULL,
  `Length` INT UNSIGNED NULL,
  `Resume` NVARCHAR(2000) NOT NULL,
  `Genre` VARCHAR(2) NOT NULL,
  `Language` VARCHAR(18) NOT NULL,
  `State` VARCHAR(2) NOT NULL,
  `Copy_Number` INT NOT NULL,
  `Type_Work` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`ID_Works`),
  UNIQUE INDEX `idWorks_UNIQUE` (`ID_Works` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BiblioLexicusDB`.`Library_Data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BiblioLexicusDB`.`Library_Data` (
  `ID_Works` VARCHAR(2) NOT NULL,
  `ID_Users` VARCHAR(16) NOT NULL,
  `Schedule` VARCHAR(11) NOT NULL,
  `Postal_Code` VARCHAR(6) NOT NULL,
  `Site_Internet_Bibliotheque` VARCHAR(45) NOT NULL,
  `Numero_Telephone` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`ID_Works`),
  UNIQUE INDEX `ID_Library_UNIQUE` (`ID_Works` ASC) VISIBLE,
  UNIQUE INDEX `ID_Users_UNIQUE` (`ID_Users` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BiblioLexicusDB`.`Donnees_Bibiliotheque_has_Ouvrages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BiblioLexicusDB`.`Donnees_Bibiliotheque_has_Ouvrages` (
  `Donnees_Bibiliotheque_ID_Ouvrages` VARCHAR(2) NOT NULL,
  `Ouvrages_ID_Ouvrages` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`Donnees_Bibiliotheque_ID_Ouvrages`, `Ouvrages_ID_Ouvrages`),
  INDEX `fk_Donnees_Bibiliotheque_has_Ouvrages_Ouvrages1_idx` (`Ouvrages_ID_Ouvrages` ASC) VISIBLE,
  INDEX `fk_Donnees_Bibiliotheque_has_Ouvrages_Donnees_Bibiliotheque_idx` (`Donnees_Bibiliotheque_ID_Ouvrages` ASC) VISIBLE,
  CONSTRAINT `fk_Donnees_Bibiliotheque_has_Ouvrages_Donnees_Bibiliotheque`
    FOREIGN KEY (`Donnees_Bibiliotheque_ID_Ouvrages`)
    REFERENCES `BiblioLexicusDB`.`Library_Data` (`ID_Works`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Donnees_Bibiliotheque_has_Ouvrages_Ouvrages1`
    FOREIGN KEY (`Ouvrages_ID_Ouvrages`)
    REFERENCES `BiblioLexicusDB`.`Works` (`ID_Works`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BiblioLexicusDB`.`Users_List`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BiblioLexicusDB`.`Users_List` (
  `ID_Users` VARCHAR(16) NOT NULL,
  `Name` VARCHAR(50) NOT NULL,
  `First_Name` VARCHAR(100) NOT NULL,
  `Date_Birth` DATE NOT NULL,
  `Fees` DECIMAL UNSIGNED NOT NULL DEFAULT 0,
  `Email` VARCHAR(320) NOT NULL,
  `Postal_Code` VARCHAR(6) NOT NULL,
  `Expiration_Subscription` DATE NOT NULL,
  `Permissions` VARCHAR(2) NOT NULL DEFAULT '00',
  PRIMARY KEY (`ID_Users`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `ID_Users_UNIQUE` (`ID_Users` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BiblioLexicusDB`.`Borrowed_works`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BiblioLexicusDB`.`Borrowed_works` (
  `ID_Works` VARCHAR(16) NOT NULL,
  `End_Loan_Date` DATE NOT NULL,
  `ID_Users` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`ID_Works`),
  UNIQUE INDEX `ID_Works_UNIQUE` (`ID_Works` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BiblioLexicusDB`.`Comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BiblioLexicusDB`.`Comments` (
  `ID_Comments` INT NOT NULL,
  `ID_Ouvrages` VARCHAR(16) NOT NULL,
  `ID_Users` VARCHAR(16) NOT NULL,
  `Release_Date` DATETIME NOT NULL,
  `Comment_Text` TINYTEXT NOT NULL,
  PRIMARY KEY (`ID_Comments`),
  UNIQUE INDEX `ID_Comments_UNIQUE` (`ID_Comments` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BiblioLexicusDB`.`Liste_Utilisateurs_has_Donnees_Bibiliotheque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BiblioLexicusDB`.`Liste_Utilisateurs_has_Donnees_Bibiliotheque` (
  `Liste_Utilisateurs_ID_Utilisateurs` VARCHAR(16) NOT NULL,
  `Donnees_Bibiliotheque_ID_Ouvrages` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`Liste_Utilisateurs_ID_Utilisateurs`, `Donnees_Bibiliotheque_ID_Ouvrages`),
  INDEX `fk_Liste_Utilisateurs_has_Donnees_Bibiliotheque_Donnees_Bib_idx` (`Donnees_Bibiliotheque_ID_Ouvrages` ASC) VISIBLE,
  INDEX `fk_Liste_Utilisateurs_has_Donnees_Bibiliotheque_Liste_Utili_idx` (`Liste_Utilisateurs_ID_Utilisateurs` ASC) VISIBLE,
  CONSTRAINT `fk_Liste_Utilisateurs_has_Donnees_Bibiliotheque_Liste_Utilisa1`
    FOREIGN KEY (`Liste_Utilisateurs_ID_Utilisateurs`)
    REFERENCES `BiblioLexicusDB`.`Users_List` (`ID_Users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Liste_Utilisateurs_has_Donnees_Bibiliotheque_Donnees_Bibil1`
    FOREIGN KEY (`Donnees_Bibiliotheque_ID_Ouvrages`)
    REFERENCES `BiblioLexicusDB`.`Library_Data` (`ID_Works`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BiblioLexicusDB`.`Commentaires_has_Liste_Utilisateurs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BiblioLexicusDB`.`Commentaires_has_Liste_Utilisateurs` (
  `Commentaires_ID_Commentaire` INT NOT NULL,
  `Liste_Utilisateurs_ID_Utilisateurs` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`Commentaires_ID_Commentaire`, `Liste_Utilisateurs_ID_Utilisateurs`),
  INDEX `fk_Commentaires_has_Liste_Utilisateurs_Liste_Utilisateurs1_idx` (`Liste_Utilisateurs_ID_Utilisateurs` ASC) VISIBLE,
  INDEX `fk_Commentaires_has_Liste_Utilisateurs_Commentaires1_idx` (`Commentaires_ID_Commentaire` ASC) VISIBLE,
  CONSTRAINT `fk_Commentaires_has_Liste_Utilisateurs_Commentaires1`
    FOREIGN KEY (`Commentaires_ID_Commentaire`)
    REFERENCES `BiblioLexicusDB`.`Comments` (`ID_Comments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Commentaires_has_Liste_Utilisateurs_Liste_Utilisateurs1`
    FOREIGN KEY (`Liste_Utilisateurs_ID_Utilisateurs`)
    REFERENCES `BiblioLexicusDB`.`Users_List` (`ID_Users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BiblioLexicusDB`.`Comments_has_Ouvrages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BiblioLexicusDB`.`Comments_has_Ouvrages` (
  `Commentaires_ID_Commentaire` INT NOT NULL,
  `Ouvrages_ID_Ouvrages` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`Commentaires_ID_Commentaire`, `Ouvrages_ID_Ouvrages`),
  INDEX `fk_Commentaires_has_Ouvrages_Ouvrages1_idx` (`Ouvrages_ID_Ouvrages` ASC) VISIBLE,
  INDEX `fk_Commentaires_has_Ouvrages_Commentaires1_idx` (`Commentaires_ID_Commentaire` ASC) VISIBLE,
  CONSTRAINT `fk_Commentaires_has_Ouvrages_Commentaires1`
    FOREIGN KEY (`Commentaires_ID_Commentaire`)
    REFERENCES `BiblioLexicusDB`.`Comments` (`ID_Comments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Commentaires_has_Ouvrages_Ouvrages1`
    FOREIGN KEY (`Ouvrages_ID_Ouvrages`)
    REFERENCES `BiblioLexicusDB`.`Works` (`ID_Works`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BiblioLexicusDB`.`Liste_Utilisateurs_has_Ouvrages_Emprunte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BiblioLexicusDB`.`Liste_Utilisateurs_has_Ouvrages_Emprunte` (
  `Liste_Utilisateurs_ID_Utilisateurs` VARCHAR(16) NOT NULL,
  `Ouvrages_Emprunte_ID_Ouvrages` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`Liste_Utilisateurs_ID_Utilisateurs`, `Ouvrages_Emprunte_ID_Ouvrages`),
  INDEX `fk_Liste_Utilisateurs_has_Ouvrages_Emprunte_Ouvrages_Emprun_idx` (`Ouvrages_Emprunte_ID_Ouvrages` ASC) VISIBLE,
  INDEX `fk_Liste_Utilisateurs_has_Ouvrages_Emprunte_Liste_Utilisate_idx` (`Liste_Utilisateurs_ID_Utilisateurs` ASC) VISIBLE,
  CONSTRAINT `fk_Liste_Utilisateurs_has_Ouvrages_Emprunte_Liste_Utilisateurs1`
    FOREIGN KEY (`Liste_Utilisateurs_ID_Utilisateurs`)
    REFERENCES `BiblioLexicusDB`.`Users_List` (`ID_Users`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Liste_Utilisateurs_has_Ouvrages_Emprunte_Ouvrages_Emprunte1`
    FOREIGN KEY (`Ouvrages_Emprunte_ID_Ouvrages`)
    REFERENCES `BiblioLexicusDB`.`Borrowed_works` (`ID_Works`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BiblioLexicusDB`.`Ouvrages_has_Ouvrages_Emprunte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BiblioLexicusDB`.`Ouvrages_has_Ouvrages_Emprunte` (
  `Ouvrages_ID_Ouvrages` VARCHAR(16) NOT NULL,
  `Ouvrages_Emprunte_ID_Ouvrages` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`Ouvrages_ID_Ouvrages`, `Ouvrages_Emprunte_ID_Ouvrages`),
  INDEX `fk_Ouvrages_has_Ouvrages_Emprunte_Ouvrages_Emprunte1_idx` (`Ouvrages_Emprunte_ID_Ouvrages` ASC) VISIBLE,
  INDEX `fk_Ouvrages_has_Ouvrages_Emprunte_Ouvrages1_idx` (`Ouvrages_ID_Ouvrages` ASC) VISIBLE,
  CONSTRAINT `fk_Ouvrages_has_Ouvrages_Emprunte_Ouvrages1`
    FOREIGN KEY (`Ouvrages_ID_Ouvrages`)
    REFERENCES `BiblioLexicusDB`.`Works` (`ID_Works`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ouvrages_has_Ouvrages_Emprunte_Ouvrages_Emprunte1`
    FOREIGN KEY (`Ouvrages_Emprunte_ID_Ouvrages`)
    REFERENCES `BiblioLexicusDB`.`Borrowed_works` (`ID_Works`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BiblioLexicusDB`.`Lost_Works`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BiblioLexicusDB`.`Lost_Works` (
  `idLost_Items` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`idLost_Items`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
