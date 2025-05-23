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
    day VARCHAR(10),
    starttime TIME,
    endtime TIME
);


-- Instructors
INSERT INTO instructor (instructor_id, first_name, last_name, type, dep_id) VALUES
(1, 'John', 'Doe', 'Full-Time', 101),
(2, 'Jane', 'Smith', 'Part-Time', 102),
(3, 'Alice', 'Brown', 'Full-Time', 103);

-- Schedule
INSERT INTO schedule (schedule_id, course_id, section_id, instructor_id, day, starttime, endtime) VALUES
(101, 201, 301, 1, 'Monday', '09:00:00', '10:00:00'),
(102, 202, 301, 1, 'Wednesday', '11:00:00', '12:00:00'),
(103, 203, 302, 1, 'Friday', '10:00:00', '11:00:00'),
(104, 204, 303, 2, 'Tuesday', '09:00:00', '10:00:00'),
(105, 205, 304, 2, 'Thursday', '10:00:00', '11:00:00'),
(106, 206, 305, 3, 'Monday', '08:00:00', '09:00:00');



SELECT 
    i.instructor_id AS "INSTRUCTOR ID",
    CONCAT(i.first_name, ' ', i.last_name) AS "FULL NAME",
    COUNT(DISTINCT s.day) AS "NUMBER OF WORKDAYS"
FROM instructor i
JOIN schedule s ON i.instructor_id = s.instructor_id
GROUP BY i.instructor_id, i.first_name, i.last_name;

