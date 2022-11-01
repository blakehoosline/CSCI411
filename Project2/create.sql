create table person( 
pid integer,
name char(20),
primary key(pid));

create table student(
pid integer,
primary key(pid),
foreign key (pid) references person (pid));

create table professor(
pid integer,
primary key(pid),
foreign key (pid) references person (pid));

create table transcript(
tid integer,
gpa float,
primary key(tid));

CREATE TABLE email_address(
email char(30),
creation date,
primary key(email));

CREATE TABLE volunteer_work(
oid char(10),
organization char(30),
primary key(oid));

CREATE TABLE room(
room_number integer,
building char(30),
primary key(room_number, building));

CREATE TABLE course(
cid char(10),
section integer,
course_name char(40),
semester char(15),
primary key(cid, section));

CREATE TABLE final_exam(
eid char(10),
course_name char(40),
exam_date date,
exam_time char(10),
primary key(eid));

CREATE TABLE parking(
permit_id integer,
space_number integer,
car_model char(25),
lot_name char(25),
primary key(permit_id));

CREATE TABLE parks(
permit_id integer,
pid integer,
primary key(permit_id, pid),
foreign key (permit_id) references parking,
foreign key (pid) REFERENCES person);

CREATE TABLE volunteers(
pid integer,
oid char(10),
hours_worked integer,
primary key(pid, oid),
foreign key (oid) references volunteer_work,
foreign key (pid) references student);

CREATE TABLE assigned(
pid integer,
email char(30),
primary key(pid, email),
foreign key (email) references email_address,
foreign key (pid) references student);

CREATE TABLE views(
pid integer,
tid integer,
primary key(pid, tid),
foreign key (tid) references transcript,
foreign key (pid) references student);

CREATE TABLE teaches(
pid integer,
cid char(10),
section integer,
primary key(pid, cid, section),
foreign key (cid, section) references course,
foreign key (pid) references professor);

CREATE TABLE registers(
pid integer,
cid char(10),
section integer,
primary key(pid, cid, section),
foreign key (cid, section) references course,
foreign key (pid) references student);

CREATE TABLE schedules(
pid integer,
eid char(10),
exam_date date,
primary key(eid, pid),
foreign key (pid) references professor,
foreign key (eid) references final_exam);

CREATE TABLE takes(
eid char(10),
cid char(10),
section integer,
primary key(eid, cid, section),
foreign key (cid, section) references course,
foreign key (eid) references final_exam);

CREATE TABLE final_grade(
pid integer,
eid char(10),
grade char(5),
primary key(eid, pid),
foreign key (pid) references student,
foreign key (eid) references final_exam);

CREATE TABLE picks(
pid integer,
room_number integer,
building char(30),
primary key(pid, room_number, building),
foreign key (pid) references professor,
foreign key (room_number, building) references room);

CREATE TABLE assigned_to(
cid char(10),
section integer,
room_number integer,
building char(30),
primary key(cid, section, room_number, building),
foreign key (cid, section) references course,
foreign key (room_number, building) references room);


INSERT INTO person(pid,name)
VALUES(10005,'John');
INSERT INTO person(pid,name)
VALUES(10010,'Mark');
INSERT INTO person(pid,name)
VALUES(10015,'Mary');
INSERT INTO person(pid,name)
VALUES(10020,'Alice');
INSERT INTO person(pid,name)
VALUES(10025,'Sarah');
INSERT INTO person(pid,name)
VALUES(10030,'Jane');
INSERT INTO person(pid,name)
VALUES(10035,'Albert');
INSERT INTO person(pid,name)
VALUES(10080,'Winston');
INSERT INTO person(pid,name)
VALUES(10090,'Andrea');
INSERT INTO person(pid,name)
VALUES(10115,'Charlie');
INSERT INTO person(pid,name)
VALUES(12000,'Antonio');
INSERT INTO person(pid,name)
VALUES(13500,'Hannah');

INSERT INTO student(pid)
VALUES(12000);
INSERT INTO student(pid)
VALUES(10020);
INSERT INTO student(pid)
VALUES(10025);
INSERT INTO student(pid)
VALUES(10115);
INSERT INTO student(pid)
VALUES(10010);
INSERT INTO student(pid)
VALUES(10030);
INSERT INTO student(pid)
VALUES(10035);
INSERT INTO student(pid)
VALUES(10090);
INSERT INTO student(pid)
VALUES(13500);

INSERT INTO professor(pid)
VALUES(10005);
INSERT INTO professor(pid)
VALUES(10015);
INSERT INTO professor(pid)
VALUES(10080);

