DROP VIEW IF EXISTS `activity_performers`;
DROP VIEW IF EXISTS `event_roster`;

DROP TABLE IF EXISTS `responsibility`;
DROP TABLE IF EXISTS `performed`;
DROP TABLE IF EXISTS `joined`;
DROP TABLE IF EXISTS `activities`;
DROP TABLE IF EXISTS `departments`;
DROP TABLE IF EXISTS `events`;
DROP TABLE IF EXISTS `participants`;


CREATE TABLE `participants` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `date_of_birth` DATE NOT NULL,
    `current_role` ENUM('participant', 'emissary', 'organizer', 'guest', 'inactive') NOT NULL DEFAULT 'participant',
    `gender` ENUM('female', 'male', 'other') DEFAULT NULL,
    `home` VARCHAR(64) DEFAULT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `events` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(128) NOT NULL,
    `topic` VARCHAR(128) NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    `type` ENUM('online', 'offline') NOT NULL,
    `season` ENUM('winter', 'spring', 'summer', 'autumn') NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `year` YEAR GENERATED ALWAYS AS (YEAR(`start_date`)) STORED,
    PRIMARY KEY (`id`),
    CHECK (`end_date` >= `start_date`)
);

CREATE TABLE `departments` (
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR(50) NOT NULL,
    `year` YEAR NOT NULL,
    `type` ENUM('online', 'offline') NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`title`, `year`)
);

CREATE TABLE `activities` (
    `id` INT AUTO_INCREMENT,
    `event_id` INT NOT NULL,
    `title` VARCHAR(100) NOT NULL,
    `topic` VARCHAR(64) NOT NULL,
    `aim` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`event_id`, `title`),
    FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
);

CREATE TABLE `joined` (
    `id` INT AUTO_INCREMENT,
    `participant_id` INT NOT NULL,
    `event_id` INT NOT NULL,
    `role` ENUM('participant', 'emissary', 'organizer', 'guest') NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE (`participant_id`, `event_id`),
    FOREIGN KEY (`participant_id`) REFERENCES `participants` (`id`),
    FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
);

CREATE TABLE `performed` (
    `id` INT AUTO_INCREMENT,
    `participant_id` INT NOT NULL,
    `activity_id` INT NOT NULL,
    `moderator_role` ENUM('lead', 'assistant') NOT NULL DEFAULT 'lead',
    PRIMARY KEY (`id`),
    UNIQUE (`participant_id`, `activity_id`),
    FOREIGN KEY (`participant_id`) REFERENCES `participants` (`id`),
    FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`)
);

CREATE TABLE `responsibility` (
    `id` INT AUTO_INCREMENT,
    `participant_id` INT NOT NULL,
    `department_id` INT NOT NULL,
    `position` ENUM('head', 'member') NOT NULL DEFAULT 'member',
    PRIMARY KEY (`id`),
    UNIQUE (`participant_id`, `department_id`),
    FOREIGN KEY (`participant_id`) REFERENCES `participants` (`id`),
    FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
);

CREATE VIEW event_roster AS (
    SELECT first_name, last_name, role, events.name FROM participants
      JOIN joined ON participants.id = joined.participant_id
      JOIN events ON events.id = joined.event_id
        ORDER BY events.name ASC
);

CREATE VIEW activity_performers AS (
    SELECT first_name, last_name, moderator_role, activities.title FROM participants
      JOIN performed ON participants.id = performed.participant_id
      JOIN activities ON activities.id = performed.activity_id
        ORDER BY activities.title ASC
);