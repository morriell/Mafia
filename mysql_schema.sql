use mafia;

CREATE TABLE `Players` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(40) NOT NULL,
	`avalible` BINARY NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Roles` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`description` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `PlaySet` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`player` INT NOT NULL,
	`role` INT NOT NULL,
	`state` INT NOT NULL,
	`code` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `States` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Phases` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(30) NOT NULL UNIQUE,
	`active` BINARY NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Actions` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(80) NOT NULL,
	`description` TEXT(500) NOT NULL,
	`rapid` BINARY NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `PhasesAndActions` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`role` INT NOT NULL,
	`action` INT NOT NULL,
	`phase` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Fractions` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(30) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `FractionsAndRoles` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`role` INT NOT NULL,
	`fraction` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Requests` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`palyer` INT NOT NULL,
	`action` INT NOT NULL,
	`victim` INT NOT NULL,
	`status` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `PlaySet` ADD CONSTRAINT `PlaySet_fk0` FOREIGN KEY (`player`) REFERENCES `Players`(`id`);

ALTER TABLE `PlaySet` ADD CONSTRAINT `PlaySet_fk1` FOREIGN KEY (`role`) REFERENCES `Roles`(`id`);

ALTER TABLE `PlaySet` ADD CONSTRAINT `PlaySet_fk2` FOREIGN KEY (`state`) REFERENCES `States`(`id`);

ALTER TABLE `PhasesAndActions` ADD CONSTRAINT `PhasesAndActions_fk0` FOREIGN KEY (`role`) REFERENCES `Roles`(`id`);

ALTER TABLE `PhasesAndActions` ADD CONSTRAINT `PhasesAndActions_fk1` FOREIGN KEY (`action`) REFERENCES `Actions`(`id`);

ALTER TABLE `PhasesAndActions` ADD CONSTRAINT `PhasesAndActions_fk2` FOREIGN KEY (`phase`) REFERENCES `Phases`(`id`);

ALTER TABLE `FractionsAndRoles` ADD CONSTRAINT `FractionsAndRoles_fk0` FOREIGN KEY (`role`) REFERENCES `Roles`(`id`);

ALTER TABLE `FractionsAndRoles` ADD CONSTRAINT `FractionsAndRoles_fk1` FOREIGN KEY (`fraction`) REFERENCES `Fractions`(`id`);

ALTER TABLE `Requests` ADD CONSTRAINT `Requests_fk0` FOREIGN KEY (`palyer`) REFERENCES `Players`(`id`);

ALTER TABLE `Requests` ADD CONSTRAINT `Requests_fk1` FOREIGN KEY (`action`) REFERENCES `Actions`(`id`);

ALTER TABLE `Requests` ADD CONSTRAINT `Requests_fk2` FOREIGN KEY (`victim`) REFERENCES `Players`(`id`);


