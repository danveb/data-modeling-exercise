-- $ psql < soccer_league.pgsql
-- $ psql 
-- \c soccer_league_db

DROP DATABASE soccer_league_db; 
CREATE DATABASE soccer_league_db; 
\c soccer_league_db

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(30) NOT NULL,
    teams_id INTEGER REFERENCES teams ON DELETE CASCADE,
    games_played INTEGER DEFAULT 0,
    goals_scored INTEGER
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(30) NOT NULL
);

CREATE TABLE game_1 (
    id SERIAL PRIMARY KEY,
    game_date TEXT NOT NULL,
    home_team_id INTEGER REFERENCES teams ON DELETE CASCADE,    
    away_team_id INTEGER REFERENCES teams ON DELETE CASCADE,
    referees_id INTEGER REFERENCES referees ON DELETE CASCADE
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    players_id INTEGER REFERENCES players ON DELETE CASCADE,
    goals INTEGER NOT NULL
);

CREATE TABLE league_schedule (
    id SERIAL PRIMARY KEY,
    begin_season TEXT NOT NULL,
    end_season TEXT NOT NULL
); 

INSERT INTO teams (name)
VALUES 
('River Plate'),
('Boca Juniors'), 
('San Lorenzo');

INSERT INTO players (full_name, teams_id, games_played, goals_scored)
VALUES 
('Ariel Ortega', 1, 0, 1),
('Marcelo Gallardo', 1, 1, 2),
('Roman Riquelme', 2, 1, 1),
('Martin Palermo', 2, 1, 4),
('Pipi Romagnoli', 3, 0, 1);

INSERT INTO referees (full_name)
VALUES 
('Pablo Fontana'), 
('Patricio Lousteau');

INSERT INTO game_1 (game_date, home_team_id, away_team_id, referees_id) 
VALUES
('03-10-2021', 1, 2, 1); 

INSERT INTO league_schedule (begin_season, end_season)
VALUES
('03-10-2021', '05-25-2021');