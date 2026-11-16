WITH performed_activities AS (
  SELECT first_name, last_name, activities.id FROM participants
    JOIN performed ON performed.participant_id = participants.id
    JOIN activities ON activities.id = performed.activity_id
) 
  SELECT first_name, last_name FROM performed_activities WHERE id = 1;


WITH event_activities AS (
    SELECT name, title FROM activities
    RIGHT JOIN events ON events.id = activities.event_id
)
SELECT name, COUNT(title) AS activities FROM event_activities
GROUP BY name;


SELECT name, role, first_name, last_name FROM events 
  JOIN joined ON joined.event_id = events.id
  JOIN participants ON participants.id = joined.participant_id
    WHERE name = 'Winter Camp 2025'
    ORDER BY last_name ASC;


SELECT participants.first_name, participants.last_name,
       activities.title, events.name AS event
FROM participants
JOIN performed ON participants.id = performed.participant_id
JOIN activities ON performed.activity_id = activities.id
JOIN events ON activities.event_id = events.id;


SELECT first_name, last_name FROM participants WHERE id IN (
  SELECT id FROM participants
  EXCEPT 
  SELECT DISTINCT(participant_id) FROM performed
);


SELECT first_name, last_name, COUNT(activity_id) AS act FROM participants 
  LEFT JOIN performed ON participants.id = performed.participant_id
    GROUP BY first_name, last_name
    ORDER BY act DESC, last_name;


SELECT first_name, last_name, title, year FROM participants
  JOIN responsibility ON participants.id = responsibility.participant_id
  JOIN departments ON departments.id = responsibility.department_id
    WHERE first_name = 'Andrii' AND last_name = 'Kovalenko'
    ORDER BY year ASC;


SELECT id FROM events
EXCEPT
SELECT DISTINCT(event_id) FROM activities;
    

SELECT first_name, last_name, TIMESTAMPDIFF(YEAR, participants.date_of_birth, events.start_date) AS age_at_event, events.name FROM participants
  JOIN joined ON participants.id = joined.participant_id 
  JOIN events ON events.id = joined.event_id
    WHERE participants.id = 1;


