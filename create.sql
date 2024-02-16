BEGIN;

CREATE TYPE SEX as ENUM ('M', 'F');
CREATE TYPE KIND as ENUM ('Capsule', 'Millennium Falcon');

CREATE TABLE person (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  surname VARCHAR(255) NOT NULL,
  sex SEX NOT NULL
);

CREATE TABLE action (
  id SERIAL PRIMARY KEY,
  person_id INT NOT NULL REFERENCES person(id),
  description VARCHAR(511) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE thought (
  id SERIAL PRIMARY KEY,
  person_id INT NOT NULL REFERENCES person(id),
  content VARCHAR(511) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE astronaut (
  id SERIAL PRIMARY KEY,
  person_id INT NOT NULL REFERENCES person(id)
);

CREATE TABLE location (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  coordinates POINT
);

CREATE TABLE spaceship (
  id SERIAL PRIMARY KEY,
  kind KIND NOT NULL,
  has_satellite BOOLEAN DEFAULT TRUE
);

CREATE TABLE flight (
  id SERIAL PRIMARY KEY,
  destination_id INT NOT NULL REFERENCES location(id),
  spaceship_id INT NOT NULL REFERENCES spaceship(id),
  launch_time TIMESTAMP DEFAULT NOW()
);

CREATE TABLE flight_astronaut (
  id SERIAL PRIMARY KEY,
  astronaut_id INT NOT NULL REFERENCES astronaut(id),
  flight_id INT NOT NULL REFERENCES flight(id),
  is_on_board BOOLEAN DEFAULT TRUE
);

COMMIT;