-- $ psql < craigslist.pgsql
-- $ psql 
-- \c craigslist_db

DROP DATABASE craigslist_db; 
CREATE DATABASE craigslist_db; 
\c craigslist_db

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    region_id INTEGER REFERENCES region ON DELETE CASCADE
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY, 
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    location TEXT NOT NULL,
    region_id INTEGER REFERENCES region ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE CASCADE
);

INSERT INTO region (name)
VALUES 
('San Francisco'),
('Atlanta'),
('Seattle'), 
('LA');

INSERT INTO users (username, region_id)
VALUES 
('chicken123', 1),
('dog055', 1),
('catlady77', 2), 
('officeticket1', 3),
('dramaqueen33', 4);

INSERT INTO categories (name)
VALUES
('Gaming'),
('Programming'),
('TV Drama'),
('Cooking');

INSERT INTO posts (title, user_id, location, region_id, category_id) 
VALUES
('A tale of 2 dragons', 1, '39-31', 1, 2),
('How to SQL', 2, '39-17', 1, 3), 
('Montecristo is here', 3, '77-09', 2, 1),
('10 ways to cook', 4, '16-66', 3, 1);