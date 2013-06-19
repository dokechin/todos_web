grant all privileges on todomvc.* to todomvc@localhost identified by 'todomvc';


CREATE SCHEMA IF NOT EXISTS `todomvc`;
USE `todomvc` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tweet`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `todomvc`.`Todo` (
      id int not null auto_increment,
      title text,
      completed  TINYINT(1),
      primary key (id)
      );
 
