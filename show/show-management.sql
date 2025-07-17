CREATE TABLE room(
   id_room SERIAL PRIMARY KEY NOT NULL,
   name VARCHAR(50) NOT NULL,
   addreass VARCHAR(50),
   phone_number INT,
   email VARCHAR(50),
   website VARCHAR(50),
);

CREATE TABLE show(
   id_show SERIAL PRIMARY KEY NOT NULL,
   name VARCHAR(50) NOT NULL,
   first_day DATE NOT NULL,
   last_day DATE NOT NULL,
   ticket_price DECIMAL(4,2) NOT NULL,
   type_of_show BOOLEAN NOT NULL,
   id_room INT NOT NULL,
   FOREIGN KEY(id_room) REFERENCES room(id_room)
);

CREATE TABLE performance(
   id_performance SERIAL PRIMARY KEY NOT NULL,
   start_time TIME NOT NULL,
   end_time TIME NOT NULL,
   id_performance INTEGER NOT NULL,
   FOREIGN KEY(id_performance) REFERENCES performance(id_performance)
);

CREATE TABLE booking(
   id_booking SERIAL PRIMARY KEY NOT NULL,
   date_ DATETIME NOT NULL,
   number_of_seats INT NOT NULL,
   total_price DECIMAL(4,2) NOT NULL,
   id_show INT NOT NULL,
   FOREIGN KEY(id_show) REFERENCES show(id_show)
);

CREATE TABLE spectator(
   id_spectator SERIAL PRIMARY KEY NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
);

CREATE TABLE actor(
   id_actor SERIAL PRIMARY KEY NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
);

CREATE TABLE technician(
   id_technician SERIAL PRIMARY KEY NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   job VARCHAR(50) NOT NULL,
);

CREATE TABLE spectator_booking(
   id_booking INT PRIMARY KEY,
   id_spectator INT PRIMARY KEY,
   FOREIGN KEY(id_booking) REFERENCES booking(id_booking),
   FOREIGN KEY(id_spectator) REFERENCES spectator(id_spectator)
);

CREATE TABLE actor_show(
   id_show INT PRIMARY KEY,
   id_actor INT PRIMARY KEY,
   FOREIGN KEY(id_show) REFERENCES show(id_show),
   FOREIGN KEY(id_actor) REFERENCES actor(id_actor)
);

CREATE TABLE technician_show(
   id_show INT PRIMARY KEY,
   id_technician INT PRIMARY KEY,
   FOREIGN KEY(id_show) REFERENCES show(id_show),
   FOREIGN KEY(id_technician) REFERENCES technician(id_technician)
);
