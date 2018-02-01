-- David Willmore DB Schema Tutor Finder

CREATE TABLE Tutor(
	tutorId INTEGER AUTO_INCREMENT,
	lastName VARCHAR(20),
	firstName VARCHAR(20),
	summary VARCHAR(250), -- text type is too big 
  	availability VARCHAR(250),
  	PRIMARY KEY(tutorId));

CREATE TABLE Student(
	studentId INTEGER AUTO_INCREMENT,
	lastName VARCHAR(20),
	firstName VARCHAR(20),
	summary VARCHAR(250), -- text type is too big 
 	availability VARCHAR(250),
    	PRIMARY KEY(studentId));

-- Test Cases and how do I handle escape sequences when I get user input and assign it? Figure that out!
insert into Tutor values(1,'Willmore','David','Hi, I can tutor classes.','And I can do it on some different days of the week.');

insert into Student values(1,'Jameson','James','Hi, I need help with my programming classes.','I just can\'t do it on that day.');

		