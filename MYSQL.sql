CREATE DATABASE student_db;
USE student_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (student_id, name, age) VALUES
(1, 'Elham', 23),
(2, 'Bob Johnson', 21),
(3, 'Abed', 21);
(4, 'Noor', 25);


INSERT INTO courses (course_id, name) VALUES
(1, ' Mathematics'),
(2, 'JAVA');

INSERT INTO enrollments (student_id, course_id, grade) VALUES
(1, 1, 'A'),
(2, 1, 'C'),
(3, 2, 'C');
(4, 2, 'B');

SELECT s.name
FROM students s;

SELECT c.name
FROM courses c;
SELECT s.name , c.name , e.grade 
FROM students s 
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

SELECT s.name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.name = 'JAVA';

UPDATE enrollments
SET grade = 'A-'
WHERE student_id = 2 AND course_id = 1;

DELETE FROM students
WHERE age < 21;
