CREATE TABLE general_manager(
   id_general_manager SERIAL PRIMARY KEY NOT NULL,
   serial_number INT NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   role VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   nationality VARCHAR(50),
   address VARCHAR(50),
   phone_number VARCHAR(50),
);

CREATE TABLE discipline(
   id_discipline SERIAL PRIMARY KEY NOT NULL,
   name VARCHAR(50) NOT NULL,
);

CREATE TABLE station(
   id_station SERIAL PRIMARY KEY NOT NULL,
   name VARCHAR(50) NOT NULL,
   altitude DECIMAL(5,2) NOT NULL,
);

CREATE TABLE manager(
   id_manager SERIAL PRIMARY KEY NOT NULL,
   id_general_manager INT NOT NULL UNIQUE,
   FOREIGN KEY(id_general_manager) REFERENCES general_manager(id_general_manager)
);

CREATE TABLE athlete(
   id_athlete SERIAL PRIMARY KEY NOT NULL,
   number INT NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   birthday DATE NOT NULL,
   phone_number VARCHAR(50),
   nationality VARCHAR(50) NOT NULL,
   country VARCHAR(50) NOT NULL,
);

CREATE TABLE event(
   id_event SERIAL PRIMARY KEY NOT NULL,
   alpha_code VARCHAR(2) NOT NULL,
   name VARCHAR(50) NOT NULL,
   round INT,
   id_discipline INT NOT NULL,
   id_station INT NOT NULL,
   FOREIGN KEY(id_discipline) REFERENCES discipline(id_discipline),
   FOREIGN KEY(id_station) REFERENCES station(id_station)
);

CREATE TABLE manager_event(
   id_general_manager INT PRIMARY KEY,
   id_event INT PRIMARY KEY,
   FOREIGN KEY(id_general_manager) REFERENCES general_manager(id_general_manager),
   FOREIGN KEY(id_event) REFERENCES event(id_event)
);

CREATE TABLE event_athlete(
   id_event INT PRIMARY KEY,
   id_athlete INT PRIMARY KEY,
   number INT NOT NULL,
   team BOOLEAN NOT NULL,
   time_ TIME,
   score DECIMAL(3,2),
   rank_ INT,
   medal VARCHAR(50),
   FOREIGN KEY(id_event) REFERENCES event(id_event),
   FOREIGN KEY(id_athlete) REFERENCES athlete(id_athlete)
);