INSERT INTO transcript(tid, gpa)
VALUES(1001, 2.75);
INSERT INTO transcript(tid, gpa)
VALUES(1002, 3.49);
INSERT INTO transcript(tid, gpa)
VALUES(1003, 3.98);
INSERT INTO transcript(tid, gpa)
VALUES(1004, 1.99);
INSERT INTO transcript(tid, gpa)
VALUES(1005, 2.33);
INSERT INTO transcript(tid, gpa)
VALUES(1006, 1.66);
INSERT INTO transcript(tid, gpa)
VALUES(1007, 4.00);
INSERT INTO transcript(tid, gpa)
VALUES(1008, 3.33);
INSERT INTO transcript(tid, gpa)
VALUES(1009, 2.19);

INSERT INTO email_address(email, creation)
VALUES('Mark@SCSU.edu', TO_DATE('01-FEB-2022', 'DD-MON-YYYY'));
INSERT INTO email_address(email, creation)
VALUES('Alice@SCSU.edu', TO_DATE('28-AUG-2022', 'DD-MON-YYYY'));
INSERT INTO email_address(email, creation)
VALUES('Sarah@SCSU.edu', TO_DATE('11-Jan-2022', 'DD-MON-YYYY'));
INSERT INTO email_address(email, creation)
VALUES('Jane@SCSU.edu', TO_DATE('21-MAY-2021', 'DD-MON-YYYY'));
INSERT INTO email_address(email, creation)
VALUES('Albert@SCSU.edu', TO_DATE('01-MAR-2020', 'DD-MON-YYYY'));
INSERT INTO email_address(email, creation)
VALUES('Andrea@SCSU.edu', TO_DATE('04-JUL-2021', 'DD-MON-YYYY'));
INSERT INTO email_address(email, creation)
VALUES('Charlie@SCSU.edu', TO_DATE('14-JUL-2022', 'DD-MON-YYYY'));
INSERT INTO email_address(email, creation)
VALUES('Antonio@SCSU.edu', TO_DATE('01-JAN-2020', 'DD-MON-YYYY'));
INSERT INTO email_address(email, creation)
VALUES('Hannah@SCSU.edu', TO_DATE('11-MAR-2021', 'DD-MON-YYYY'));

INSERT INTO volunteer_work(oid, organization)
VALUES('ORG101', 'Humane Society');
INSERT INTO volunteer_work(oid, organization)
VALUES('ORG102', 'Salvation Army');
INSERT INTO volunteer_work(oid, organization)
VALUES('ORG103', 'Soup Kitchen');

INSERT INTO room(room_number, building)
VALUES(211, 'ECC');
INSERT INTO room(room_number, building)
VALUES(104, 'ISELF');
INSERT INTO room(room_number, building)
VALUES(217, 'EB');
INSERT INTO room(room_number, building)
VALUES(107, 'ECC');

INSERT INTO course(cid, section, course_name, semester)
VALUES('CSCI301', 1, 'Computer Science 2', 'Fall' );
INSERT INTO course(cid, section, course_name, semester)
VALUES('CSCI220', 1, 'Computer Architecture 2', 'Fall' );
INSERT INTO course(cid, section, course_name, semester)
VALUES('CSCI411', 1, 'Database Theory and Design', 'Spring');
INSERT INTO course(cid, section, course_name, semester)
VALUES('MATH221', 1, 'Calculus 1', 'Spring');

INSERT INTO final_exam(eid, course_name, exam_date, exam_time)
VALUES('E21', 'Database Theory and Design', TO_DATE('04-MAY-2023','DD-MON-YYYY'), '12:00:00');
INSERT INTO final_exam(eid, course_name, exam_date, exam_time)
VALUES('E11', 'Computer Science 2', TO_DATE('17-DEC-2022','DD-MON-YYYY'), '11:30:00');
INSERT INTO final_exam(eid, course_name, exam_date, exam_time)
VALUES('E12', 'Computer Architecture 2', TO_DATE('15-DEC-2022','DD-MON-YYYY'), '12:15:00');
INSERT INTO final_exam(eid, course_name, exam_date, exam_time)
VALUES('E22', 'Calculus 1', TO_DATE('06-MAY-2023','DD-MON-YYYY'), '08:30:00');

