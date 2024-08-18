DROP SCHEMA IF EXISTS `usar` ;
CREATE SCHEMA IF NOT EXISTS `usar` DEFAULT CHARACTER SET latin1 ;
USE `usar` ;

-- -----------------------------------------------------
-- Table `usar`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `usar`.`players`
(
    `player_id`             INT(6)      NOT NULL,
    `full_name`             VARCHAR(50) NULL DEFAULT NULL,
    `membership_status`     VARCHAR(50) NULL DEFAULT NULL,
    `member_since`          DATE        NULL DEFAULT NULL,
    `membership_expiration` DATE        NULL DEFAULT NULL,
    `gender`                VARCHAR(50) NULL DEFAULT NULL,
    `email`                 VARCHAR(25) NULL DEFAULT NULL,
    `phone`                 VARCHAR(25) NULL DEFAULT NULL,
    `dob`                   VARCHAR(25) NULL DEFAULT NULL,
    `address`               LONGTEXT    NULL DEFAULT NULL,
    `city`                  VARCHAR(50) NULL DEFAULT NULL,
    `state_province`        VARCHAR(50) NULL DEFAULT NULL,
    `country`               VARCHAR(50) NULL DEFAULT NULL,
    `zip_postal_code`       VARCHAR(15) NULL DEFAULT NULL,
    PRIMARY KEY (`player_id`)
);

-- -----------------------------------------------------
-- Table `usar`.`tournaments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usar.tournaments
(
    tournament_id   INT(11)     NOT NULL AUTO_INCREMENT,
    tournament_name VARCHAR(50) NULL DEFAULT NULL,
    location        VARCHAR(50) NULL DEFAULT NULL,
    date            DATE        NULL DEFAULT NULL,
    type            VARCHAR(50) NULL DEFAULT NULL,
    fwango_url      VARCHAR(50) NULL DEFAULT NULL,
    PRIMARY KEY (tournament_id)
);

-- -----------------------------------------------------
-- Table `usar`.`participation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usar.participation
(
    player_id     INT(6)   NOT NULL,
    tournament_id INT(11)  NOT NULL,
    register_date DATETIME NULL DEFAULT NULL,
    PRIMARY KEY (player_id,
                 tournament_id),
    FOREIGN KEY (player_id)
        REFERENCES players (player_id),
    FOREIGN KEY (tournament_id)
        REFERENCES tournaments (tournament_id)
);

