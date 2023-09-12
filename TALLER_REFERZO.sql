CREATE TABLE Estudiantes (
	ID INT PRIMARY KEY,
  	NAME VARCHAR(100),
  	AGE INT,
  	GRADE VARCHAR(50)
);
CREATE TABLE Docentes (
	ID INT PRIMARY KEY,
  	NAME VARCHAR(100),
  	AGE INT,
  	SUBJECT VARCHAR(100)
);
CREATE TABLE Cursos (
	ID INT PRIMARY KEY,
	nombre_curso VARCHAR(100),
  	horario VARCHAR(100)
);
CREATE TABLE Notas (
	ID INT PRIMARY KEY,
	ID_estudiante INT,
	ID_curso INT,
	puntuacion INT,
  	FOREIGN KEY (ID_estudiante)
  	REFERENCES 	estudiantes (id),
  	FOREIGN KEY (ID_curso)
  	REFERENCES cursos (id)
);
-- 1
SELECT name FROM estudiantes
order by NAME
limit 5;
-- 2
SELECT name FROM docentes
order by subject;
-- 3
SELECT cursos.nombre_curso, AVG(notas.puntuacion) from notas LEFT JOIN cursos
ON notas.id_curso = cursos.id
GROUP BY cursos.nombre_curso;
-- 4
SELECT name, age from estudiantes
WHERE age BETWEEN 15 AND 18;
-- 5
SELECT nombre_curso from cursos
WHERE nombre_curso in ('Matemáticas', 'Ciencias');
-- 6
SELECT name from estudiantes
WHERE NAME LIKE 'A%';
-- 7
SELECT estudiantes.name, AVG(notas.puntuacion) AS nota from estudiantes LEFT JOIN notas
ON estudiantes.id = notas.id_estudiante
GROUP BY estudiantes.name, notas.puntuacion
HAVING notas.puntuacion >= 80;
-- 8
SELECT estudiantes.name, notas.puntuacion AS nota from estudiantes LEFT JOIN notas
ON estudiantes.id = notas.id_estudiante;
-- 9
SELECT e.name FROM
(SELECT * FROM estudiantes ORDER BY age limit 10) e
ORDER BY e.age DESC;
-- 10
SELECT grade, COUNT(ID) FROM estudiantes
GROUP BY grade;
-- 11
SELECT name, age FROM estudiantes
WHERE age BETWEEN 16 and 18
ORDER BY name;
-- 12
SELECT Cursos.nombre_curso, COUNT(Notas.ID_estudiante) FROM Notas LEFT JOIN Cursos
ON Notas.ID_curso = Cursos.ID
GROUP BY Cursos.nombre_curso;
-- 13
SELECT name, AGE FROM estudiantes
WHERE name LIKE '%a%'
order by age;
-- 14
select cursos.nombre_curso, COUNT(notas.id_estudiante) AS cantidad_estudiantes, avg(notas.puntuacion) as promedio
from notas left join cursos
ON notas.id_curso = cursos.id
group by cursos.nombre_curso, notas.id_estudiante, notas.puntuacion
HAVING notas.puntuacion >= 75 AND notas.id_estudiante > 5;
-- 15
SELECT estudiantes.name, notas.puntuacion AS nota from estudiantes LEFT JOIN notas
ON estudiantes.id = notas.id_estudiante
WHERE estudiantes.age > 17;
-- 16
SELECT name, age AS nota from estudiantes
WHERE age < 14 OR age > 18;
-- 17
SELECT name, subject from docentes
WHERE subject NOT LIKE 'Matemáticas';
-- 18
SELECT name, age, grade from estudiantes
WHERE age BETWEEN 15 AND 17 AND grade LIKE 'grado 10°';
-- 19
SELECT name from estudiantes
WHERE name LIKE 'J%' OR name LIKE '%a';
-- 20
SELECT name, subject from docentes
WHERE subject IN ('Matemáticas', 'Ciencias') AND age < 35;

