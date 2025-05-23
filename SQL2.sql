CREATE TABLE department (
    dept_id DECIMAL(10, 0),
    name VARCHAR(40)
);

CREATE TABLE instructor (
    instructor_id DECIMAL(10, 0),
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    type VARCHAR(40),
    dep_id DECIMAL(10, 0)
);

CREATE TABLE schedule (
    schedule_id DECIMAL(10, 0),
    course_id DECIMAL(10, 0),
    section_id DECIMAL(10, 0),
    instructor_id DECIMAL(10, 0),
    day VARCHAR(20),
    starttime TIME,
    endtime TIME
);

CREATE TABLE course (
    course_id DECIMAL(10, 0),
    name VARCHAR(40),
    dept_id DECIMAL(10, 0),
    term VARCHAR(10)
);

CREATE TABLE section (
    section_id DECIMAL(10, 0),
    course_id DECIMAL(10, 0),
    schedule_id DECIMAL(10, 0),
    instructor_id DECIMAL(10, 0),
    room VARCHAR(20)
);

CREATE TABLE student (
    student_id DECIMAL(10, 0),
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE registration (
    reg_id DECIMAL(10, 0),
    student_id DECIMAL(10, 0),
    section_id DECIMAL(10, 0),
    reg_date DATE,
    status VARCHAR(10),
    midterm_grade VARCHAR(10),
    fullterm_grade VARCHAR(10)
);


-- Department
INSERT INTO department VALUES 
(1, 'Computer Science'),
(2, 'Mathematics');

-- Instructors
INSERT INTO instructor VALUES
(101, 'John', 'Doe', 'Full-Time', 1),
(102, 'Jane', 'Smith', 'Part-Time', 2),
(103, 'Alice', 'Brown', 'Full-Time', 1);

-- Courses
INSERT INTO course VALUES
(201, 'Data Structures', 1, 'Fall'),
(202, 'Calculus', 2, 'Spring');

-- Schedule
INSERT INTO schedule VALUES
(301, 201, 401, 101, 'Monday', '09:00:00', '10:00:00'),
(302, 201, 401, 101, 'Wednesday', '09:00:00', '10:00:00'),
(303, 202, 402, 102, 'Tuesday', '10:00:00', '11:00:00'),
(304, 202, 402, 102, 'Thursday', '10:00:00', '11:00:00'),
(305, 201, 403, 103, 'Friday', '08:00:00', '09:00:00');

-- Section
INSERT INTO section VALUES
(401, 201, 301, 101, 'Room A'),
(402, 202, 303, 102, 'Room B'),
(403, 201, 305, 103, 'Room C');

-- Students
INSERT INTO student VALUES
(1, 'Tom', 'Holland', 'tom@example.com', '1234567890'),
(2, 'Mary', 'Jane', 'mary@example.com', '9876543210');

-- Registration
INSERT INTO registration VALUES
(1, 1, 401, '2024-01-15', 'active', 'B+', 'A'),
(2, 2, 402, '2024-01-17', 'active', 'A-', 'B');



SELECT 
    i.instructor_id AS "INSTRUCTOR ID",
    CONCAT(i.first_name, ' ', i.last_name) AS "FULL NAME",
    COUNT(DISTINCT s.day) AS "NUMBER OF WORKDAYS"
FROM instructor i
JOIN schedule s ON i.instructor_id = s.instructor_id
GROUP BY i.instructor_id, i.first_name, i.last_name;


create database ex;