INSERT INTO parking(permit_id, space_number, car_model, lot_name)
VALUES(92080, 1, '2021 Ford Fusion', 'N Lot');
INSERT INTO parking(permit_id, space_number, car_model, lot_name)
VALUES(90370, 2, '2023 Toyota Camry', 'N Lot');
INSERT INTO parking(permit_id, space_number, car_model, lot_name)
VALUES(92099, 3, '2019 Honda Civic', 'N Lot');
INSERT INTO parking(permit_id, space_number, car_model, lot_name)
VALUES(92011, 4, '2015 Honda Accord', 'N Lot');
INSERT INTO parking(permit_id, space_number, car_model, lot_name)
VALUES(92321, 1, '2020 Chevrolet Suburban', 'E Lot');
INSERT INTO parking(permit_id, space_number, car_model, lot_name)
VALUES(92009, 2, '2013 Ford Escape', 'E Lot');
INSERT INTO parking(permit_id, space_number, car_model, lot_name)
VALUES(92001, 3, '2015 Mitsubishi Outlander', 'E Lot');
INSERT INTO parking(permit_id, space_number, car_model, lot_name)
VALUES(92077, 4, '2022 Toyota Tacoma', 'E Lot');
INSERT INTO parking(permit_id, space_number, car_model, lot_name)
VALUES(92399, 5, '2022 Tesla model 3', 'N Lot');
INSERT INTO parking(permit_id, space_number, car_model, lot_name)
VALUES(92173, 6, '2015 BMW X6 ', 'N Lot');
INSERT INTO parking(permit_id, space_number, car_model, lot_name)
VALUES(92999, 7, '2022 Ford Edge', 'N Lot');
INSERT INTO parking(permit_id, space_number, car_model, lot_name)
VALUES(92002, 8, '2017 Nissan Altima', 'N Lot');

INSERT INTO parks(permit_id, pid)
VALUES(92399, 10005);
INSERT INTO parks(permit_id, pid)
VALUES(92999, 10015);
INSERT INTO parks(permit_id, pid)
VALUES(92173, 10080);
INSERT INTO parks(permit_id, pid)
VALUES(92002, 10010);
INSERT INTO parks(permit_id, pid)
VALUES(92080, 10020);
INSERT INTO parks(permit_id, pid)
VALUES(90370, 10025);
INSERT INTO parks(permit_id, pid)
VALUES(92099, 10030);
INSERT INTO parks(permit_id, pid)
VALUES(92011, 10035);
INSERT INTO parks(permit_id, pid)
VALUES(92321, 10090);
INSERT INTO parks(permit_id, pid)
VALUES(92009, 10115);
INSERT INTO parks(permit_id, pid)
VALUES(92001, 12000);
INSERT INTO parks(permit_id, pid)
VALUES(92077, 13500);

INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(10010, 'ORG101', 2);
INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(10010, 'ORG102', 3);
INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(10020, 'ORG101', 11);
INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(10025, 'ORG103', 7);
INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(10030, 'ORG103', 2);
INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(10030, 'ORG101', 4);
INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(10030, 'ORG102', 9);
INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(10035, 'ORG101', 15);
INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(10035, 'ORG103', 2);
INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(10090, 'ORG102', 3);
INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(10090, 'ORG103', 3);
INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(10115, 'ORG102', 10);
INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(12000, 'ORG103', 13);
INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(13500, 'ORG103', 4);
INSERT INTO volunteers(pid, oid, hours_worked)
VALUES(13500, 'ORG101', 4);

INSERT INTO assigned(pid, email)
VALUES(10010, 'Mark@SCSU.edu');
INSERT INTO assigned(pid, email)
VALUES(10020, 'Alice@SCSU.edu');
INSERT INTO assigned(pid, email)
VALUES(10025, 'Sarah@SCSU.edu');
INSERT INTO assigned(pid, email)
VALUES(10030, 'Jane@SCSU.edu');
INSERT INTO assigned(pid, email)
VALUES(10035, 'Albert@SCSU.edu');
INSERT INTO assigned(pid, email)
VALUES(10090, 'Andrea@SCSU.edu');
INSERT INTO assigned(pid, email)
VALUES(10115, 'Charlie@SCSU.edu');
INSERT INTO assigned(pid, email)
VALUES(12000, 'Antonio@SCSU.edu');
INSERT INTO assigned(pid, email)
VALUES(13500, 'Hannah@SCSU.edu');

INSERT INTO views(pid, tid)
VALUES(10025, 1001);
INSERT INTO views(pid, tid)
VALUES(10035, 1002);
INSERT INTO views(pid, tid)
VALUES(10090, 1003);
INSERT INTO views(pid, tid)
VALUES(10115, 1004);
INSERT INTO views(pid, tid)
VALUES(12000, 1005);
INSERT INTO views(pid, tid)
VALUES(10030, 1006);
INSERT INTO views(pid, tid)
VALUES(13500, 1007);
INSERT INTO views(pid, tid)
VALUES(10010, 1008);
INSERT INTO views(pid, tid)
VALUES(10020, 1009);

