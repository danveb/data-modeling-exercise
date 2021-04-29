-- $ psql < medical_center.pgsql
-- $ psql 
-- \c medical_center_db

DROP DATABASE medical_center_db; 
CREATE DATABASE medical_center_db; 
\c medical_center_db

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY, 
    full_name VARCHAR(30) NOT NULL,
    field TEXT, 
    years_experience INTEGER DEFAULT 1,
    is_active BOOLEAN DEFAULT true
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(20) NOT NULL, 
    dob TEXT NOT NULL, 
    insurance BOOLEAN DEFAULT true
);

CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    doctors_id INTEGER REFERENCES doctors ON DELETE CASCADE, 
    patients_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    date TEXT NOT NULL
);

CREATE TABLE diagnostic (
    id SERIAL PRIMARY KEY,
    appointments_id INTEGER REFERENCES appointments ON DELETE CASCADE,
    disease TEXT NOT NULL
);

-- Add data to "doctors"
INSERT INTO doctors (full_name, field, years_experience, is_active)
VALUES 
('John Hancock', 'Neurosurgeon', 15, true),
('Jamie Kim', 'OBGYN', 5, true), 
('Paul Lopez', 'Pediatrics', 7, false);

-- Add data to "patients"
INSERT INTO patients (full_name, dob, insurance)
VALUES 
('David Seeger', '07-10-1980', true),
('Justina Park', '04-08-1992', true),
('Kacy House', '03-12-1981', true); 

-- Add data to "appointments"
INSERT INTO appointments (doctors_id, patients_id, date)
VALUES 
(1, 3, '05-05-2021'), 
(1, 1, '07-15-2021'),
(2, 2, '06-18-2021'); 

-- Add data to "diagnostic"
INSERT INTO diagnostic (appointments_id, disease)
VALUES 
(1, 'Cell Tumor'),
(2, 'Brain Tumor'),
(3, 'Infection'); 

-- -- Check table
-- SELECT * FROM doctors; 

--  id |  full_name   |    field     | years_experience | is_active 
-- ----+--------------+--------------+------------------+-----------
--   1 | John Hancock | Neurosurgeon |               15 | t
--   2 | Jamie Kim    | OBGYN        |                5 | t
--   3 | Paul Lopez   | Pediatrics   |                7 | f
-- (3 rows)

-- SELECT * FROM patients; 

--  id |  full_name   |    dob     | insurance 
-- ----+--------------+------------+-----------
--   1 | David Seeger | 07-10-1980 | t
--   2 | Justina Park | 04-08-1992 | t
--   3 | Kacy House   | 03-12-1981 | t
-- (3 rows)

-- SELECT * FROM appointments; 

--  id | doctors_id | patients_id |    date    
-- ----+------------+-------------+------------
--   1 |          1 |           3 | 05-05-2021
--   2 |          1 |           1 | 07-15-2021
--   3 |          2 |           2 | 06-18-2021
-- (3 rows)

-- SELECT * FROM diagnostic;

--  id | appointments_id |   disease   
-- ----+-----------------+-------------
--   1 |               1 | Cell Tumor
--   2 |               2 | Brain Tumor
--   3 |               3 | Infection
-- (3 rows)

-- Delete an appointment?

-- DELETE FROM appointments WHERE patients_id = 1; 

-- SELECT * FROM appointments;

--  id | doctors_id | patients_id |    date    
-- ----+------------+-------------+------------
--   1 |          1 |           3 | 05-05-2021
--   3 |          2 |           2 | 06-18-2021
-- (2 rows)