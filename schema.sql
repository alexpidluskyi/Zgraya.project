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
