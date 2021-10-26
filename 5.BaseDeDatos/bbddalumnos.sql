CREATE DATABASE clase;

CREATE TABLE alumno --Aunque en mysql se coloquen los nombres de los campos en minisculas en php debes ponerlo totalmente como lo enviaste
(
	NumeroAlumno tinyint unsigned NOT NULL PRIMARY KEY,
    Nombre varchar(60) NOT NULL,
    Repetir bit NOT NULL
);

INSERT INTO alumno
VALUES
	(2,'Juan',0),
    (4,'Maria',0),
    (6,'Roberto',1),
    (3,'Maider',1),
    (10,'Raul',0);

DROP DATABASE clase;
