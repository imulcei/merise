CREATE TABLE team(
   id_team SERIAL PRIMARY KEY NOT NULL,
   name VARCHAR(50) NOT NULL,
   creation_date DATE NOT NULL,
);

CREATE TABLE player(
   id_joueur SERIAL PRIMARY KEY NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   birthday DATE NOT NULL,
   id_team INT NOT NULL,
   FOREIGN KEY(id_team) REFERENCES team(id_team)
);

CREATE TABLE referee(
   id_referee SERIAL PRIMARY KEY NOT NULL,
   number INT NOT NULL,
   last_name INT NOT NULL,
   first_name INT NOT NULL,
);

CREATE TABLE match_(
   id_match SERIAL PRIMARY KEY NOT NULL,
   match_date DATE NOT NULL,
   start_of_the_match DATE NOT NULL,
   match_result INT NOT NULL,
   id_referee INT NOT NULL,
   FOREIGN KEY(id_referee) REFERENCES referee(id_referee)
);

CREATE TABLE team_match(
   id_team INT PRIMARY KEY,
   id_match INT PRIMARY KEY,
   FOREIGN KEY(id_team) REFERENCES team(id_team),
   FOREIGN KEY(id_match) REFERENCES match_(id_match)
);
