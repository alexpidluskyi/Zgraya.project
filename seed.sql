INSERT INTO `participants` (`id`, `first_name`, `last_name`, `date_of_birth`, `current_role`, `gender`, `home`) VALUES
(1, 'Olena', 'Marchuk', '1998-03-14', 'organizer', 'female', 'Kyiv'),
(2, 'Taras', 'Bondar', '1999-07-02', 'organizer', 'male', 'Lviv'),
(3, 'Iryna', 'Savchenko', '2001-11-21', 'organizer', 'female', 'Chernivtsi'),
(4, 'Andrii', 'Kovalenko', '2003-05-09', 'emissary', 'male', 'Kyiv'),
(5, 'Maria', 'Petrenko', '2008-09-30', 'emissary', 'female', 'Lviv'),
(6, 'Danylo', 'Tkachenko', '2009-01-17', 'participant', 'male', 'Odesa'),
(7, 'Sofiia', 'Melnyk', '2010-06-25', 'participant', 'female', 'Kyiv'),
(8, 'Max', 'Hrytsenko', '2007-12-04', 'participant', NULL, NULL),
(9, 'Viktor', 'Lysenko', '1985-04-12', 'guest', 'male', 'Kharkiv'),
(10, 'Nadiia', 'Shevchuk', '2002-08-19', 'inactive', 'female', 'Lviv');

INSERT INTO `events` (`id`, `name`, `topic`, `location`, `type`, `season`, `start_date`, `end_date`) VALUES
(1, 'Winter Camp 2025', 'Teamwork and games', 'Carpathians', 'offline', 'winter', '2025-01-04', '2025-01-11'),
(2, 'Summer Camp 2025', 'Nature and ecology', 'Carpathians', 'offline', 'summer', '2025-07-05', '2025-07-18'),
(3, 'Online Autumn School 2025', 'Digital skills', 'Online', 'online', 'autumn', '2025-10-10', '2025-10-12'),
(4, 'Winter Camp 2026', 'Creativity', 'Carpathians', 'offline', 'winter', '2026-01-03', '2026-01-10');

INSERT INTO `departments` (`id`, `title`, `year`, `type`) VALUES
(1, 'Logistics', 2025, 'offline'),
(2, 'Logistics', 2026, 'offline'),
(3, 'Facilitation', 2025, 'offline'),
(4, 'Media', 2025, 'online'),
(5, 'Media', 2026, 'online');

INSERT INTO `activities` (`id`, `event_id`, `title`, `topic`, `aim`) VALUES
(1, 1, 'Orienteering workshop', 'Navigation', 'Learn to use a map and compass'),
(2, 1, 'Evening storytelling', 'Culture', 'Practise public speaking'),
(3, 2, 'River ecology lecture', 'Ecology', 'Understand local water ecosystems'),
(4, 2, 'Campfire songs workshop', 'Music', NULL),
(5, 2, 'First aid basics', 'Safety', 'Learn basic first aid skills'),
(6, 3, 'Intro to photo editing', 'Media', 'Edit a photo step by step'),
(7, 3, 'Online quiz night', 'Games', NULL);

INSERT INTO `joined` (`participant_id`, `event_id`, `role`) VALUES
(1, 1, 'organizer'), (2, 1, 'organizer'), (3, 1, 'emissary'), (4, 1, 'emissary'),
(5, 1, 'participant'), (6, 1, 'participant'), (10, 1, 'participant'),
(1, 2, 'organizer'), (2, 2, 'organizer'), (3, 2, 'emissary'), (4, 2, 'emissary'),
(5, 2, 'participant'), (6, 2, 'participant'), (7, 2, 'participant'), (8, 2, 'participant'), (9, 2, 'guest'),
(1, 3, 'organizer'), (3, 3, 'emissary'), (5, 3, 'participant'), (7, 3, 'participant'),
(1, 4, 'organizer'), (3, 4, 'organizer'), (4, 4, 'emissary'), (5, 4, 'emissary'),
(6, 4, 'participant'), (7, 4, 'participant');

INSERT INTO `performed` (`participant_id`, `activity_id`, `moderator_role`) VALUES
(3, 1, 'lead'), (4, 1, 'assistant'),
(4, 2, 'lead'),
(9, 3, 'lead'), (3, 3, 'assistant'),
(2, 4, 'lead'),
(4, 5, 'lead'),
(1, 6, 'lead'),
(3, 7, 'lead'), (7, 7, 'assistant');

INSERT INTO `responsibility` (`participant_id`, `department_id`, `position`) VALUES
(2, 1, 'head'), (4, 1, 'member'),
(2, 2, 'head'), (4, 2, 'member'),
(3, 3, 'head'), (6, 3, 'head'), (5, 3, 'member'),
(1, 4, 'head'),
(4, 5, 'member');