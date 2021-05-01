-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;
\c air_traffic

CREATE TABLE airline (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE passenger (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL
);

CREATE TABLE origin (
  id SERIAL PRIMARY KEY,
  from_city_country TEXT NOT NULL
);

CREATE TABLE destination (
  id SERIAL PRIMARY KEY,
  to_city_country TEXT NOT NULL
);

CREATE TABLE reservation (
  id SERIAL PRIMARY KEY,
  first_name_id INTEGER REFERENCES passenger NOT NULL,
  last_name_id INTEGER REFERENCES passenger NOT NULL,
  seat TEXT NOT NULL,
  name_id INTEGER REFERENCES airline NOT NULL
); 

CREATE TABLE schedule (
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL, 
  airline_id INTEGER REFERENCES airline ON DELETE CASCADE,
  from_city_country_id INTEGER REFERENCES origin ON DELETE CASCADE,
  to_city_country_id INTEGER REFERENCES destination ON DELETE CASCADE
);


INSERT INTO airline (name)
VALUES 
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'), 
('Air China'),
('American Airlines'), 
('Avianca Brasil'); 

INSERT INTO passenger (first_name, last_name)
VALUES 
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'), 
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'), 
('Alvin', 'Leathes'), 
('Cory', 'Squibbes'); 

INSERT INTO origin (from_city_country)
VALUES 
('Washington DC, USA'),
('Tokyo, Japan'), 
('Los Angeles, USA'),
('Seattle, USA'),
('Paris, France'),
('Sao Paulo, Brazil'),
('New York, USA'),
('Dubai, UAE'); 

INSERT INTO destination (to_city_country)
VALUES
('Seattle, USA'),
('London, UK'),
('Las Vegas, USA'),
('Mexico City, Mexico'),
('Casablanca, Morocco'),
('Beijing, China'),
('Charlotte, USA'),
('Chicago, USA'),
('Santiago, Chile'); 

INSERT INTO reservation (first_name_id, last_name_id, seat, name_id)
VALUES 
(1, 1, '33B', 1),
(2, 2, '8A', 2),
(3, 3, '12F', 3),
(4, 4, '18C', 5);

INSERT INTO schedule (departure, arrival, airline_id, from_city_country_id, to_city_country_id) 
VALUES 
('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1),
('2018-04-08 16:00:00', '2018-04-09 12:00:00', 2, 2, 2),
('2018-04-08 16:30:00', '2018-04-08 17:40:00', 3, 3, 3);


-- CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,
--   last_name TEXT NOT NULL,
--   seat TEXT NOT NULL,
--   departure TIMESTAMP NOT NULL,
--   arrival TIMESTAMP NOT NULL,
--   airline TEXT NOT NULL,
--   from_city TEXT NOT NULL,
--   from_country TEXT NOT NULL,
--   to_city TEXT NOT NULL,
--   to_country TEXT NOT NULL
-- );

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');