BEGIN;

INSERT INTO person(name, surname, sex)
VALUES ('Дэвид', 'Боумэн', 'M'),
       ('Фрэнк', 'Пул', 'M');


INSERT INTO action(person_id, description)
VALUES (1, 'Долго сидел'),
       (1, 'Уставился в путоту');

INSERT INTO thought(person_id, content, emotion)
VALUES (1, 'Фрэнк Пул первым из людей попадет на Сатурн', 'Грусть');

INSERT INTO astronaut(person_id, rank)
VALUES (1, 'Капитан'), (2, 'Штурман');

INSERT INTO location(name, coordinates, first_astronaut_id)
VALUES ('Сатурн', POINT(214124, 98782178), 2);

INSERT INTO spaceship(kind)
VALUES ('Capsule');

INSERT INTO flight(destination_id, spaceship_id, launch_time)
VALUES (1, 1, NOW() - INTERVAL '10 minutes');

INSERT INTO flight_astronaut(astronaut_id, flight_id, is_on_board)
VALUES (1, 1, FALSE),
       (2, 1, TRUE);

COMMIT;