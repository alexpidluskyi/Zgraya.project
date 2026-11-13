EXPLAIN
SELECT first_name, last_name FROM participants
  JOIN performed ON performed.participant_id = participants.id
  JOIN activities ON activities.id = performed.activity_id
    WHERE title = 'Intro to photo editing'
;