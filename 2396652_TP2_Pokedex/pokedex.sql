-- Project: TP2 Pokedex
-- Author: Mariana Neri

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `pokedex`.`pokemon` 
CHANGE COLUMN `taille` `taille` DECIMAL(2) NOT NULL ,
CHANGE COLUMN `poid` `poid` DECIMAL(2) NOT NULL ;

CREATE TABLE IF NOT EXISTS `pokedex`.`pokemon_has_type` (
  `pokemon_numeronational` INT(11) NOT NULL,
  `pokemon_pokemon_numeronational` INT(11) NOT NULL,
  `type_nom` INT(11) NOT NULL,
  PRIMARY KEY (`pokemon_numeronational`, `pokemon_pokemon_numeronational`, `type_nom`),
  INDEX `fk_pokemon_has_type_type1_idx` (`type_nom` ASC),
  INDEX `fk_pokemon_has_type_pokemon_idx` (`pokemon_numeronational` ASC, `pokemon_pokemon_numeronational` ASC),
  CONSTRAINT `fk_pokemon_has_type_pokemon`
    FOREIGN KEY (`pokemon_pokemon_numeronational`)
    REFERENCES `pokedex`.`pokemon` (`pokemon_numeronational`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokemon_has_type_type1`
    FOREIGN KEY (`type_nom`)
    REFERENCES `pokedex`.`type` (`nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pokedex`.`pokemon_has_attaques` (
  `pokemon_numeronational` INT(11) NOT NULL,
  `pokemon_pokemon_numeronational` INT(11) NOT NULL,
  `attaques_nom` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`pokemon_numeronational`, `pokemon_pokemon_numeronational`, `attaques_nom`),
  INDEX `fk_pokemon_has_attaques_attaques1_idx` (`attaques_nom` ASC),
  INDEX `fk_pokemon_has_attaques_pokemon1_idx` (`pokemon_numeronational` ASC, `pokemon_pokemon_numeronational` ASC),
  CONSTRAINT `fk_pokemon_has_attaques_pokemon1`
    FOREIGN KEY (`pokemon_pokemon_numeronational`)
    REFERENCES `pokedex`.`pokemon` (`pokemon_numeronational`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokemon_has_attaques_attaques1`
    FOREIGN KEY (`attaques_nom`)
    REFERENCES `pokedex`.`attaques` (`nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pokedex`.`category` (
  `category_id` INT(11) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pokedex`.`type_efficace` (
  `type_nom` VARCHAR(80) NOT NULL,
  `attaques_nom` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`type_nom`, `attaques_nom`),
  INDEX `fk_type_has_attaques_attaques1_idx` (`attaques_nom` ASC),
  INDEX `fk_type_has_attaques_type1_idx` (`type_nom` ASC),
  CONSTRAINT `fk_type_has_attaques_type1`
    FOREIGN KEY (`type_nom`)
    REFERENCES `pokedex`.`type` (`nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_type_has_attaques_attaques1`
    FOREIGN KEY (`attaques_nom`)
    REFERENCES `pokedex`.`attaques` (`nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pokedex`.`pokemon_has_evolutions` (
  `pokemon_pokemon_numeronational` INT(11) NOT NULL,
  `evolutions_numeronational` INT(11) NOT NULL,
  PRIMARY KEY (`pokemon_pokemon_numeronational`, `evolutions_numeronational`),
  INDEX `fk_pokemon_has_evolutions_evolutions1_idx` (`evolutions_numeronational` ASC),
  INDEX `fk_pokemon_has_evolutions_pokemon1_idx` (`pokemon_pokemon_numeronational` ASC),
  CONSTRAINT `fk_pokemon_has_evolutions_pokemon1`
    FOREIGN KEY (`pokemon_pokemon_numeronational`)
    REFERENCES `pokedex`.`pokemon` (`pokemon_numeronational`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokemon_has_evolutions_evolutions1`
    FOREIGN KEY (`evolutions_numeronational`)
    REFERENCES `pokedex`.`evolutions` (`numeronational`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
