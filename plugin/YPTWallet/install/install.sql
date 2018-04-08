SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `wallet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `balance` FLOAT(15,5) NOT NULL DEFAULT 0.0,
  `created` DATETIME NULL,
  `modified` DATETIME NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_wallet_users_idx` (`users_id` ASC),
  CONSTRAINT `fk_wallet_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `wallet_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `created` DATETIME NULL,
  `modified` DATETIME NULL,
  `value` FLOAT(15,5) NOT NULL,
  `description` VARCHAR(255) NULL,
  `wallet_id` INT NOT NULL,
  `json_data` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_wallet_log_wallet1_idx` (`wallet_id` ASC),
  CONSTRAINT `fk_wallet_log_wallet1`
    FOREIGN KEY (`wallet_id`)
    REFERENCES `wallet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