INSERT INTO teaches(pid, cid, section)
VALUES(10005, 'CSCI301', 1);
INSERT INTO teaches(pid, cid, section)
VALUES(10015, 'CSCI220', 1);
INSERT INTO teaches(pid, cid, section)
VALUES(10015, 'CSCI411', 1);
INSERT INTO teaches(pid, cid, section)
VALUES(10080, 'MATH221', 1);

INSERT INTO registers(pid, cid, section)
VALUES(10010, 'CSCI301', 1);
INSERT INTO registers(pid, cid, section)
VALUES(10020, 'CSCI301', 1);
INSERT INTO registers(pid, cid, section)
VALUES(10025, 'CSCI220', 1);
INSERT INTO registers(pid, cid, section)
VALUES(10030, 'CSCI220', 1);
INSERT INTO registers(pid, cid, section)
VALUES(10035, 'CSCI220', 1);
INSERT INTO registers(pid, cid, section)
VALUES(10090, 'MATH221', 1);
INSERT INTO registers(pid, cid, section)
VALUES(10115, 'MATH221', 1);
INSERT INTO registers(pid, cid, section)
VALUES(12000, 'CSCI411', 1);
INSERT INTO registers(pid, cid, section)
VALUES(13500, 'CSCI301', 1);
INSERT INTO registers(pid, cid, section)
VALUES(13500, 'CSCI411', 1);
INSERT INTO registers(pid, cid, section)
VALUES(10020, 'MATH221', 1);
INSERT INTO registers(pid, cid, section)
VALUES(10010, 'CSCI411', 1);

INSERT INTO schedules(pid, eid, exam_date)
VALUES(10005, 'E11', TO_DATE('17-DEC-2022','DD-MON-YYYY'));
INSERT INTO schedules(pid, eid, exam_date)
VALUES(10015, 'E12', TO_DATE('15-DEC-2022','DD-MON-YYYY'));
INSERT INTO schedules(pid, eid, exam_date)
VALUES(10015, 'E21', TO_DATE('04-MAY-2023','DD-MON-YYYY'));
INSERT INTO schedules(pid, eid, exam_date)
VALUES(10080, 'E22', TO_DATE('06-MAY-2023','DD-MON-YYYY'));

INSERT INTO takes(eid, cid, section)
VALUES('E11', 'CSCI301', 1);
INSERT INTO takes(eid, cid, section)
VALUES('E12', 'CSCI220', 1);
INSERT INTO takes(eid, cid, section)
VALUES('E21', 'CSCI411', 1);
INSERT INTO takes(eid, cid, section)
VALUES('E22', 'MATH221', 1);

INSERT INTO final_grade(pid, eid, grade)
VALUES(10010, 'E11', 'D');
INSERT INTO final_grade(pid, eid, grade)
VALUES(10010, 'E21', 'A');
INSERT INTO final_grade(pid, eid, grade)
VALUES(10020, 'E11', 'C');
INSERT INTO final_grade(pid, eid, grade)
VALUES(10020, 'E22', 'B');
INSERT INTO final_grade(pid, eid, grade)
VALUES(10025, 'E12', 'A');
INSERT INTO final_grade(pid, eid, grade)
VALUES(10030, 'E12', 'B');
INSERT INTO final_grade(pid, eid, grade)
VALUES(10035, 'E12', 'A');
INSERT INTO final_grade(pid, eid, grade)
VALUES(10090, 'E22', 'F');
INSERT INTO final_grade(pid, eid, grade)
VALUES(10115, 'E22', 'A');
INSERT INTO final_grade(pid, eid, grade)
VALUES(12000, 'E21', 'A');
INSERT INTO final_grade(pid, eid, grade)
VALUES(13500, 'E11', 'A');
INSERT INTO final_grade(pid, eid, grade)
VALUES(13500, 'E21', 'A');

INSERT INTO picks(pid, room_number, building)
VALUES(10005, 211, 'ECC');
INSERT INTO picks(pid, room_number, building)
VALUES(10015, 217, 'EB');
INSERT INTO picks(pid, room_number, building)
VALUES(10015, 104, 'ISELF');
INSERT INTO picks(pid, room_number, building)
VALUES(10080, 107, 'ECC');

INSERT INTO assigned_to(cid, section, room_number, building)
VALUES('CSCI301', 1, 211, 'ECC');
INSERT INTO assigned_to(cid, section, room_number, building)
VALUES('CSCI220', 1, 217, 'EB');
INSERT INTO assigned_to(cid, section, room_number, building)
VALUES('CSCI411', 1, 104, 'ISELF');
INSERT INTO assigned_to(cid, section, room_number, building)
VALUES('MATH221', 1, 107, 'ECC');
