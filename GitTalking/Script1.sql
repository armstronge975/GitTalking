--<ScriptOptions statementTerminator=";"/>

ALTER TABLE `database`.`local_repsitory` DROP PRIMARY KEY;

ALTER TABLE `database`.`groups` DROP PRIMARY KEY;

ALTER TABLE `database`.`private_message` DROP PRIMARY KEY;

ALTER TABLE `database`.`timeline` DROP PRIMARY KEY;

ALTER TABLE `database`.`users` DROP PRIMARY KEY;

ALTER TABLE `database`.`standard_users` DROP PRIMARY KEY;

ALTER TABLE `database`.`public_message` DROP PRIMARY KEY;

ALTER TABLE `database`.`master_repository` DROP PRIMARY KEY;

ALTER TABLE `database`.`projects` DROP PRIMARY KEY;

ALTER TABLE `database`.`admin_user` DROP PRIMARY KEY;

ALTER TABLE `database`.`messages` DROP PRIMARY KEY;

DROP TABLE `database`.`messages`;

DROP TABLE `database`.`admin_user`;

DROP TABLE `database`.`groups`;

DROP TABLE `database`.`timeline`;

DROP TABLE `database`.`standard_users`;

DROP TABLE `database`.`public_message`;

DROP TABLE `database`.`projects`;

DROP TABLE `database`.`users`;

DROP TABLE `database`.`local_repsitory`;

DROP TABLE `database`.`private_message`;

DROP TABLE `database`.`master_repository`;

CREATE TABLE `database`.`messages` (
	`message_id` INT NOT NULL,
	`message_type` VARCHAR(45),
	`public` VARCHAR(45),
	`message_content` VARCHAR(45),
	`pri_id` VARCHAR(45),
	PRIMARY KEY (`message_id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`admin_user` (
	`user_id` INT NOT NULL,
	`admin_firstname` VARCHAR(45),
	`admin_lastname` VARCHAR(45),
	PRIMARY KEY (`user_id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`groups` (
	`group_id` INT NOT NULL,
	`group_name` VARCHAR(45),
	PRIMARY KEY (`group_id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`timeline` (
	`timeline_id` INT NOT NULL,
	`timeline_content` VARCHAR(45),
	PRIMARY KEY (`timeline_id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`standard_users` (
	`user_id` INT NOT NULL,
	`first_name` VARCHAR(45),
	`last_name` VARCHAR(45),
	`permissions` VARCHAR(45),
	PRIMARY KEY (`user_id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`public_message` (
	`pub_id` INT NOT NULL,
	`public_messagecontent` VARCHAR(45),
	PRIMARY KEY (`pub_id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`projects` (
	`project_id` INT NOT NULL,
	`project_name` VARCHAR(45),
	`status` VARCHAR(45),
	PRIMARY KEY (`project_id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`users` (
	`user_id` INT NOT NULL,
	PRIMARY KEY (`user_id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`local_repsitory` (
	`localrepsitory_id` INT NOT NULL,
	`open_cases` VARCHAR(45),
	`push_request` VARCHAR(45),
	`pull_request` VARCHAR(45),
	PRIMARY KEY (`localrepsitory_id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`private_message` (
	`priv_id` INT NOT NULL,
	`private_messagecontent` VARCHAR(45),
	PRIMARY KEY (`priv_id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`master_repository` (
	`mastreposit_id` INT NOT NULL,
	`push_request` VARCHAR(45),
	`pull_request` VARCHAR(45),
	`open_cases` VARCHAR(45),
	`URL` VARCHAR(45),
	PRIMARY KEY (`mastreposit_id`)
) ENGINE=InnoDB;

