-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;
\c outer_space

CREATE TABLE galaxy (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
); 

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxy ON DELETE CASCADE,
  orbits_around_sun BOOLEAN NOT NULL
); 

INSERT INTO galaxy (name)
VALUES
('Milky Way'),
('Andromeda');

INSERT INTO planets (name, galaxy_id, orbits_around_sun) 
VALUES 
('Earth', 1, true),
('Venus', 1, true),
('Mars', 1, true),
('Proxima Centauri b', 1, false);