


CREATE TABLE department (
    dept_id DECIMAL(10, 0) PRIMARY KEY,
    name VARCHAR(40)
);

CREATE TABLE instructor (
    instructor_id DECIMAL(10, 0) PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    type VARCHAR(40),
    dep_id DECIMAL(10, 0),
    FOREIGN KEY (dep_id) REFERENCES department(dept_id)
);

CREATE TABLE course (
    course_id DECIMAL(10, 0) PRIMARY KEY,
    name VARCHAR(40),
    dept_id DECIMAL(10, 0),
    term VARCHAR(10),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

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


drop table department;

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

CREATE TABLE student (
    student_id DECIMAL(10, 0) PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    email VARCHAR(100),
    phone VARCHAR(20)
);

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


create database a;

