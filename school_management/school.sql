CREATE TABLE classroom(
   id_classroom SERIAL PRIMARY KEY NOT NULL,
   number INT NOT NULL,
   capacity INT NOT NULL,
);

CREATE TABLE subject(
   id_subject SERIAL PRIMARY KEY NOT NULL,
   name VARCHAR(50) NOT NULL,
);

CREATE TABLE class(
   id_class SERIAL PRIMARY KEY NOT NULL,
   name VARCHAR(50) NOT NULL,
   grade VARCHAR(50) NOT NULL,
   id_classroom INT NOT NULL UNIQUE,
   FOREIGN KEY(id_classroom) REFERENCES classroom(id_classroom)
);

CREATE TABLE teacher(
   id_teacher SERIAL PRIMARY KEY NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   id_subject INT,
   FOREIGN KEY(id_subject) REFERENCES subject(id_subject)
);

CREATE TABLE student(
   id_student SERIAL PRIMARY KEY NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   id_class INT NOT NULL,
   FOREIGN KEY(id_class) REFERENCES class(id_class)
);

CREATE TABLE class_subject(
   id_class PRIMARY KEY,
   id_subject PRIMARY KEY,
   FOREIGN KEY(id_class) REFERENCES class(id_class),
   FOREIGN KEY(id_subject) REFERENCES subject(id_subject)
);

CREATE TABLE student_subject(
   id_subject PRIMARY KEY,
   id_student PRIMARY KEY,
   mark DECIMAL(2,2),
   FOREIGN KEY(id_subject) REFERENCES subject(id_subject),
   FOREIGN KEY(id_student) REFERENCES student(id_student)
);
