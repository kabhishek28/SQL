-- Create department first (no dependencies)
CREATE TABLE department (
    dept_id DECIMAL(10, 0) PRIMARY KEY,
    name VARCHAR(40)
);

-- Create instructor next (depends on department)
CREATE TABLE instructor (
    instructor_id DECIMAL(10, 0) PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    type VARCHAR(40),
    dep_id DECIMAL(10, 0),
    FOREIGN KEY (dep_id) REFERENCES department(dept_id)
);

-- Create course (depends on department)
CREATE TABLE course (
    course_id DECIMAL(10, 0) PRIMARY KEY,
    name VARCHAR(40),
    dept_id DECIMAL(10, 0),
    term VARCHAR(10),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- ✅ Create schedule BEFORE section (because section refers to schedule)
CREATE TABLE schedule (
    schedule_id DECIMAL(10, 0) PRIMARY KEY,
    course_id DECIMAL(10, 0),
    section_id DECIMAL(10, 0),
    instructor_id DECIMAL(10, 0),
    day VARCHAR(20),
    starttime TIME,
    endtime TIME,
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

-- Now create section (safe now because all referenced tables exist)
CREATE TABLE section (
    section_id DECIMAL(10, 0) PRIMARY KEY,
    course_id DECIMAL(10, 0),
    schedule_id DECIMAL(10, 0),
    instructor_id DECIMAL(10, 0),
    room VARCHAR(20),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(schedule_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

-- Create student (no dependencies)
CREATE TABLE student (
    student_id DECIMAL(10, 0) PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Create registration (depends on student and section)
CREATE TABLE registration (
    reg_id DECIMAL(10, 0) PRIMARY KEY,
    student_id DECIMAL(10, 0),
    section_id DECIMAL(10, 0),
    reg_date DATE,
    status VARCHAR(10),
    midterm_grade VARCHAR(10),
    fullterm_grade VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (section_id) REFERENCES section(section_id)
);


INSERT INTO department (dept_id, name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics');


INSERT INTO instructor (instructor_id, first_name, last_name, type, dep_id) VALUES
(101, 'Alice', 'Johnson', 'Full-time', 1),
(102, 'Bob', 'Smith', 'Part-time', 2),
(103, 'Carol', 'Williams', 'Full-time', 3);



INSERT INTO course (course_id, name, dept_id, term) VALUES
(201, 'Data Structures', 1, 'Fall'),
(202, 'Calculus I', 2, 'Spring'),
(203, 'Quantum Mechanics', 3, 'Fall');

INSERT INTO schedule (schedule_id, course_id, section_id, instructor_id, day, starttime, endtime) VALUES
(301, 201, 401, 101, 'Monday', '09:00:00', '10:30:00'),
(302, 202, 402, 102, 'Tuesday', '11:00:00', '12:30:00'),
(303, 203, 403, 103, 'Wednesday', '13:00:00', '14:30:00');

INSERT INTO registration (reg_id, student_id, section_id, reg_date, status, midterm_grade, fullterm_grade) VALUES
(601, 501, 401, '2025-01-15', 'Active', 'A', 'A'),
(602, 502, 402, '2025-01-16', 'Active', 'B', 'B+'),
(603, 503, 403, '2025-01-17', 'Active', 'A-', 'A');


INSERT INTO instructor (instructor_id, first_name, last_name, type, dep_id) VALUES
(101, 'Alice', 'Johnson', 'Full-time', 1),
(102, 'Bob', 'Smith', 'Part-time', 2),
(103, 'Carol', 'Williams', 'Full-time', 3);

INSERT INTO department (dept_id, name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics');
SELECT 
    i.instructor_id AS "INSTRUCTOR ID",
    CONCAT(i.first_name, ' ', i.last_name) AS "FULL NAME",
    COUNT(DISTINCT s.day) AS "NUMBER OF WORKDAYS"
FROM 
    instructor i
JOIN 
    schedule s ON i.instructor_id = s.instructor_id
GROUP BY 
    i.instructor_id, i.first_name, i.last_name;

