
CREATE SCHEMA `task_tracker` ;

CREATE TABLE `task_tracker`.`tasks` (
  `idtasks` INT NOT NULL AUTO_INCREMENT COMMENT 'The id for the task',
  `description` VARCHAR(255) NULL COMMENT 'Description of the task',
  PRIMARY KEY (`idtasks`),
  UNIQUE INDEX `idtasks_UNIQUE` (`idtasks` ASC))
COMMENT = 'Table to store tasks';

ALTER TABLE `task_tracker`.`tasks` 
ADD COLUMN `category1` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Can be used to store anything really' AFTER `description`,
ADD COLUMN `category2` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Can be used to store anything really' AFTER `category1`;



CREATE TABLE `task_tracker`.`times` (
  `idtimes` INT NOT NULL AUTO_INCREMENT,
  `taskId` INT NULL COMMENT 'Foreign Key to associate a Task 1 or many times',
  PRIMARY KEY (`idtimes`),
  UNIQUE INDEX `idtimes_UNIQUE` (`idtimes` ASC),
  INDEX `taskId_idx` (`taskId` ASC),
  CONSTRAINT `taskId`
    FOREIGN KEY (`taskId`)
    REFERENCES `task_tracker`.`tasks` (`idtasks`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Table to keep track of the times associated with tasks';



INSERT INTO `task_tracker`.`tasks`
(`idtasks`,
`description`)
VALUES
(1,
'build the tables');



INSERT INTO `task_tracker`.`tasks`
(`idtasks`,
`description`)
VALUES
(2,
'Make Request from node-mysql-client, inside an Expressive RequestHandler');
