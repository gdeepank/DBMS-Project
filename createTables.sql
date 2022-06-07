CREATE TABLE ADMINS (
	emp_id VARCHAR(9),
	ssn VARCHAR(9),
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	user_name VARCHAR(20),
	password VARCHAR(20),
	birth_date VARCHAR(10),
	PRIMARY KEY (emp_id)
);

CREATE TABLE STUDENTS (
	student_id VARCHAR(9),
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	user_name VARCHAR(20),
	password VARCHAR(20),
	email VARCHAR(20),
	age INT,
	birth_date VARCHAR(10),
	grade_level INTEGER,
	status VARCHAR(20),
	bill FLOAT,
	dept_id VARCHAR(3),
	courses VARCHAR(100),
	phone VARCHAR(20),
	address VARCHAR(100),
	PRIMARY KEY (student_id),
	CHECK (age>=18)
);

CREATE TABLE COURSES (
	course_id VARCHAR(10),
	title VARCHAR(20),
	credits INTEGER,
	dept_id VARCHAR(3),
	grade_level INTEGER,
	PRIMARY KEY (course_id)
);

CREATE TABLE SEMESTERS (
	course_id VARCHAR(10) REFERENCES COURSES (course_id),
	semester VARCHAR(10),
	year INTEGER,
	INSTR_NAME VARCHAR(100),
	class_size INTEGER,
	waitlist INTEGER,
	schedule VARCHAR(100),
	start_date VARCHAR(100),
	PRIMARY KEY (start_date)
);

CREATE TABLE INSTRUCTORS (
	INSTR_ID VARCHAR(10),
	INSTR_NAME VARCHAR(100),
	DEPT VARCHAR(10)
);

CREATE TABLE GRADING_SYSTEM (
	grade VARCHAR(2),
	points FLOAT,
	PRIMARY KEY (grade)
);

CREATE TABLE COSTS (
	grade_level integer,
	residency VARCHAR(100), 
	cost INTEGER,
	PRIMARY KEY (grade_level,residency)
);

CREATE TABLE CREDIT_LIMITS (
	grade_level integer, 
	residency VARCHAR(100), 
	min INTEGER NOT NULL, 
	max INTEGER NOT NULL,
	PRIMARY KEY (grade_level,residency),
	CONSTRAINT credit_check CHECK(min <= max)
);

CREATE TABLE PREREQUISITES (
	prereq_id VARCHAR(10),
	gpa FLOAT,  
	special VARCHAR(1),
	PRIMARY KEY (prereq_id)
	course_id VARCHAR(10) REFERENCES COURSES (course_id)
);

CREATE TABLE REQUESTS (
	student_id VARCHAR(10),
	course_id VARCHAR(10),
	submit_date VARCHAR(10),
	unit INTEGER,
	status VARCHAR(10),
	PRIMARY KEY (student_id, course_id)
);